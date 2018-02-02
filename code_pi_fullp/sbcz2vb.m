function a=sbcz2vb(a)
	global nz ny nx  nx2 vb

    
      a(2:nx2,:,1) =a(2:nx2,:,nz-1);
      a(2:nx2,:,nz)=a(2:nx2,:,2);
    
    %a(nx2+1:nx,1:ny,1) =a(nx2+1:nx,1:ny,2);
	%a(nx2+1:nx,1:ny,nz)=a(nx2+1:nx,1:ny,nz-1);
    
    
	a(nx2+1:nx-1,2:ny-1,1) =a(nx2+1:nx-1,2:ny-1,2)-vb(nx2+1:nx-1,2:ny-1,1);%free+bias;
	a(nx2+1:nx-1,2:ny-1,nz)=a(nx2+1:nx-1,2:ny-1,nz-1)-vb(nx2+1:nx-1,2:ny-1,nz);%free+bias;
end
