
function kep=wallis(I,W,p,Md,Amax,Dd)

for i=1+W:size(I,1)-W 
    for j=1+W:size(I,2)-W 
        subI=im2double(I(i-W:i+W,j-W:j+W));
        meanI=mean(mean(subI));
        stdI=std(std(subI));
        kep(i,j)=(im2double(I(i,j))-meanI)*Amax*Dd/(Amax*stdI+Dd)+(p*Md+(1-p)*meanI);
    end
end

imshow(I);
figure
imshow(kep);

end