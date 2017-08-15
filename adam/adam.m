run fucsi.m;
colors=lvl0(:,2)/mean(lvl0(:,2));
kek=max(colors);
y_size=37;
x_size=37;
r=0.1;
coords=zeros(37*37,2);
for k=1:x_size
    for p=1:y_size
        i=(k-1)*y_size+p;
        coords(i,1)=1.5*r*k;
        coords(i,2)=sqrt(3)*r*p+k*sqrt(3)*r/2;
    end
end


ind=lvl0(:,1);
for i=1:size(lvl0)
    for ang=1:6
            angle=ang*60;
            x(ang)=coords(ind(i,1),1)+r*cosd(angle);
            y(ang)=coords(ind(i,1),2)+r*sind(angle);
            
    end
    
        color=[(colors(i)/kek),1-(colors(i)/kek),0];
        fill(x,y,color);
        text(coords(ind(i,1),1)-r/2,coords(ind(i,1),2),num2str(round(colors(i),3)));
        hold on;
end

