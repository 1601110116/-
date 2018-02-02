function a=sbcxn(a)
	global  nx
a(1,:,:)=mean(mean(a(2,:,:),2),3);
a(nx,:,:)=1;	% pei free-fix 
   	
%for k=2:nz-1
%	a(1,:,k)=mean(a(2,:,k),2);
	%a(nx,:,k)=mean(a(nx-1,:,k),2);
	% a(nx,:,k)=1;	% pei free-fix end
   
%end
% a(1,:,:)=a(2,:,:);

