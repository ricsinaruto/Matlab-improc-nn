% Vide� beolvas�sa
v=VideoReader('mF.avi');
cnt=0;
while hasFrame(v)
    cnt=cnt+1;
    video(cnt).frame=readFrame(v);
end

pause;

% Vide� �r�sa
vin=VideoWriter('myFile2.avi');
open(vin);
for i=1:size(video,2)
    writeVideo(vin,video(i).frame);
end
close(vin);