function h=sbdel2(g)
	global nx ny nz dz1p5
   	h=zeros(nx,ny,nz);
   	h(2:nx-1,2:ny-1,2:nz-1)=dz1p5*(g(2:nx-1,2:ny-1,3:nz)-g(2:nx-1,2:ny-1,1:nz-2));
end
