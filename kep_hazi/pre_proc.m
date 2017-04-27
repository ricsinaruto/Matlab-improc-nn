% pre-processing file
load('images.mat');

Y=zeros([100000 10]);
for i=1:10
    for j=1:10000
        X(i*10000-10000+j,:)=reshape(images{i,j}',1,784);
        Y(i*10000-10000+j,i)=1;
    end
end

save('X.mat','X');
save('Y.mat','Y');