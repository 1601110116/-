clear all; close all;
addpath D:\zhouao\code_pi
addpath D:\zhouao\code_pi\plot
global nx0 ny0 nz lam bz alpha shat arho dif difz tau nx2 both cold

restart=0;
% restart=1;

% cold=2;	%pi=0
cold=0;		%with pi

% both=0;		%close only
both=2;		%both

curvature=1;
% curvature=0;	%DW

balloon=0;shat=0;	%2d,interchange
%balloon=1;shat=1;	%balloon

alpha=0.001;
%alpha=0.1;
%alpha=1;	%DW

% lam=3;	%open
lam=0;

nz=3;%2d
%nz=18; %3d

%aR=a/R; %0.3
aR=1; %2d, L_0=R
arho=500;%arho=Rho=a/rhos

difz=0.1;

tau=.001;%nonlinear
%tau=.01;%linear
%tau=.005;
%tau=.0025;

% ntp=20;  nts=30;%nonlinear
% ntp=40;  nts=20;%linear
ntp=1;    nts=1; %start

% alx=50;nx0=128;
% aly=50;ny0=128;
% aly=200;ny0=512;
alx=25;nx0=64;
aly=25;ny0=64;


dif=1;%linear
%dif=2;%nonlinear,pi,open
%dif=3;


sn=.1; sp=.2;%nonlinear,open
%sn=0;sp=0;   %linear,close
% sp=.4;
%sp=.3;

xs=0;
xw=3;


nx2=nx0/2;     %nx_sol=nx/2;


%bn=1;bt=1;

pert=1.e-6;
bz=1;

scmod_p;
%showt_3d;
showt_2d;
showpro2;
