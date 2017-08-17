function output = NPEA( input )   
    pic=imread(input);

    tpic=double(pic);

    maxpic=round((tpic(:,:,1)+tpic(:,:,2)+tpic(:,:,3))/3);
    pichsv=rgb2hsi(uint8(tpic));
    inshow(pichsv)
%         blkwin=48;
    blkwin=30;
%         ehcpic=CLHE(tpic,blkwin);
    ehcpic=CLHE_new(tpic,blkwin);
    ehcmax=round((ehcpic(:,:,1)+ehcpic(:,:,2)+ehcpic(:,:,3))/3);

    win=5;
    max1=getlocalmax(maxpic,win);
    min1=getlocalmin(maxpic,win);
    max2=getlocalmax(ehcmax,win);
    min2=getlocalmin(ehcmax,win);
    delta1=(max1-min1)./(max1+~max1);
    delta2=(max2-min2)./(max2+~max2); 
    climit=0.2; 
    tag=delta1<climit;
    ratio=(delta2+(climit-delta1).*tag)./(delta1.*(~tag)+climit.*tag);
    blkwin=30;
    ratio=getspecialmean(ratio,tpic,blkwin);    %reshape ratio

    pichsv(:,:,3)=ehcmax/255;
    pichsv(:,:,2)=pichsv(:,:,2).*ratio;
    tpic=hsi2rgb(pichsv);
    figure,imshow(tpic);
end