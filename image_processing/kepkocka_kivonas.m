

video=VideoWriter('myFile.avi');
open(video);

for i=1:size(video,2)-1
    most=rgb2gray(video(i).frame);
    kovi=rgb2gray(video(i+1).frame);
    ujkep=kovi;
    kivonas=kovi-most;

    
    for j=1:size(kivonas,1)
        for k=1:size(kivonas,2)
            if kivonas(j,k)>20
                kivonas(j,k)=255;
            else 
                kivonas(j,k)=0;
            end
            if kivonas(j,k)==255
                ujkep(j,k)=most(j,k);
            end
        end
    end

    writeVideo(video,kivonas);
end
close(video);
    
    

