function [szethuzott]=func(I)

max_ert=max(max(I));
min_ert=min(min(I));
for i=1:size(I,1) 
    for j=1:size(I,2)
         szethuzott(i,j)=255/(max_ert-min_ert)*(I(i,j)-min_ert);
    end
end



end