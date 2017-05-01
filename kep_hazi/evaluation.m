%load('X.mat');
%load('Y.mat');
%x = double(X(1:10,:)');
%t = Y';

function label=evaluation(X)
%imcomplement needed because usually text is black on white background, and
%the neural net was mostly trained with white text on black background.
if size(X,3)==3
    im=imcomplement(rgb2gray(imresize(X,[28 28])));
else
    im=imcomplement(imresize(X,[28 28]));
end
x=reshape(im',1,784);
x=double(x');

y=neural_net(x);

all_chars=['A','B','C','D','E','F','G','H','I','J'];
label=all_chars;
for i=1:1
    for j=1:10
        if y(j,i)==max(y(:,i))
            label(i)=num2str(all_chars(j));
        end
    end
end

label(1)
imshow(im);
end