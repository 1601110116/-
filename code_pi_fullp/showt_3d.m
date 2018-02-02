close all

%figure;plot( cx,'-o');print(gcf,'-dpng',['cx','.png']); close
%figure;plot( cy,'-o');print(gcf,'-dpng',['cy','.png']);close
%nts=250;
pii=zeros(nx,ny,nz);
dx=alx/(nx-1);
dy=aly/(ny-1);
zz=0:(6*pi/18):(6*pi-6*pi/18);
xx=0:dx:alx;
yy=0:dy:aly;
%for nt=1:nts
figure; %nt
 load(['dat',sprintf('%4.4d',nt)])
     
 %phipi=pii+phi;ve=vii-jz./deni;
 %iz=floor(nz/2); 
%iz=nz/4+1;iz=(nz);
iz=(nz)/2+1;%outside
%iz=6;%outside
%iz=2;%2d


   subplot(4,2,1)
    pcolor(yy,xx(1:194),pei(1:194,:,iz)); colorbar;shading interp; 
title('p'); xlabel('y'); ylabel('x');axis([0 200 0 75])
%axis image; 
colormap jet;
drawnow
        subplot(4,2,2)
    pcolor(yy,xx,phi(:,:,iz)-0 ); colorbar;shading interp;
%axis image; title('\Phi')
title('potential'); xlabel('y'); ylabel('x');axis([0 200 0 75])
drawnow
        subplot(4,2,3)
    pcolor(yy,xx,wi(:,:,iz) ); colorbar;shading interp;colormap jet;
title('vorticity'); xlabel('y'); ylabel('x');axis([0 200 0 75])
%axis image; 
drawnow 
       subplot(4,2,4)
 a=pei; petilde=sp0(a);  a=squeeze(petilde(:,:,iz));  pcolor(yy,xx,a);
  %pcolor(pei(:,:,iz)); 
  colorbar; shading interp
title('p_e'); xlabel('y'); ylabel('x');axis([0 200 0 75])
%axis image; 
drawnow
        subplot(4,2,5)
        a=sp0(phi);
        %a=petilde+phi;
        %a=phi2;a=squeeze(a(:,:,iz));  pcolor(a);

 %       a=vii-jz;  a=squeeze(a(:,:,iz));  pcolor(a);
    %    a=vii; a=sp0(a);  a=squeeze(a(:,:,iz));  pcolor(a);
    pcolor(yy,xx(1:194),a(1:194,:,iz));
    colorbar;shading interp;axis([0 200 0 75])
%title('u_{e}'); 
title('$$\widetilde{\phi}$$','Interpreter','latex');colormap jet;
%title('phi2');

xlabel('y'); ylabel('x')
%axis image; 
drawnow
%         subplot(3,3,6)
%     pcolor(yy,xx,jz(:,:,iz)); 
%     colorbar;shading interp
%  title('J_z'); colormap jet;
%   xlabel('y'); ylabel('x')  ;axis([0 100 0 75])      
% %axis image;
% drawnow 
        subplot(4,2,6)
 a=vex(:,:,iz); a=squeeze(a); pcolor(yy,xx(1:194),a(1:194,:)); colorbar; shading interp
title('v_x');colormap jet; xlabel('y'); ylabel('x');axis([0 200 0 75])
       

         subplot(4,2,7)
                 
 a=phi2(:,:,iz-2); a=squeeze(a); pcolor(yy,xx,a); colorbar; shading interp
 title('phi2');colormap jet
 
 xlabel('y'); ylabel('x');axis([0 100 0 75])
         subplot(4,2,8)
 a=vey(:,:,iz);a=squeeze(a); pcolor(yy,xx,a); colorbar; shading interp
 title('vey'); xlabel('y'); colormap jet;ylabel('x');axis([0 100 0 75])

print(gcf,'-dpng',sprintf('%2.2dz%4.4d',iz,nt)) 
close 
%end 
%%
%for nt=1:nts
  load(['dat',sprintf('%4.4d',nt)]);
  peaver=mean(pei(:,:,iz),2);
  
figure;
    plot(xx,squeeze(peaver),'b');
    title('profile of p');
    xlabel('$$x/\rho_{s}$$','interpreter','latex');
    ylabel('pe');
    
    print(gcf,'-dpng',['dist_dif',sprintf('%2.2dz%4.4d',iz,nt)])
    close
%end
%%
i2=60;
%for nt=1:nts
figure; 
 
load(['dat',sprintf('%4.4d',nt)])

    subplot(3,2,1)
a=pei(:,i2,:); a=squeeze(a); pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp
title('p'); xlabel('z'); colormap jet;ylabel('x');axis([0 (17/3)*pi 0 75])
        subplot(3,2,2)
a=phi-0;a=squeeze(a(:,i2,:)); pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp
title('potential'); colormap jet;xlabel('z'); ylabel('x');axis([0 (17/3)*pi 0 75])
        subplot(3,2,3)
a=wi(:,i2,:); a=squeeze(a); pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp
title('vorticity');colormap jet; xlabel('z'); ylabel('x');axis([0 (17/3)*pi 0 75])
    subplot(3,2,4)
%a=pei(:,i2,:); 
a=pei; a=sp0(a);  a=squeeze(a(:,i2,:)); 
pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp 
title('p_e'); colormap jet;xlabel('z'); ylabel('x');axis([0 (17/3)*pi 0 75])
%         subplot(3,3,5)
% a=vii(:,i2,:); a=squeeze(a); pcolor(zz,xx,a); colorbar; shading interp
% title('u_i'); colormap jet;xlabel('z'); ylabel('x');axis([0 6*pi 0 75])
%         subplot(3,3,6)
% a=jz(:,i2,:);colormap jet; a=squeeze(a); pcolor(zz,xx,a); colorbar;shading interp; title('J_z') ; xlabel('z'); ylabel('x');axis([0 6*pi 0 75])
%         subplot(3,3,7)
% a=pii; a=sp0(a);a=squeeze(a(:,i2,:)); pcolor(zz,xx,a); colorbar; shading interp
% title('P_i');colormap jet; xlabel('z'); ylabel('x');axis([0 6*pi 0 75])
        subplot(3,2,5)
 a=sp0(phi); a=squeeze(a(1:194,i2,:)); pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp
title('$$\widetilde{\phi}$$','Interpreter','latex');colormap jet; xlabel('z'); ylabel('x');axis([0 (17/3)*pi 0 75])
        subplot(3,2,6)
a=vex(:,i2,:); a=squeeze(a); pcolor(zz,xx(1:194),a(1:194,:)); colorbar; shading interp
title('v_x');colormap jet; xlabel('z'); ylabel('x');axis([0 (17/3)*pi 0 75])

print(gcf,'-dpng',sprintf('%2.2dy%4.4d',i2,nt))
close
%end

%%
% for nt=1:nts
% figure; %nt
 
% load(['dat',sprintf('%4.4d',nt)])

%  %phipi=pii+phi;ve=vii-jz./deni;
%  %iz=floor(nz/2); 
% a=phi-0;
% %a=wi;
% %a=pei;
% %a=den0;a=deni;
% iz=1;

%    subplot(2,3,1)
%     pcolor(a(:,:,iz) ); colorbar;shading interp; 
% title(sprintf('z%2.2d',iz)); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
% iz=2;

%    subplot(2,3,2)
%     pcolor(a(:,:,iz) ); colorbar;shading interp; 
% title(sprintf('z%2.2d',iz)); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow

% iz=6;
%         subplot(2,3,3)
%     pcolor(a(:,:,iz) ); colorbar;shading interp;
% %axis image; title('\Phi')
% title(sprintf('z%2.2d',iz)); xlabel('y'); ylabel('x')
% drawnow
% iz=14;
%         subplot(2,3,4)
%     pcolor(a(:,:,iz) ); colorbar;shading interp;
% title(sprintf('z%2.2d',iz)); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow 
% iz=nz-1;
%     subplot(2,3,5)
%    pcolor(a(:,:,iz));
%   %pcolor(pei(:,:,iz)); 
%   colorbar; shading interp
% %title('');
% title(sprintf('z%2.2d',iz));xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
% iz=nz;
%     subplot(2,3,6)
%   a=squeeze(a(:,:,iz));  pcolor(a);
%   %pcolor(pei(:,:,iz)); 
%   colorbar; shading interp
% %title('');
% title(sprintf('z%2.2d',iz));xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
  

% print(gcf,'-dpng',sprintf('phi%4.4d',nt)) 
% close 
% end 

%%

%%

%pause
% for nt=1:nts
% figure; %nt
%  load(['dat',sprintf('%4.4d',nt)])
%      
%  %phipi=pii+phi;ve=vii-jz./deni;
%  %iz=floor(nz/2); 
% %iz=nz/4+1;iz=(nz);
% iz=(nz)/2+1;iz=10;%outside
% iz=6;%outside
% % iz=2;%2d
% 
% 
%    subplot(3,2,1)
%     pcolor(yy,xx,pei(:,:,iz) ); colorbar;shading interp; 
% title('p'); xlabel('y');colormap jet; ylabel('x');axis([0 100 0 75])
% %axis image; 
% drawnow
%         subplot(3,2,2)
%     pcolor(yy,xx,phi(:,:,iz)-0 ); colorbar;shading interp;
% %axis image; title('\Phi')
% title('potential'); colormap jet;xlabel('y'); ylabel('x');axis([0 100 0 75])
% drawnow
%         subplot(3,2,3)
%     pcolor(yy,xx,wi(:,:,iz) ); colorbar;shading interp;
% title('vorticity');colormap jet; xlabel('y'); ylabel('x');axis([0 100 0 75])
% %axis image; 
% drawnow 
%        subplot(3,2,4)
%  a=pei; a=sp0(a);  a=squeeze(a(:,:,iz));  pcolor(yy,xx,a);
%   %pcolor(pei(:,:,iz)); 
%   colorbar; shading interp
% title('p_e');colormap jet; xlabel('y'); ylabel('x');axis([0 100 0 75])
% %axis image; 
% drawnow
%         subplot(3,2,5)
%         a=phi(:,:,iz)-repmat(mean(phi(:,:,iz),2),[1,ny]);
%     pcolor(yy,xx,a); colorbar;shading interp
% title('$$\widetilde{\phi}$$','Interpreter','latex');colormap jet; xlabel('y'); ylabel('x');axis([0 100 0 75])
% %axis image; 
% drawnow
% %         subplot(3,3,6)
% %     pcolor(yy,xx,jz(:,:,iz)); colorbar;shading interp
% %  title('J_z'); colormap jet;xlabel('y'); ylabel('x');axis([0 100 0 75])
% % %axis image;
% % drawnow 
%         subplot(3,2,6)
% a=vex(:,:,iz); a=squeeze(a); pcolor(yy,xx,a); colorbar; shading interp
% title('v_x'); colormap jet;xlabel('y'); ylabel('x');axis([0 100 0 75])
% %         subplot(3,3,8)
% % a=vey(:,:,iz); a=squeeze(a); pcolor(yy,xx,a); colorbar; shading interp
% % title('v_y');colormap jet; xlabel('y'); ylabel('x');axis([0 100 0 75])
% % subplot(3,3,9)
% % a=pei(:,:,iz)-repmat(mean(pei(:,:,iz),2),[1,ny]); a=squeeze(a); pcolor(yy,xx,a); colorbar; shading interp
% % title('$$\widetilde{p}$$','interpreter','latex'); colormap jet;xlabel('y'); ylabel('x');axis([0 100 0 75])
% print(gcf,'-dpng',sprintf('%2.2dz%4.4d',iz,nt)) 
% close 
% end 
% 
% %%

%pause
% for nt=1:nts
% figure; %nt
% load(['dat',sprintf('%4.4d',nt)])

%  %phipi=pii+phi;ve=vii-jz./deni;
%  %iz=floor(nz/2); 
% %iz=nz/4+1;iz=(nz);
% iz=2;%inside
% iz=14;%inside
% %iz=(nz)/2+1;


%    subplot(4,2,1)
%     pcolor(pei(:,:,iz) ); colorbar;shading interp; 
% title('p'); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
%         subplot(4,2,2)
%     pcolor(phi(:,:,iz)-0 ); colorbar;shading interp;
% %axis image; title('\Phi')
% title('potential'); xlabel('y'); ylabel('x')
% drawnow
%         subplot(4,2,3)
%     pcolor(wi(:,:,iz) ); colorbar;shading interp;
% title('vorticity'); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow 
%     subplot(4,2,4)
%  a=pei; a=sp0(a);  a=squeeze(a(:,:,iz));  pcolor(a);
%   %pcolor(pei(:,:,iz)); 
%   colorbar; shading interp
% title('p_e'); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
%         subplot(4,2,5)
%     pcolor(vii(:,:,iz)); colorbar;shading interp
% title('u_{i}'); xlabel('y'); ylabel('x')
% %axis image; 
% drawnow
%         subplot(4,2,6)
%     pcolor(jz(:,:,iz)); colorbar;shading interp
%  title('J_z'); xlabel('y'); ylabel('x')
% %axis image;
% drawnow 
%         subplot(4,2,7)
% a=vex(:,:,iz); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('v_x'); xlabel('y'); ylabel('x')
%         subplot(4,2,8)
% a=vey(:,:,iz); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('v_y'); xlabel('y'); ylabel('x')

% print(gcf,'-dpng',sprintf('%2.2dz%4.4d',iz,nt)) 
% close 
% end 
% %%
% %i2=25;
% i2=10;
% %plot y-z

% for nt=1:nts
%  figure;%nt
%  load(['dat',sprintf('%4.4d',nt)])

% %phipi=pii+phi;ve=vii-jz./deni;
%     subplot(3,3,1)
% a=deni(i2,:,:); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('n'); xlabel('z'); ylabel('y')
%         subplot(3,3,2)
% a=phi-0; a=squeeze(a(i2,:,:)); pcolor(a); colorbar; shading interp
% title('potential'); xlabel('z'); ylabel('y')
%         subplot(3,3,3)
% a=wi(i2,:,:); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('vorticity'); xlabel('z'); ylabel('y')
%     subplot(3,3,4)
% a=pei;%a=sp0(a);  
% a=squeeze(a(i2,:,:)); pcolor(a); colorbar; shading interp 
% title('p_e'); xlabel('z'); ylabel('y')
%         subplot(3,3,5)
% a=vii(i2,:,:); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('u_{i}'); xlabel('z'); ylabel('y')
%         subplot(3,3,6)
% a=jz(i2,:,:); a=squeeze(a); pcolor(a); colorbar;shading interp; 
% title('J_z') ; xlabel('z'); ylabel('y')
%         subplot(3,3,7)
% a=pii; a=squeeze(a(i2,:,:)); pcolor(a); colorbar; shading interp
% title('P_i'); xlabel('z'); ylabel('y')
%         subplot(3,3,8)
% a=vex(i2,:,:); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('v_x'); xlabel('z'); ylabel('y')
%         subplot(3,3,9)
% a=vey(i2,:,:); a=squeeze(a); pcolor(a); colorbar; shading interp
% title('v_y'); xlabel('z'); ylabel('y')

% print(gcf,'-dpng',sprintf('%2.2dx%4.4d',i2,nt))
% close
% end

% %%
% %figure;plot(squeeze(pei(10,:,10)),'-o')
% %print(gcf,'-dpng',['deny','.png'])
% %figure;plot(squeeze(phi(10,:,10)),'-o')
% %print(gcf,'-dpng',['phiy','.png'])
% %%
% figure;plot(squeeze(pei(10,10,:)),'-o');
% print(gcf,'-dpng',['denz','.png'])
% figure;plot(squeeze(vii(10,10,:)),'-o');print(gcf,'-dpng',['vz','.png'])
% figure;plot(squeeze(tei(10,10,:)),'-o');
% print(gcf,'-dpng',['tz','.png'])
% figure;plot(squeeze(wi(10,10,:)),'-o');
% print(gcf,'-dpng',['wz','.png'])
% figure;plot(squeeze(jz(10,10,:)),'-o');
% print(gcf,'-dpng',['jz','.png'])
% figure;plot(squeeze(phi(10,10,:)),'-o')
% print(gcf,'-dpng',['phiz','.png'])
% figure;plot(squeeze(phi(:,10,2)),'-o');
% print(gcf,'-dpng',['z2phix','.png'])
% %%
% figure;plot(squeeze(deni(:,10,2)),'-o');
% print(gcf,'-dpng',['z2denx','.png'])
% figure;plot(squeeze(vii(:,10,2)),'-o');
% print(gcf,'-dpng',['z2ux','.png'])
% figure;plot(squeeze(jz(:,10,2)),'-o');
% print(gcf,'-dpng',['z2jx','.png'])
% %%
% %plot open
% figure;plot(squeeze(pei(40,10,:)),'-o');
% print(gcf,'-dpng',['x40denz','.png'])
% figure;plot(squeeze(vii(40,10,:)),'-o');
% print(gcf,'-dpng',['x40vz','.png'])
% figure;plot(squeeze(tei(40,10,:)),'-o');
% print(gcf,'-dpng',['x40t','.png'])
% figure;plot(squeeze(wi(40,10,:)),'-o');
% print(gcf,'-dpng',['x40w','.png'])
% figure;plot(squeeze(jz(40,10,:)),'-o');
% print(gcf,'-dpng',['x40jz','.png'])
% figure;plot(squeeze(phi(40,10,:)),'-o')
% print(gcf,'-dpng',['x40phiz','.png'])


close all

%figure;plot(squeeze(pei(10,10,:)),'-o')
%figure;plot(squeeze(pii(10,10,:)),'-o')
%figure;plot(squeeze(vii(10,10,:)),'-o')
%figure;plot(squeeze(jz(10,10,:)),'-o')


