%%%%%  mean flux with inverse variance weighting

function y=mean_inv_var(index,flux,noise)

inv_var=(1./noise).^2;
weights=inv_var/sum(inv_var);
mn=sum(flux(index).*weights(index))/sum(weights(index));
%%%%mn=mean(flux(index));
std=sqrt(1./sum(inv_var(index)));

y=[mn; std];