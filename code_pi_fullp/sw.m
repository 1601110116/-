function sw(f,fi)
   global    wi w jpara cpe difw %nx ny nz pii pei  arho  phi dtxsq dtysq dxt1p5 dyt1p5 

   %ptot=pei+pii;ptot=sp0(ptot);cptot=curv(ptot);
   %cptot=cpe;
   fxy=convect(wi);
   dif2t=dif3(w);

   %Remainder Ion diamagnetic terms
   %vdterm = zeros(nx,ny,nz);

   %fxy=fxy-cptot-jpara-dif2t-arho*vdterm;
   fxy=fxy-cpe-jpara-dif2t*difw;
   %work=w;
   %work(2:nx-1,2:ny-1,2:nz-1)=f*w(2:nx-1,2:ny-1,2:nz-1)+fi*wi(2:nx-1,2:ny-1,2:nz-1)-fxy(2:nx-1,2:ny-1,2:nz-1);
work=w*f+wi*fi-fxy;

   if(f<0.6)
      w=wi;
      wi=work;
   else
      wi=work;
   end
end
