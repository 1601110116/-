%function sfield
	global  phi pei jz  jpara petilde   both cphi cpe  dpdz nustar vex vey dy1p5 dx1p5 bz  balloon %deni tei %nx nve vii 
     cphi=curv(phi);
 % if (cold<1)% with pi    
 %     petilde=sp0(pei);
 % end
     
     
if (balloon<1) %interchange,2d
    %cphi=curv(phi);
    cpe=curv(pei);
else
	%work=sp0(phi);cphi=curv(work);
	%work=sp0(pei);cpe=curv(work);
    petilde=sp0(pei);
    cpe=curv(petilde);%balloon
    %cpe=curv(pei);
end


dpdz=sbdel(pei);
dphidz=sbdel(phi);
jz=(dpdz-dphidz)*nustar;
	%jz=-sbdel2(phi);jz=sbdel2(pei)+deni.*jz;    
    
	%jz=sbdel2(petilde)-sbdel2(phi);
%jz=jz.*tei.^(1.5);%cost time
	if (both<1)
		jz=sbcz(jz);	%close
	else
		jz=sbcz3(jz);
		%sbcz_open2;		%both
        sbcz_open;%bias
	end

	%jz(nx,:,:) = jz(nx-1,:,:);
	jpara=sbdel(jz);
	%nve=vii-jz;%nve=vii.*deni-jz;
 
    
    
    
vey(2:nx-1,2:ny-1,2:nz-1)=dx1p5*(phi(3:nx,2:ny-1,2:nz-1)-phi(1:nx-2,2:ny-1,2:nz-1));


%vex(2:nx-1,2:ny-1,2:nz-1)=dy1p5*(phi(2:nx-1,3:ny,2:nz-1)-phi(2:nx-1,1:ny-2,2:nz-1)); %fix- fix

%vex(1,:,:)=vex(2,:,:);%bc-LEFT FREE
vex(1:nx-1,2:ny-1,2:nz-1)=dy1p5*(phi(1:nx-1,3:ny,2:nz-1)-phi(1:nx-1,1:ny-2,2:nz-1)); %free- fix


vex=-bz*vex;
vey=bz*vey;
vey=sbcy(vey);




