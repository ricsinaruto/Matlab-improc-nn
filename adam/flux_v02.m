run rig3.m;
coords=DEThalofluxCOORD*[0.5 -sqrt(3)/2;sqrt(3)/2 0.5];
adat=DEThaloflux(:,11)/mean(DEThaloflux(:,11));
h=max(adat);
r=0.36806;
nul=zeros(2116,3);
j=1;
l=0;
while l<2116
    l=l+1;
    if DEThaloflux(l,11)>0 
        nul(j,1)=coords(l,1);
        nul (j,2)=coords(l,2);
        nul (j,3)=adat(l);
        j=j+1;
    end
end
nul( ~any(nul,2), : ) = [];

for i=1:size(nul,1) 
    for k=1:6
        angle=k*60+90;
            x(k)=nul(i,1)+r*cosd(angle);
            y(k)=nul(i,2)+r*sind(angle);
    end
   
        szin=[nul(i,3)/h,0,1-nul(i,3)/h];
        fill(x,y,szin);
        hold on;

end
