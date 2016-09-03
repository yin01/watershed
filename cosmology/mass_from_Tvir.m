%% This gives the halo mass from the virial temperature
%% mass is in M_solar (NOT M_solar h^-1)

%%% 12 March 2005. This was changed so to correspond to the plots in FHZ
%%


function y=mass_from_Tvir(T,z) 
cosmological_parameters
%{

zfactor=((1+z)./10).^(-1.5);
Tfactor=(T./1.e4).^(1.5);



%%%y=9.4198e7.*zfactor.*Tfactor;  %%% for fully ionized gas

%%%y=((0.6/1.22)^1.5)*9.4198e7.*zfactor.*Tfactor;  %% for neutral gas

%%%y=8.56e7.*zfactor.*Tfactor;

%y=4.5e7.*zfactor.*Tfactor;
%}

%{
%from Hu's note
%http://background.uchicago.edu/~whu/Courses/Ast321_11/ast321_7.pdf
Tfactor =T./ (1.16e7);
zfactor = ((1+z)*(Omega_m*178.).^(1/3)).^(-1);
y = 1.e15  * (0.75 * Tfactor .* zfactor).^(1.5) / h;
%}

%y= (T * (1/(4.8e-3)) * (1/(1+z)) * (0.3/Omega_m)^(1/3) * (0.61/0.62))^(3/2)

%Source: Barkana & Loeb 2001 Physics Reports

Omz = Omega_m * (1+z).^3 ./ (Omega_m.*(1+z).^3 + Omega_lambda);
d = Omz - 1;
delta_c = 18*pi^2 + 82.*d - 39.*d.^2;

mu = 0.59; %mean molecular weight for fully ionized gas
y = (T .* (1/(1.98e4)) .* (0.6/mu) * (10./(1+z)) .* (18*pi.^2 .* Omz./(Omega_m .* delta_c)).^(1/3)).^(3/2) .* 1e8 / h;

