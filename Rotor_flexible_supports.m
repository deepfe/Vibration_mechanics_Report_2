clear 
close all
clc

%% MECHANICAL PROPERTIES
rho_al=2700;    %aluminium density kg/m^3
rho_steel=7800; %steel density kg/m^3
E_steel=200*10^6;   %Young modulus steel in MPa

%system geometry
a=110;
b=150;

%disk
d_disk=150;     %diameters in mm
h_disk=10;      %heigth in mm
v_disk=h_disk*pi*(d_disk^2)/4;    %volume in mm^3
mass_disk=v_disk*rho_al/10^9;   %mass of the disk
I_disk=mass_disk*(d_disk^2)/16/10^6;    %moment of inertia kg m^2


%plate
a_plate=110;          %base in mm
b_plate=100;          %length in mm
h=15;           %heigth in mm
v_plate=a_plate*b_plate*h;  %volume of the plate in mm^3
mass_plate=rho_al*v_plate/10^9;     %mass in kg
I_plate=mass_plate*(a_plate^2+h^2)/12/10^6; %moment of inertia kg m^2


%shaft
d_shaft=20;                          %diameter in mm
l_shaft=350;                               %length in mm
v_shaft=l_shaft*pi*(d_shaft^2)/4;          %volume in mm^3
mass_shaft=rho_steel*v_shaft/10^9;   %mass in kg
I_shaft=mass_shaft*(l_shaft^2)/12/10^6;     %moment of inertia kg m^2

%rod
d_rod=15;       %diameter in mm
l_rod=200;          %length in mm
v_rod=pi*l_rod*(d_rod^2)/4; %volume in mm^3
mass_rod=rho_steel*v_rod/10^9;  %mass in kg
I_rod=mass_rod*(l_rod^2)/12/10^6;   %moment of inertia kg m^2

%thin beam
l_beam=144;     %length in mm
b_beam=15;      %section in mm
h_beam=1.2;     %section in mm
k=(12*E_steel*((b_beam*h_beam^3)/12))/l_beam^3;
k_t=2530;       %torsional stiffness, FEM
%% NATURAL FREQUENCIES

omega_t=sqrt((4*k)/(2*mass_disk+2*mass_plate+mass_shaft));      %
frequency_t=omega_t/(2*pi);

omega_r=sqrt((k_t+4*k*((a/1000)^2))/(2*I_disk+2*I_plate+I_shaft+2*mass_plate*((a/1000)^2)+2*mass_disk*((b/1000)^2)));
frequency_r=omega_r/(2*pi);