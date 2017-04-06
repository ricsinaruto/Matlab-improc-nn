function kontur=bug_follower(I)
kontur=zeros(10,2);
%kont_temp=ones(10,2);
i=1;
j=1;
kezdo=[0,0];
while I(i,j)==0
    i=i+1;
    j=j+1;
    kezdo=[i,j];
end

%kezdo=kezdo+1;
vegso=[0,0];
iter=1;
belso=1;
kezdo=[37,36];
while vegso(1)~=kezdo(1) || vegso(2)~=kezdo(2)
    
    kontur(1,:)=kezdo;
    kont_temp(1,:)=kezdo;
    
    if iter==1
        kont_temp(iter+1,:)=kont_temp(iter,:)+[1,0];
    end
    
    if iter>2
        if I(kont_temp(iter-1,1),kont_temp(iter-1,2))==1 && kont_temp(iter-1,2)-kont_temp(iter-2,2)==1
            kont_temp(iter,:)=kont_temp(iter-1,:)+[1,0];
        end
    
        if I(kont_temp(iter-1,1),kont_temp(iter-1,2))==1 && kont_temp(iter-1,2)-kont_temp(iter-2,2)==-1
            kont_temp(iter,:)=kont_temp(iter-1,:)+[-1,0];
        end
    
        if I(kont_temp(iter-1,1),kont_temp(iter-1,2))==0 && kont_temp(iter-1,1)-kont_temp(iter-2,1)==1
            kont_temp(iter,:)=kont_temp(iter-1,:)+[0,1];
        end
    
        if I(kont_temp(iter-1,1),kont_temp(iter-1,2))==0 && kont_temp(iter-1,1)-kont_temp(iter-2,1)==-1
            kont_temp(iter,:)=kont_temp(iter-1,:)+[0,-1];
        end
    end
    
    
    %kontur érték adás
    if I(kont_temp(iter,1),kont_temp(iter,2))==1
        kontur(belso,:)=kont_temp(iter,:);
        if iter>2
            vegso=kontur(belso,:);
        end
        belso=belso+1;
    end
    iter=iter+1;
end
    


kep=zeros(size(I,1),size(I,2));

for i=1:size(I,1)
    for j=1:size(I,2)
        for k=1:size(kontur,1)
            if [i,j]==kontur(k)
                kep(i,j)=1;
            end
        end
    end
end

imshow(I);
figure
imshow(kep);


end