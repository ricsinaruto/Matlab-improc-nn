function str=stretch(I)

%nem kellenek for ciklusok
max_ert=max(max(I));
min_ert=min(min(I));
str=255*power(((I-min_ert)/(max_ert-min_ert)),2);
imshow(str)

end

%gépesen 
%Im=stretchlim(I);
%J=imadjust(I,Im);
%imshow(J)
