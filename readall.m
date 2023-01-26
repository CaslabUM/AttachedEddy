U1=load('IU1.dat'); U2=load('IU2.dat');
UU1=load('IUU1.dat'); UU2=load('IUU2.dat');
VV1=load('IVV1.dat'); VV2=load('IVV2.dat');
WW1=load('IWW1.dat'); WW2=load('IWW2.dat');
UW1=load('IUW1.dat'); UW2=load('IUW2.dat');

figure(11)
plot(U1(:,1),U1(:,2),'r-',U2(:,1),U2(:,2),'r-','LineWidth',2)
hold on
%plot([0 U1(end,1)],[0 U1(end,2)],'rv-')
plot(zh,bb*I0(1,:),'ro','LineWidth',2)
set(gca,'FontSize',16)
xlabel('z/h')
ylabel('\beta I_1')
xlim([0 2.])
ylim([-8e-5 4e-5])
hold off

figure(12)
plot(UU1(:,1),UU1(:,2),'r-',UU2(:,1),UU2(:,2),'r-','LineWidth',2)
hold on
plot(VV1(:,1),VV1(:,2),'g-',VV2(:,1),VV2(:,2),'g-','LineWidth',2)
plot(WW1(:,1),WW1(:,2),'b-',WW2(:,1),WW2(:,2),'b-','LineWidth',2)
plot(UW1(:,1),UW1(:,2),'k-',UW2(:,1),UW2(:,2),'k-','LineWidth',2)
plot(zh,bb*I00(2,:),'go',zh,bb*I00(3,:),'bo',zh,bb*I00(4,:),'ko',zh,bb*I00(1,:),'ro','LineWidth',2)
%plot([0 UU1(end,1)],[0 UU1(end,2)],'rv-')
%plot([0 VV1(end,1)],[0 VV1(end,2)],'bv-')
%plot([0 WW1(end,1)],[0 WW1(end,2)],'gv-')
%plot([0 UW1(end,1)],[0 UW1(end,2)],'kv-')
set(gca,'FontSize',16)
xlabel('z/h')
ylabel('\beta I_{ij}')
hold off
ylim([-2e-5 4e-5])
xlim([0 2.])

figure(13)
plot(UU1(:,1),UU1(:,2)./UU1(:,1),'r-',UU2(:,1),UU2(:,2)./UU1(:,1),'r-')
hold on
plot(VV1(:,1),VV1(:,2)./UU1(:,1),'g-',VV2(:,1),VV2(:,2)./UU1(:,1),'g-')
plot(WW1(:,1),WW1(:,2)./UU1(:,1),'b-',WW2(:,1),WW2(:,2)./UU1(:,1),'b-')
plot(UW1(:,1),UW1(:,2)./UU1(:,1),'k-',UW2(:,1),UW2(:,2)./UU1(:,1),'k-')
plot(zh,bb*I00(2,:)./zh,'go',zh,bb*I00(3,:)./zh,'bo',zh,bb*I00(4,:)./zh,'ko',zh,bb*I00(1,:)./zh,'ro')
plot([0 UU1(end,1)],[0 UU1(end,2)],'ro-')
plot([0 VV1(end,1)],[0 VV1(end,2)],'bo-')
plot([0 VV1(end,1)],[0 VV1(end,2)],'go-')
plot([0 WW1(end,1)],[0 WW1(end,2)],'bo-')
plot([0 UW1(end,1)],[0 UW1(end,2)],'ko-')
xlim([0 1.2])
ylim([-1e-4 4e-4])
hold off

