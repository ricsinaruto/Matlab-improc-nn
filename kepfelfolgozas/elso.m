

%k�pfeldolgoz�s
I=imread('pout.tif');
%0-1 k�z�tti double-re v�lt�s
I2=im2double(I);
%inform�ci� a k�pr�l
imfinfo('pout.tif');
%k�p ki�r�sa
imwrite(I2,'pout2.png');
%k�p megtekint�se
imshow(I);

%sz�rkesk�l�z�s
kk=rgb2gray(k);
%rotate
imrotate(k,70);
%resize
imrotate(k,[600,600]);
%crop
imcrop(k);