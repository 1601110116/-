function spe(f,fi)
	global   pe pei   cphi jpara vii source %nx ny nz phi deni vex RLp nve 
bdelvz=sbdel(vii)-jpara;
	%ve=nve./deni;bdelvz=sbdel(ve);
	%para=ve.*pei;bdelvz2=sbdel(para);
	%para=pei.*bdelvz*0.6667+bdelvz2;
    
	para=pei.*bdelvz;
	%fxy=convect(pei);
   	fxy=convect2(pei);%flux
	dif2t=dif3(pe);
    
    %dpdx=-RLp;fxy=fxy+vex*dpdx;

	% fxy=fxy-dif2t+(para+pei.*cphi)*0.6667-source;
	fxy=fxy-dif2t+para+pei.*cphi*0.6667-source;
    %work=pe;work(2:nx-1,2:ny-1,2:nz-1)=pe(2:nx-1,2:ny-1,2:nz-1)*f+pei(2:nx-1,2:ny-1,2:nz-1)*fi-fxy(2:nx-1,2:ny-1,2:nz-1);
work=pe*f+pei*fi-fxy;

	if(f<0.6)
	    pe=pei;
	    pei=work;
	else
	    pei=work;
	end
end
