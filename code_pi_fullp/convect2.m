function h=convect2(g)
	global  nx ny nz vex vey dyt1p5 dxt1p5 flux0 %ns nxb
	h = zeros(nx,ny,nz);
    	%h(2:nx-1,2:ny-1,2:nz-1) = (vex(3:nx,2:ny-1,2:nz-1).*g(3:nx,2:ny-1,2:nz-1)-vex(1:nx-2,2:ny-1,2:nz-1).*g(1:nx-2,2:ny-1,2:nz-1))*dxt1p5...
		%+(vey(2:nx-1,3:ny,2:nz-1).*g(2:nx-1,3:ny,2:nz-1)-vey(2:nx-1,1:ny-2,2:nz-1).*g(2:nx-1,1:ny-2,2:nz-1))*dyt1p5;
   
    	h(2,2:ny-1,2:nz-1) = (vex(3,2:ny-1,2:nz-1).*g(3,2:ny-1,2:nz-1)-flux0)*dxt1p5...
		+(vey(2,3:ny,2:nz-1).*g(2,3:ny,2:nz-1)-vey(2,1:ny-2,2:nz-1).*g(2,1:ny-2,2:nz-1))*dyt1p5;
   
    ns=3;nxb=nx-1;
    h(ns:nxb,2:ny-1,2:nz-1) = (vex(ns+1:nxb+1,2:ny-1,2:nz-1).*g(ns+1:nxb+1,2:ny-1,2:nz-1)-vex(ns-1:nxb-1,2:ny-1,2:nz-1).*g(ns-1:nxb-1,2:ny-1,2:nz-1))*dxt1p5...
		+(vey(ns:nxb,3:ny,2:nz-1).*g(ns:nxb,3:ny,2:nz-1)-vey(ns:nxb,1:ny-2,2:nz-1).*g(ns:nxb,1:ny-2,2:nz-1))*dyt1p5;
end
