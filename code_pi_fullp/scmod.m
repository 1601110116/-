global  nx ny nz wi w vex vey  phi den deni te pe tei pei ...
dy1p5 dx1p5 dyt1p5 dxt1p5 dtx dty source   ...
Ax  api  pii  shat phi2 ...
cxk cyk dyt1p jz  vii vi  dzt1p5   dtz    ak2 aky Dx  nustar vb bc_left bc_right 
%dx
%dtz1 X3 source2  dxt1p dx_2 dy_2 dz1p5 phase c vkysq dtxsq dtysq bc lam 


z=zeros(1,nz);
%z=zeros(nz,1);
sz2=z;
%cx=z;cy=z;
cx=zeros(1,1,nz);cy=cx;

dz=1./(nz-2);
for k=1:nz
    %z(k)=dz*(k-2);  %outside z=2
    z(k)=dz*(k-2)-0.25;  %bottom
    % z(k)=dz*(k-2)-0.5;  %inside
    ph=balloon*2*pi*z(k);        %ph=theta
    sz2(k)=ph*shat;
    cx(k)=sin(ph);
    cy(k)=cos(ph)+sz2(k)*sin(ph);
end
q=3;Lz=2*pi*q;
sigma=aR/(Lz);
%q=3;sigma=aR*tau/(2*pi*q);
%dtz1=sigma*alpha*tau/(dz^2);
%dz1p5=alpha/(2.*dz);%sbdel2
dzt1p5=sigma*tau/(2.*dz);
nustar=alpha/sigma;
dtz=difz*tau/(dz^2);


nx=nx0+2;
ny=ny0+2;
dx=alx/(nx-1);
bc_left=p_left/dx^2;%full p
bc_right=p_right/dx^2;

dy=aly/(ny0);
dxt1p5=arho*tau/(2.*dx);
dyt1p5=arho*tau/(2.*dy);

dxt1p=-curvature*2.0*bz*aR*tau/(2.*dx);
dyt1p=-curvature*2.0*bz*aR*tau/(2.*dy);


cy=cy*dyt1p;
cx=cx*dxt1p;
cyk = repmat(cy,[nx,ny,1]);
cxk = repmat(cx,[nx,ny,1]);
%sz2y = repmat(sz2',[ny,1]);
sz2y = repmat(sz2,[ny,1]);



dx1p5=1./(2.*dx);
dy1p5=1./(2.*dy);
dtx=dif*tau/(dx^2);
dty=dif*tau/(dy^2);
%dx_2=1./(dx^2);dy_2=1./(dy^2);
dtdx=tau/dx;
%dtxsq=tau/(dx^2);dtysq=tau/(dy^2);


% Ax Dx are in cpu memory
Ax=2*eye(nx0)-diag(ones(nx0-1,1),1)-diag(ones(nx0-1,1),-1);%fix
Dx=0*eye(nx0)-diag(ones(nx0-1,1),1)+diag(ones(nx0-1,1),-1);

%nx1=nx-1;%free
%Ax=2*eye(nx1)-diag(ones(nx1-1,1),1)-diag(ones(nx1-1,1),-1);%free
%Dx=0*eye(nx1)-diag(ones(nx1-1,1),1)+diag(ones(nx1-1,1),-1);
%Ax(1,1)=1; Dx(1,1)=1; %left-bc free


Ax=Ax/dx^2;
c=sqrt(-1);
Dx=Dx*c/dx;
Dx=sparse(Dx);
Ax=sparse(Ax);

x=zeros(nx,1);
s=x;
svb=x;
%s2=x;
for i=1:nx
   % x3(i)=dx*(i-1)/alx;
    x(i)=dx*(i-2);
    s(i)=tau*sp*exp(-((x(i)-xs)/xw)^2 );
   % s2(i)=tau*sn*exp(-((x(i)-xs)/xw)^2 );
   svb(i)=vbias*exp(-((x(i)-xsb)/xwb)^2 );
   %svb(i)=vbias*0.5*(tanh((x(i)-xmin)/xb) +tanh((xmax-x(i))/xb));
end
source = repmat(s,[1,ny,nz]);
%source2 = repmat(s2,[1,ny,nz]);
%X3=repmat(x3',[1,ny,nz]);
vb = repmat(svb,[1,ny,nz]);
 %plot(svb);
 %hold;
 %plot(s/tau,'r');
 %print(gcf,'-dpng',['bias_sp','.png'])

ny02=ny0/2;
pi2=2.*pi;
pi2y=pi2/aly;
vkysq=zeros(ny,1);
vky=zeros(ny,1);
for j=1:ny02+1
    vky(j)=pi2y*(j-1);
    vkysq(j)=vky(j)^2;
end
for j=ny02+2:ny0
    jj=j-ny0;
    vky(j)=pi2y*(jj-1);
    vkysq(j)=vky(j)^2;
end

vkyz = repmat(vky,[1,nz]);
vkysqz = repmat(vkysq,[1,nz]);


ak2=zeros(ny,nz);
ak2(1:ny0,1:nz)=vkysqz(1:ny0,1:nz).*(1+sz2y(1:ny0,1:nz).^2);

aky=zeros(ny,nz);
aky(1:ny0,1:nz)=vkyz(1:ny0,1:nz).*sz2y(1:ny0,1:nz);


x2=zeros(nx,1);
for i=1:nx
    x2(i)=dx*(i-1)-alx/2;
end
x2y = repmat(x2,[1,ny]);
vkyx = repmat(vky',[nx,1]);
phase=zeros(nx,ny);
%phase(1:nx0,1:ny0)=-pi2*shat*vkyx(1:nx0,1:ny0).*x2y(2:nx0+1,1:ny0);

% Initialization
wi=zeros(nx,ny,nz);
%phi2=wi;
vex=wi;
vey=wi;
jz=wi;
vii=wi;
nve=wi;
ve=wi;
pii=wi;

tei=ones(nx,ny,nz);
deni=tei;
phi=tei*lam;
pei=tei;


% phi2=phi+pei;

%pei=wi;%p=ptilde

if (restart == 0)
      for k=2:nz-1 
      for j=2:ny-1
      for i=2:nx-1     
          
      %for k=1:nz 
      %for j=1:ny
      %for i=1:nx
     % pei(i,j,k)=pert*rand;
      pei(i,j,k)=1.+pert*rand+amp*exp(-((x(i)-xs)/xw)^2 ); 
      
      %pei(i,j,k)=1.+pert*rand+amp-(amp/xw)*x(i);
  %    pei(i,j,k)=1.+pert*rand+0.1*exp(-((x(i)-xs)/xw)^2 ); 
           %deni(i,j,k)=1.+pert*rand+0.3*(1.-tanh((x(i)-xs)/xw));     
      end
      end
      end
    
 % pei(2:nx-1,2:ny-1,2:nz-1)=ones(nx-2,ny-2,nz-2)+pert.*rand(nx-2,ny-2,nz-2);%...
  %                            +0.1*source(2:nx-1,2:ny-1,2:nz-1)/tau/sp;
  pei=sbcz(pei);pei=sbcy(pei);pei=sbcxnn2(pei);
elseif (restart == 1)
   load rest.mat
end

pei=sbcxnn2(pei);
 phi2=phi+pei;
 
if(cold<1) % with pi
%  pii=pei;
end

% solve equations
den=deni;
te=tei;
pe=pei;
api=pii;
w=wi;
bc=0;
vi=vii;
for nt=1:nts
%      if (heat>0)
%sp=sp+dsp;%linear heating in time
%      end
  for ntt=1:ntp

      
     sfield
     f=0.5;
     fi=0.5;
     svi(f,fi)
     sw(f,fi)
     spe(f,fi)
     spe1d_fix_p

     sfield
     f=1.0;
     fi=0.0;
     svi(f,fi)
     sw(f,fi);
     spe(f,fi)
     spe1d_fix_p

     done=isfinite(pei(2,2,2));
     if done==0
        error('nan')
     end
     %fid=['dat',sprintf('%4.4d',nt)];
     %save(fid,'wi', 'pei', 'phi', 'vey','vex','vii','jz')%,'tei','deni','pii', 'phi2')%,'laplace2_pi')
  end
  nt
  fid=['dat',sprintf('%4.4d',nt)];
  save(fid,'wi', 'pei', 'phi','vii', 'vey','vex','jz','phi2')%, 'phi2','tei','deni','pii')%,'laplace2_pi')
  showt_3d;
end

