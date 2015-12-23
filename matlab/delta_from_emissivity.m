
%%%% given a certain emissivity emiss (in # ionizing photons/baryon/Gyr),
%calculate the overdensity to which the medium is ionized up to

function y=delta_from_emissivity(emiss,z)
global R_global z_global

%% turn into recombinations per baryon per Hubble time
R=emiss.*(t_H(z)./1.e9);

if length(emiss)>=length(z)   %%% array over emissivity
  
  npts=length(emiss);
  y=zeros(size(emiss));
  z_global=z;

  for i=1:npts
    R_global=R(i);
    y(i)=exp(fzero(@delta_from_emissivity_func,log(0.05),log(300.)));  
  end  
  
end

if length(z) > length(emiss)
  
  npts=length(z);
  y=zeros(size(z));

  for i=1:npts
    z_global=z(i);
    R_global=R(i);
    y(i)=exp(fzero(@delta_from_emissivity_func,log(0.05),log(300.)));  
  end  
  
end
   
function y=delta_from_emissivity_func(lgdelta)
global R_global z_global

  delta=exp(lgdelta);
  y=recombination_rate_from_delta(delta,z_global)-R_global;