function a=sbcx(a)
	global nx

    a(1,:,:)=a(nx-1,:,:);
    a(nx,:,:)=a(2,:,:);
end
