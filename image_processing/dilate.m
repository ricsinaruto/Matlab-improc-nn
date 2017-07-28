function kep=dilate(I,W,maxmin)

for i=1+W:size(I,1)-W
    for j=1+W:size(I,2)-W 
        subI=im2double(I(i-W:i+W,j-W:j+W));
        if maxmin
            maxI=max(max(subI));
            kep(i,j)=maxI;
        else    
            minI=min(min(subI));
            kep(i,j)=minI;
        end
    end
end

imshow(I);
figure
imshow(kep);

%matlabban:
%imerode és imdilate függvények
end