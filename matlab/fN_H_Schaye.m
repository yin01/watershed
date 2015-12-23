%%% This computes the fN distribution of hydrogen
%%%% Assuming there is NO ionizing background
%%% careful: the Jacobian delta_dNHI changes when 

function y=fN_H_Schaye(NH,z,T)
cosmological_parameters
  
x_i=1.;
NH_factor=(NH./2.3e19);
Tfactor=T./1.e4;
zfactor=(1+z)./7;
ddelta_dNH=6./(2.3e19)*(x_i.^2).*(NH_factor)./zfactor./Tfactor;
delta=3.*(x_i^2).*(NH./2.3e19)/zfactor/Tfactor;

LHS=Omega_b.*delta.*P_delta_final(delta,z).*ddelta_dNH;
RHS=8.*pi*G_const.*m_p_const./(3.*2.3333e-18*3.e10.*(1-0.24)).*NH;

y=LHS./RHS;