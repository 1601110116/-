clear all; close all
%addpath ~/Desktop/GPU_Report/nsrc3d_parallel_both_fix_free_cpu/code_pi
addpath '/home/ylang/Documents/Research/L-H transition/李鹏飞/code_pi_fullp'
global nx0 ny0 nz lam bz alpha  shat arho dif difz tau nx2 both cold balloon  difw flux0... 
p_right p_left n_right n_left  nustar %RLp %difui % difs nxs sigma
%Rho rho aR arho
%sigma=1;sigma=0.1;%loss
%dvb=0;

p_left=1.2;
p_right=0.7;
vbias=0;
n_right=0.7;
n_left=1.2;
nustar=1000;



restart=0;
%restart=1;
%RLp=2;RLp=1;%R/Lp, growth rate
amp=0.1;
amp=0.;
%flux0=1e-3;
flux0=0;
%tau=.01;%linear
%tau=.005;
tau=.004;
%tau=.001;%nonlinear

dif=1;%nonlinear
dif=0.5;%linear
dif_distribute=1;
%dif=2;%nonlinear,pi,open

alpha=0.002;%alpha=1;%DW
%alpha=0.1;
%arho=500;%arho=Rho=a/rhos 
arho=200;
arho=400;
arho=100;

sn=.1; sp=.2;%nonlinear,open
sn=0.01;sp=0.02;   %linear,close
%sp=.4;
%sp=.3;
%sp=.1;

%difH=5;%difH=1;
xs=0;xw=3;
%xw=2;

cold=1;%pi=0
cold=0;%with pi
both=0;%close only
both=1;%both, add open
balloon=0;shat=0;%2d,interchange
balloon=1;shat=0;%balloon

nz=3;%2d
nz=18; %3d

%ntp=20;  nts=30;%nonlinear
ntp=200;  nts=150;%linear
%ntp=10;    nts=10; %start
%ntp=1;    nts=1; %start

alx=50;nx0=128;

aly=200;ny0=512;
alx=75;nx0=192;
aly=25;ny0=64;%2d,interchange
aly=200;ny0=256;%balloon



xsb=alx/2;xwb=3;
%nx=nx0+2;nxb=nx0-5;nxb=nx0+1;
%nxs=round(2*nx0*xw/alx);
%ns=nxs;ns=2;
%nx=nx0+2;
nx2=nx0/2;     %nx_sol=nx/2;
%bn=1;bt=1;


%lam=3;%open
lam=0;
%R=68;a=22;
%Rho=68.5/.02; Rho=50;Rho=1000;
%rho=1/Rho;
aR=0.3; %0.3   a/R
%aR=1; %2d, L_0=R
curvature=1;
%curvature=0;%DW
pert=1.e-6; 
bz=1;
difz=0.1;
%difz=0.2;%nan in z
%difui=1;
%difw=2;
difw=1;
%difs=10;difs=1;


scmod;
showt_3d;
%showt_2d;

%scmod;showtime
%save data2 lam tau nts ntp nz nx ny alx aly pert xs xw xmin xmax xb dif vbias Rho bz sn

