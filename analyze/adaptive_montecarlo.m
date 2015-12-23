%Rejection sampling of excursion set distribution at given redshift
%The problem first segment the excursion into a  given number of fitted
%exponential segments. Then we random sample over this number of
%segments to determine which exponential we are working with. Within the
%exponential, we use standard rejection sampling technique to obtain the
%value.
%
%
%To use this effectively, there are 3 variables needed to be adjusted
%in each run: z14(redshift), startingPoint, endPoint.
%redshift is self-explanatory; for startingPoint, it might be useful to set
%it lower than the resolution of the box you are interested in, sometimes
%it has bug where a kink appears in the final distribution for values close
%to starting point. The reason is still unknown.
%endPoint can be simply set a value where the excursion set is essentially
%zero.


%initialize excursion set
disp('Initializing Excursion Set...')
addpath('../cosmology');
addpath('../matlab');
initialize_cosmology;
initialize_sigmaM_spline;
initialize_FHZ;

%calculate excursion set formula and normalize it
z14 = 11.65; 
noIterations = 1000000;
startingPoint = 0.1;
endPoint = 30;
R14 = linspace(startingPoint,endPoint,10000000);
mass14= mass_from_R_comoving(R14);
f14=V_comoving_from_M(mass14).*mass14.*dNdM_FHZ(mass14,z14).*3
ionizedFrac_excur = trapz(R14,f14./R14);
dNdR = dNdM_FHZ(mass14,z14) .* (R14.*R14);
normdNdR = trapz(R14,dNdR);    %normalization factor
dNdR = dNdR ./ normdNdR;


disp('Constructing envelope functions...')
interval = [startingPoint,0.5]; %the interval in which we construct multiple lines
numberSeg = 100; %number of line segements to contruct in the interval.
endPoints = [linspace(interval(1),interval(2),numberSeg+1),endPoint]; %need to include the end point of 10
expCoeffCell = {}; %initialize cell array for coefficient
%now we calculate the probability for each line segment
numberSeg = numberSeg + 1; %The extra one is from the interval which we didnt include 
probArray = zeros(1,numberSeg);

%the probability density of excursion set is separated into tiny line
%segements each line segment is then fitted by a exponential 
while loop < numberSeg
    loop = loop+1;
    leftPoint = endPoints(loop);
    rightPoint = endPoints(loop+1);
    massPoint1 = mass_from_R_comoving(leftPoint);
    massPoint2 = mass_from_R_comoving(rightPoint);
    
    %calculate the probability for each particular segment
    R = linspace(leftPoint,rightPoint,1000000);
    massR = mass_from_R_comoving(R);
    probArray(loop) = trapz(R,dNdM_FHZ(massR,z14) .* (R.*R)./normdNdR);
    
    %calculate the coefficients for fitting exponentials
    coeff = polyfit([leftPoint,rightPoint],...
            [log(dNdM_FHZ(massPoint1,z14) * (leftPoint*leftPoint)/normdNdR),...
            log(dNdM_FHZ(massPoint2,z14) * (rightPoint*rightPoint/normdNdR))],1);
    coeff(2) = exp(coeff(2)); %convert back to exponential
    
    expCoeffCell{loop} = coeff;   
end
ionizedFrac = 0;
tic
%sample the point until the desire ionization fraction is achieved
%note that this ionizedFrac is only approximate, it certainly will
%overshoot the ionization fraction we try to achieve since each sampling
%process is discretized into numberSeg. 
while ionizedFrac < Q_filling_factor(z14)*100,

    %random sample to determine which exponential segmentment to work with
    choices = randsample(linspace(1,numberSeg,numberSeg),noIterations,true,probArray);
    disp('Calculate Rejecting Samples...')
    counter = 0;
    expArrayCell = {}; %initialize the cellarray for exponential
    lengthOfAccept = 0;

    while counter < numberSeg
       counter = counter + 1;
       leftPoint = endPoints(counter);
       rightPoint = endPoints(counter+1);
       %count the number of occurance for this particular piece
       noOcc = sum(choices==counter);
       coeffs = cell2mat(expCoeffCell(counter));
       coeffMu = coeffs(1);
       coeffNorm = coeffs(2);
       addedList = [];
       while length(addedList) < noOcc,
           expRandList = [];
           %iteration method to sample point within the given range of the exp func
           while length(expRandList)<noOcc
               expRandList = [expRandList,exprnd(-1/coeffMu,[1,noOcc])];
               %eliminate any entries that are not in range.
               expRandList = expRandList(expRandList>=leftPoint&expRandList<=rightPoint);
           end

           expRandList = expRandList(1:noOcc);
           randNoList = rand(1,noOcc); %generate a list of random number in [0,1]

           %compute the value of exponential at those random sampled points and
           %multiply by a random number in [0,1] as required by the sampling method
           expValueList = coeffNorm.*exp(expRandList.*coeffMu).*rand(1,noOcc);

           %compute excursion set value
           excurValueList = dNdM_FHZ(mass_from_R_comoving(expRandList),z14) .*(expRandList.^2)./normdNdR;

           %append the radius list for those satified the rejection sampling
           %conditions.
           addedList = [addedList,expRandList(expValueList<excurValueList)];     
       end
       addedList = addedList(1:noOcc);
       randList = [randList,addedList];
       lengthOfAccept = lengthOfAccept + length(addedList);
    end
    
    rejectionRate = 1-(lengthOfAccept/noIterations)
    ionizedFrac = sum((4./3).*pi.*randList.^3)/100^3
end
