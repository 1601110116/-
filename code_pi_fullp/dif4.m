function h=dif4(f)
	global  nx ny  nz dtxsq dty dtz difui %nxs difs
	h=zeros(nx,ny,nz);
    h(2:nx-1,2:ny-1,2:nz-1) =(f(3:nx,2:ny-1,2:nz-1)-2*f(2:nx-1,2:ny-1,2:nz-1)+f(1:nx-2,2:ny-1,2:nz-1))*dtxsq*difui...
                              +(f(2:nx-1,3:ny,2:nz-1)-2*f(2:nx-1,2:ny-1,2:nz-1)+f(2:nx-1,1:ny-2,2:nz-1))*dty...
                              +(f(2:nx-1,2:ny-1,3:nz)-2*f(2:nx-1,2:ny-1,2:nz-1)+f(2:nx-1,2:ny-1,1:nz-2))*dtz;
                          
    %h(2:nxs,2:ny-1,2:nz-1) =(f(3:nxs+1,2:ny-1,2:nz-1)-2*f(2:nxs,2:ny-1,2:nz-1)+f(1:nxs-1,2:ny-1,2:nz-1))*dtx*difs...
    %                          +(f(2:nxs,3:ny,2:nz-1)-2*f(2:nxs,2:ny-1,2:nz-1)+f(2:nxs,1:ny-2,2:nz-1))*dty...
     %                         +(f(2:nxs,2:ny-1,3:nz)-2*f(2:nxs,2:ny-1,2:nz-1)+f(2:nxs,2:ny-1,1:nz-2))*dtz;
                         
    %n2=nxs+1;
    %h(n2:nx-1,2:ny-1,2:nz-1) =(f(n2+1:nx,2:ny-1,2:nz-1)-2*f(n2:nx-1,2:ny-1,2:nz-1)+f(n2-1:nx-2,2:ny-1,2:nz-1))*dtx...
     %                         +(f(n2:nx-1,3:ny,2:nz-1)-2*f(n2:nx-1,2:ny-1,2:nz-1)+f(n2:nx-1,1:ny-2,2:nz-1))*dty...
      %                        +(f(n2:nx-1,2:ny-1,3:nz)-2*f(n2:nx-1,2:ny-1,2:nz-1)+f(n2:nx-1,2:ny-1,1:nz-2))*dtz;
                      
   

end