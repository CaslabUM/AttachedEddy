U1=load('IU1.dat'); U2=load('IU2.dat');
UU1=load('IUU1.dat'); UU2=load('IUU2.dat');
VV1=load('IVV1.dat'); VV2=load('IVV2.dat');
WW1=load('IWW1.dat'); WW2=load('IWW2.dat');
UW1=load('IUW1.dat'); UW2=load('IUW2.dat');

figure(11)
plot(U1(:,1),U1(:,2),'r-',U2(:,1),U2(:,2),'r-','LineWidth',2)
hold on
xlim([0 2.5])
hold off
xlabel('z/h')
ylabel('I_1')
set(gca,'FontSize',16)

figure(12)
plot(UU1(:,1),UU1(:,2),'r-',UU2(:,1),UU2(:,2),'r-','LineWidth',2)
hold on
plot(VV1(:,1),VV1(:,2),'g-',VV2(:,1),VV2(:,2),'g-','LineWidth',2)
plot(WW1(:,1),WW1(:,2),'b-',WW2(:,1),WW2(:,2),'b-','LineWidth',2)
plot(UW1(:,1),UW1(:,2),'k-',UW2(:,1),UW2(:,2),'k-','LineWidth',2)
hold off
ylim([-2e-5 4e-5])
xlim([0 2.5])
xlabel('z/h')
ylabel('I_{ij}')
set(gca,'FontSize',16)

