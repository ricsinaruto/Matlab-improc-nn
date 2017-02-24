

%képfeldolgozás
I=imread('pout.tif');
%0-1 közötti double-re váltás
I2=im2double(I);
%információ a képrõl
imfinfo('pout.tif');
%kép kiírása
imwrite(I2,'pout2.png');
%kép megtekintése
imshow(I);

%szürkeskálázás
kk=rgb2gray(k);
%rotate
imrotate(k,70);
%resize
imrotate(k,[600,600]);
%crop
imcrop(k);