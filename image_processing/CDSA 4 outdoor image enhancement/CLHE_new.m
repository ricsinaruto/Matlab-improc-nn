function ehcpic=CLHE_new(pic,blkwin) % Contrast Limited Histogram Equalzation
        padp=padpic(pic,blkwin);
        % blknum-block number
        [m,n,k]=size(padp);
        bm=m/blkwin;
        bn=n/blkwin;
        
        %
        maplist=zeros(bm,bn,256);% PDF
                
        % PDF
        glist=eqkernel([pic(:,:,1),pic(:,:,2),pic(:,:,3)]);
        maxlist=glist;
        maxlist=maxlist*(blkwin*blkwin)/sum(maxlist(:));
        [rlist,count]=imhist(uint8(pic(:,:,1)));
        [glist,count]=imhist(uint8(pic(:,:,2)));
        [blist,count]=imhist(uint8(pic(:,:,3)));
        gentr=max(max(getentropy(rlist),getentropy(glist)),getentropy(blist));% global entropy
        
        maxv=zeros(bm,bn);
        for i=1:bm %ֵ
            for j=1:bn
                blk=padp((i-1)*blkwin+1:i*blkwin,(j-1)*blkwin+1:j*blkwin,:);
                maxv(i,j)=max(blk(:));
            end
        end
        maxv=ThreeStep(maxv);
%         r=0.35;
%         maxv=255*(1-r)+r*eqkernel_global(maxv,255);
        
        %ֵ
        for i=1:bm
            for j=1:bn
                [rlist,count]=imhist(uint8(padp((i-1)*blkwin+1:i*blkwin,(j-1)*blkwin+1:j*blkwin,1)));
                [glist,count]=imhist(uint8(padp((i-1)*blkwin+1:i*blkwin,(j-1)*blkwin+1:j*blkwin,2)));
                [blist,count]=imhist(uint8(padp((i-1)*blkwin+1:i*blkwin,(j-1)*blkwin+1:j*blkwin,3)));
                entr=max(max(getentropy(rlist),getentropy(glist)),getentropy(blist));
                
                blk=padp((i-1)*blkwin+1:i*blkwin,(j-1)*blkwin+1:j*blkwin,:);
                
                lr=min(1,entr/gentr);% local ratio
                lr=(1-lr)/(lr+~lr);
                glist=round(maxlist*lr);
                [llist,count]=imhist(uint8(blk(:)));
                llist=llist+glist;
                maplist(i,j,:)=eqkernel_new(llist,maxv(i,j));
                maplist(i,j,:)=round(maplist(i,j,:));
            end
        end
        

        for i=1:bm
            for j=1:bn
                list=maplist(i,j,:);
                tag=list==0;%
                tag(1)=0;
                tag(256)=0;
                list=list/sum(list(:));
                for k=2:256
                    list(k)=list(k-1)+list(k)*255;
                end

                for k=1:256
                    if tag(k)%ֵ
                        for ii=k:-1:1
                            if(~tag(ii))
                                s=ii;
                                break;
                            end
                        end
                        for ii=k:256
                            if(~tag(ii))
                                e=ii;
                                break;
                            end
                        end
                        list(k)=list(e)*(k-s)/(e-s)+list(s)*(e-k)/(e-s);
                    end
                end
%                 maplist(i,j,:)=list;
                maplist(i,j,:)=list*maxv(i,j)/255;
            end
        end

        %
        blkx=zeros(bm,bn);%
        blky=zeros(bm,bn);%
        for i=1:bm
            for j=1:bn
                blkx(i,j)=(j-0.5)*blkwin;
                blky(i,j)=(i-0.5)*blkwin;
            end
        end
        
        %
        [m,n,k]=size(pic);
        sigma=2*blkwin^2;
        ehcpic=zeros(m,n,3);
        for i=1:m
            for j=1:n
                bi=ceil(i/blkwin);
                si=max(bi-2,1);
                ei=min(bi+2,bm);
                bj=ceil(j/blkwin);
                sj=max(bj-2,1);
                ej=min(bj+2,bn);
                %
                eff=exp(-((blky(si:ei,sj:ej)-i).^2+abs(blkx(si:ei,sj:ej)-j).^2)/sigma);
                eff=eff/sum(eff(:));
                ehcpic(i,j,1)=sum(sum(eff.*maplist(si:ei,sj:ej,pic(i,j,1)+1)));
                ehcpic(i,j,2)=sum(sum(eff.*maplist(si:ei,sj:ej,pic(i,j,2)+1)));
                ehcpic(i,j,3)=sum(sum(eff.*maplist(si:ei,sj:ej,pic(i,j,3)+1)));
            end
        end
end