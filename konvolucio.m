function kep=konvolucio(I,kernel)

for i=2:size(I,1)-1 
    for j=2:size(I,2)-1 
        subI=im2double(I(i-1:i+1,j-1:j+1)).*kernel;
        kep(i,j)=sum(sum(subI));
    end
end

end