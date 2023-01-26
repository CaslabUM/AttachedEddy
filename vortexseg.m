function v=vortexseg(y1,y2,G)

v=cross(y1,y2)/norm(cross(y1,y2))^2*(dot(y1-y2,y1/norm(y1)-y2/norm(y2)));
v=v*G/(4*pi);


