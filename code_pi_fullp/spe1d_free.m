global nz ny nx Ax ...
       wi   tei pei phi ...
       ak2  aky Dx  vii phi2  both cold petilde %pii c X3 deni


if (both<1)
	wi=sbcz(wi);
	pei=sbcz(pei);
	vii=sbcz(vii);
else
	wi=sbcz2(wi);
	pei=sbcz2(pei);
	vii=sbcz3(vii);
end

wi=sbcy(wi);
pei=sbcy(pei);
vii=sbcy(vii);

%if (cold<1)% with pi
%pei=sbcx(pei);%periodic
%pei=sbcxn(pei);%pi case, pi_tilde=0;%pei(1,:,:)=pei(2,:,:)-petilde(2,:,:);%pi case
%else
pei=sbcxnn2(pei);%pi=0, free-fix
%end
vii=sbcxnn(vii);%free-free

tei=pei;%tei=pei./deni;
%nx0=nx-2;%FIX
nx0=nx-1;%FREE
ny0=ny-2;

cr=zeros(nx0,ny0);

for k=2:nz-1
	cr(1:nx0,1:ny0)= -wi(2:nx0+1,2:ny0+1,k);
	cr = fft(cr,[],2);

	for j=1:ny0
	    %A=Ax+ak2(j,k)*eye(nx0)+Dx*c*aky(j,k);
	    A=Ax+ak2(j,k)*speye(nx0)+Dx*aky(j,k);
        cr(:,j)=A\cr(:,j);
	end

	cr = ifft(cr,[],2);

	phi2(2:nx0+1,2:ny0+1,k)=real(cr(1:nx0,1:ny0));

end

if (cold<1)% with pi
	%pii=pei;	% with pi
    %work=sp0(pii);%pi_pert
    %work=sp0(pei);phi=phi2-work; 
    %phi(2:nx-1,2:ny-1,2:nz-1)=phi2(2:nx-1,2:ny-1,2:nz-1)-petilde(2:nx-1,2:ny-1,2:nz-1);
phi=phi2-petilde;
	%X3=repmat(x3',[1,ny,nz]);
    %Phi0=repmat(pii(1,:,:),[nx,1])+X3.*repmat((pii(nx,:,:)-pii(1,:,:)),[nx,1]);
    %phi=phi2-pii+Phi0;
	%phi(2:nx-1,2:ny-1,2:nz-1)=phi2(2:nx-1,2:ny-1,2:nz-1)-pii(2:nx-1,2:ny-1,2:nz-1)...
	%	+repmat(pii(1,2:ny-1,2:nz-1),[nx-2,1])+X3(2:nx-1,2:ny-1,2:nz-1).*repmat((pii(nx,2:ny-1,2:nz-1)-pii(1,2:ny-1,2:nz-1)),[nx-2,1]);
else
	phi=phi2;	%pi=0
end


if (both<1)
	phi=sbcz(phi);		%close
else
	phi=sbcz2(phi);		%both
    %phi=sbcz2vb(phi);%wrong bias
end

phi=sbcy(phi);
