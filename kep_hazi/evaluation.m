%load('X.mat');
%load('Y.mat');
%x = double(X(1:10,:)');
%t = Y';

%imcomplement needed because usually text is black on white background
im=imcomplement(rgb2gray(imresize(X,[28 28])));
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

imshow(im);