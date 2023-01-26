function [xeddy nseg] = Eddygen(h,params,itype)


w=1; t=pi/4; leng=2; 
if(itype==0)
Nvs=length(params);
else
Nvs=length(params)+1; 
end

type=0;
if(type==0)
x1_s =[0 -0.5*w 0]';  x1_e =[1/tan(t) -0.5*w 1]';
x3_e =[0  0.5*w 0]';  x3_s =[1/tan(t)  0.5*w 1]';
x1_s=x1_s*h; x1_e=x1_e*h; x3_s=x3_s*h; x3_e=x3_e*h; x2_s = x1_e; x2_e=x3_s;

for i=0:Nvs-1
xeddy(:,6*i+1)=x1_s*(Nvs-i)/Nvs;  xeddy(:,6*i+2)=x1_e*(Nvs-i)/Nvs;  xeddy(:,6*i+3)=x2_s*(Nvs-i)/Nvs;  xeddy(:,6*i+4)=x2_e*(Nvs-i)/Nvs;   xeddy(:,6*i+5)=x3_s*(Nvs-i)/Nvs;  xeddy(:,6*i+6)=x3_e*(Nvs-i)/Nvs;  
xeddy(1,6*i+1:6*(i+1))=xeddy(1,6*i+1:6*(i+1))-i/Nvs*leng;
end
xeddy(:,6*Nvs+1:12*Nvs)= xeddy(:,1:6*Nvs);
xeddy(3,6*Nvs+1:12*Nvs)=-xeddy(3,1:6*Nvs);

nseg=3;

else

x1_s =[0 -0.5*w 0]';  x1_e =[1/tan(t) 0 1]';
x2_e =[0  0.5*w 0]';  x2_s =x1_e;
for i=0:Nvs-1
xeddy(:,4*i+1)=x1_s*(Nvs-i)/Nvs;  xeddy(:,4*i+2)=x1_e*(Nvs-i)/Nvs;  xeddy(:,4*i+3)=x2_s*(Nvs-i)/Nvs;  xeddy(:,4*i+4)=x2_e*(Nvs-i)/Nvs;   
xeddy(1,4*i+1:4*(i+1))=xeddy(1,4*i+1:4*(i+1))-i/Nvs*leng;
end
xeddy(:,4*Nvs+1:8*Nvs)= xeddy(:,1:4*Nvs);
xeddy(3,4*Nvs+1:8*Nvs)=-xeddy(3,1:4*Nvs);

nseg=2;


end

N=length(xeddy);
figure(22)
plot3(xeddy(1,1:N/2),xeddy(2,1:N/2),xeddy(3,1:N/2),'-','LineWidth',3)
hold on
plot3(xeddy(1,1:N/2),xeddy(2,1:N/2),xeddy(3,1:N/2),'o','LineWidth',2)
%plot3(xeddy(1,N/2+1:N),xeddy(2,N/2+1:N),xeddy(3,N/2+1:N),'-','LineWidth',3)
axis equal
%xlim([0 2])
%ylim([-.5 0.5])
%zlim([0 1.01])
set(gca,'FontSize',16)
xlabel('x/h')
ylabel('y/h')
zlabel('z/h')
hold off
