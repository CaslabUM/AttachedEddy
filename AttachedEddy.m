function Obj=AttachedEddy(params);

dat1=load('Re5186.prof1'); dat2=load('Re5186.prof2'); dat=dat1; 
uuexp=dat2(:,3); vvexp=dat2(:,5); wwexp=dat2(:,4); uwexp=dat2(:,6);
ReTau=5186; hmaxp=5.180723618357201e+03; Uinf=  2.657528387419314e+01;
hminp=2.6*sqrt(ReTau);

Np=101;  % Number of eddies
Nz=101;  % Number of output points in z
dhp=(hmaxp-hminp)/(Np-1); hp=hminp:dhp:hmaxp;
zp=hminp:(hmaxp-hminp)/(Nz-1):hmaxp; 
LZ=7.0; Nzh=101; % Number of self similar planes 
zh=0:LZ/(Nzh-1):LZ; 
Php=2/(1/hminp^2-1/hmaxp^2)./hp.^3;

tic
 [I0 I00]=Eddyvelnew(zh,params); 
toc

for i=1:Nz
 I0z(:,i) =interp1([zh 100],[I0(1,:) 0 ],zp(i)./hp)';
 I11z(:,i)=interp1([zh 100],[I00(1,:) 0],zp(i)./hp)';
 I22z(:,i)=interp1([zh 100],[I00(2,:) 0],zp(i)./hp)';
 I33z(:,i)=interp1([zh 100],[I00(3,:) 0],zp(i)./hp)';
 I13z(:,i)=interp1([zh 100],[I00(4,:) 0],zp(i)./hp)';
 [min(zp(i)./hp) max(zp(i)./hp)];
end
Integ =  I0z.*(Php.*hp.^2)'*dhp;
Integ1=I11z.*(Php.*hp.^2)'*dhp;
Integ2=I22z.*(Php.*hp.^2)'*dhp;
Integ3=I33z.*(Php.*hp.^2)'*dhp;
Integ4=I13z.*(Php.*hp.^2)'*dhp;

UbarIexpf=interp1(dat(:,2),dat(:,3)-Uinf,zp);
uubarIexpf=interp1(dat(:,2),uuexp,zp);
vvbarIexpf=interp1(dat(:,2),vvexp,zp);
wwbarIexpf=interp1(dat(:,2),wwexp,zp);
uwbarIexpf=interp1(dat(:,2),uwexp,zp);

Ubar=sum(Integ);
bb=Ubar*UbarIexpf'/(Ubar*Ubar')
Ubar=bb*Ubar+Uinf;

bb*2/(1/hminp^2-1/hmaxp^2)

uubar=bb*sum(Integ1); vvbar=bb*sum(Integ2); wwbar=bb*sum(Integ3); uwbar=bb*sum(Integ4);

%Obj=50*(Ubar-Uinf-UbarIexpf).^2+(uubar-uubarIexpf).^2+(vvbar-vvbarIexpf).^2+(wwbar-wwbarIexpf).^2+10*(uwbar-uwbarIexpf).^2;
%Obj=50*(Ubar-Uinf-UbarIexpf).^2+(uubar-uubarIexpf).^2+(vvbar-vvbarIexpf).^2+(wwbar-wwbarIexpf).^2+10*(uwbar-uwbarIexpf).^2;
Obj=50*(Ubar-Uinf-UbarIexpf).^2+(uubar-uubarIexpf).^2+(vvbar-vvbarIexpf).^2+(wwbar-wwbarIexpf).^2+10*(uwbar-uwbarIexpf).^2;

Obj=sum(Obj)

fid = fopen('Optim.out', 'a+');
%fprintf(fid, '%12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e\n', [Obj params sum((Ubar-Uinf-UbarIexpf).^2) sum((uubar-uubarIexpf).^2) sum((vvbar-vvbarIexpf).^2) sum((wwbar-wwbarIexpf).^2) sum((uwbar-uwbarIexpf).^2)]);
%fprintf(fid, '%12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e\n', [Obj params sum((Ubar-Uinf-UbarIexpf).^2) sum((uubar-uubarIexpf).^2) sum((vvbar-vvbarIexpf).^2) sum((wwbar-wwbarIexpf).^2) sum((uwbar-uwbarIexpf).^2)]);
fprintf(fid, '%12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e %12.8e\n', [Obj params sum((Ubar-Uinf-UbarIexpf).^2) sum((uubar-uubarIexpf).^2) sum((vvbar-vvbarIexpf).^2) sum((wwbar-wwbarIexpf).^2) sum((uwbar-uwbarIexpf).^2)]);

fclose(fid);

figure(5)
semilogx(zp,Ubar,'o',dat(:,2),dat(:,3),'LineWidth',3)
set(gca,'FontSize',16)
xlabel('z^+')
ylabel('U^+')
xlim([hminp hmaxp])

figure(6)
semilogx(zp,uubar,'ro',dat(:,2),uuexp,'r-',zp,vvbar,'go',dat(:,2),vvexp,'g-',zp,wwbar,'bo',dat(:,2),wwexp,'b-',zp,uwbar,'ko',dat(:,2),uwexp,'k-','LineWidth',2)
xlim([hminp hmaxp])
xlabel('z^+')
ylabel('R_{ij}^+')

readall

