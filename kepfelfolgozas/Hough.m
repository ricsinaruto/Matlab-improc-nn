function [H,theta,rho]=Hough(BW)
H=zeros(780,181);

for i=1:size(BW,1)
    for j=1:size(BW,2)
        if BW(i,j)==1
            for theta=-90:90
                rho=floor(i*cos(theta/360*2*3.1415)+j*sin(theta/360*2*3.1415));
                H(rho+390,theta+91)=H(rho+390,theta+91)+1;
            end
        end
    end
end


end