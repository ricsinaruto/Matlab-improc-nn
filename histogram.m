
function [new_hist]= func(I)

histogram=zeros(1,256);
for i=1:size(I,1) 
    for j=1:size(I,2)
         histogram(I(i,j)+1)=histogram(I(i,j)+1)+1;
    end
end

%kb
xmin=75;
xmax=200;

new_hist=zeros(1,256);
for i=1:256
    new_hist(i)=255/(xmax-xmin)/(xmax-xmin)*(histogram(i)-xmin)*(histogram(i)-xmin);
end

end

