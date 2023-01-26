function [I0 I00]=Eddyvelnew(zh,params)

rc=0.01; Nzh=length(zh);

L=7; M=200; dL=2*L/(M-1);
x=-L:dL:L; y=x; G1=1;

itype=0; % Whether or not to freeze the first eddy.
[xeddy nseg] = Eddygen(1,params,itype);
N1=length(xeddy); 

if(itype==0)
  M1=length(params);
  for l=1:M1 
       G1((l-1)*nseg+1:l*nseg)=params(l);
  end
else
  M1=length(params)+1;
  G1(1:nseg)=1;
  for l=2:M1 
       G1((l-1)*nseg+1:l*nseg)=params(l-1);
  end
end





parfor k=1:Nzh
z=zh(k);
U= [0 0 0]'; UR=[0 0 0 0]';
for i1=1:M
 for j1=1:M
 xp=[x(i1) y(j1)  z]'; dU= [0 0 0]';
  for l=1:M1*nseg
    if(norm(cross(xeddy(:,2*l-1)-xp,xeddy(:,2*l)-xp))/norm(xeddy(:,2*l-1)-xeddy(:,2*l))>rc)
     dU=dU+vortexseg(xeddy(:,2*l-1)-xp,     xeddy(:,2*l)-xp,     G1(l));
    end
    dU=dU-vortexseg(xeddy(:,2*l-1+N1/2)-xp,xeddy(:,2*l+N1/2)-xp,G1(l));
  end
U=U+dU;
UR(1)=UR(1)+dU(1)*dU(1);
UR(2)=UR(2)+dU(2)*dU(2);
UR(3)=UR(3)+dU(3)*dU(3);
UR(4)=UR(4)+dU(1)*dU(3);
end
end

I0(:,k)=U*dL*dL; I00(:,k)=UR*dL*dL;
end

