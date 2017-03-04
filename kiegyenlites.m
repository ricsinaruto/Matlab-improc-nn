function kiegy=kiegyenlites(I)

histogram=imhist(I);
eloszlas=zeros(0,257);
eloszlas(257)=10000000000000;
for i=1:256 
    if i~=1
    eloszlas(i)=eloszlas(i-1)+histogram(i);
    else
     eloszlas(i)=histogram(i);
    end
end
mennyi=eloszlas(256)/16;
%plot(eloszlas);
k=1;
j=1;
hiszt_osztok=zeros(1,16);
for i=1:256
    if eloszlas(i)-eloszlas(j)<mennyi && eloszlas(i+1)-eloszlas(j)>mennyi
    hiszt_osztok(k)=i;
    k=k+1;
    j=i;
    end
end
hiszt_osztok(1)=0;
hiszt_osztok(16)=255;
%plot(hiszt_osztok);

kiegy=I;
for i=1:size(I,1) 
    for j=1:size(I,2)
        for l=1:16
            if I(i,j)<=hiszt_osztok(l)
             kiegy(i,j)=16*l;
             break;
            end
        end
        
    end
end
%imshow(kiegy);

end