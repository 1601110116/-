clear all; close all
addpath ~/Desktop/GPU_Report/nsrc3d_parallel_both_fix_free_cpu/code_pi
global nx0 ny0 nz lam bz  alpha  shat arho dif difz tau nx2 both cold %difH nxs sigma
%Rho rho aR arho
%sigma=1;sigma=0.1;%loss

restart=0;
%restart=1;

tau=.001;%nonlinear
tau=.01;%linear
%tau=.005;tau=.002;

dif=1;%linear
%dif=2;%nonlinear,pi,open
%dif=3;
sn=.1; sp=.2;%nonlinear,open, helimak
%sn=0;sp=0;   %linear,close
sp=.3;
%sp=.3;sp=.1;
%difH=3;
%sp=0.4;
%difH=5;
%difH=1;%sp=0.2
xs=0;xw=3;
%xw=2;

cold=2;%pi=0
%cold=0;%with pi
both=0;%close only
both=1;%both, add open
nx2=nx0/2;     %nx_sol=nx/2;tokamak

balloon=0;shat=0;%2d,interchange
%balloon=1;shat=1;%balloon

nz=3;%2d
%nz=18; %3d

%ntp=20;  nts=30;%nonlinear
ntp=40;  nts=10;%linear
ntp=1;    nts=1; %start

alx=50;nx0=128;
aly=50;ny0=128;
aly=200;ny0=512;
alx=25;nx0=64;
aly=25;ny0=64;

xs=alx/4;xw=3;%helimak
nx2=1;%all open.helimak

%nxs=2*nx0*xw/alx;
%nxs=round(nxs)
%nx=nx0+2;


%sn=.05;
%bn=1;bt=1;
%nz=3;
pert=1.e-6; 
bz=1;
alpha=0.001;
%alpha=1;%DW
%alpha=0.1;
lam=3;%open
lam=0;
%R=68;a=22;
%Rho=68.5/.02; Rho=50;Rho=1000;
%rho=1/Rho;
%aR=a/R; %0.3
aR=1; %2d, L_0=R
arho=500;%arho=Rho=a/rhos 
arho=100;
arho=200;
curvature=1;
%curvature=0;%DW

difz=0.1;



scmod;
%showt_3d;
%showt_2d;

%scmod;showtime
%save data2 lam tau nts ntp nz nx ny alx aly pert xs xw xmin xmax xb dif vbias Rho bz sn

