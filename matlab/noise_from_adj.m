%%% make new noise vector by combining noise from adjacent pixels

function y=noise_from_adj(input_noise)
  
npix=length(input_noise);

shiftup=zeros(npix+1,1);
shiftdn=zeros(npix+1,1);

shiftup(1)=input_noise(1);
shiftup(2:end)=input_noise;

shiftdn(end-1:end)=input_noise(end-1:end);
shiftdn(1:end-2)=input_noise(2:end);

new_noise=sqrt((shiftdn.^2+shiftup.^2).*0.5);
%%%new_noise=(shiftdn+shiftup).*0.5;

%%%y=new_noise(1:end-1);

y=input_noise;