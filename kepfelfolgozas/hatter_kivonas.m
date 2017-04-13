vin=VideoWriter('myF_out.avi');
open(vin);
alpha=0.99;
hatter=rgb2gray(video(1).frame);
for i=1:size(video,2)-1
    most=rgb2gray(video(i).frame);
    if i==1
        uj_hatter=alpha*hatter+(1-alpha)*most;
    else
        uj_hatter=alpha*uj_hatter+(1-alpha)*most;
    end

    writeVideo(vin,uj_hatter);
end
close(vin);