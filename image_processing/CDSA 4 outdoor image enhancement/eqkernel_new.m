% function h=eqkernel(pic)
%         [h,count]=imhist(uint8(pic(:)));
%         
%         jnd=ceil(getjnd());
%         totaln=sum(h(:));
%         N=256;
% %         ratio=2;
%         ratio=2;
%         
%         
%         while(1)
%             maph=h; %maph���ڴ洢ӳ���ı仯ֵ
%             for i=2:N;
%                 maph(i)=maph(i-1)+maph(i);
%             end
%             maph=round(maph/totaln*255);
%             clip=(jnd(maph+1))'*ratio;
%             step=floor(h/totaln*255); %�����һ�Ҷȼ��Ĳ���
%             atag=step>clip;   %�ҵ���Ҫclip�ĻҶȼ�
%             if(sum(atag))==0
%                 break;
%             end
%             lasth=h;
%             h=min(h,floor(clip/255*totaln));
%             excess=sum(lasth-h);
%             mexcess=floor(excess/N);
% 
%             for i=1:N %����������Ĳ���
%                 if step(i)<clip(i)-floor(mexcess/totaln*255)
%                     h(i)=h(i)+mexcess;
%                     excess=excess-mexcess;
%                 elseif step(i)<clip(i)
%                         excess=excess-floor(clip(i)/255*totaln)+h(i);
%                         h(i)=floor(clip(i)/255*totaln);
%                 end
%             end
% 
%             while excess>0 %С������
%                 for i=1:N              
%                     if h(i)<floor(clip/255*totaln)
%                         h(i)=h(i)+1;
%                         excess=excess-1;
%                     end
%                     if excess<=0
%                         break;
%                     end
%                 end
%             end
%         end
% 
%         
%         %������ֵ
%         list=h;
%         tag=list==0;%�ҳ�Ϊ0�ĻҶȼ�
%         tag(1)=0;
%         tag(256)=0;
%         list=list/sum(list(:));
%         for k=2:256
%             list(k)=list(k-1)+list(k)*255;
%         end
% 
%         for k=1:256
%             if tag(k)%�ҵ�Ϊ0�ĻҶȼ�������в�ֵ
%                 for ii=k:-1:1
%                     if(~tag(ii))
%                         s=ii;
%                         break;
%                     end
%                 end
%                 for ii=k:256
%                     if(~tag(ii))
%                         e=ii;
%                         break;
%                     end
%                 end
%                 list(k)=list(e)*(k-s)/(e-s)+list(s)*(e-k)/(e-s);
%             end
%         end
%         h=list;
% end

function h=eqkernel_new(h,maxv)

        jnd=ceil(getjnd());
        totaln=sum(h(:)); %��count
        N=256;
        ratio=1+(1-getentropy(h)/8);
        
        while(1)
            maph=h; %maph���ڴ洢ӳ���ı仯ֵ
            for i=2:N;
                maph(i)=maph(i-1)+maph(i);
            end
            maph=round(maph/totaln*maxv);%��ӳ��
            clip=(jnd(maph+1))'*ratio;
            step=floor(h/totaln*maxv); %���е�component�߶�
            atag=step>clip;   %�ҵ���Ҫclip�ĻҶȼ�
            if(sum(atag))==0
                break;
            end
            lasth=h;
            h=min(h,floor(clip/maxv*totaln));
            excess=sum(lasth-h);
            mexcess=floor(excess/N);

            for i=1:N %����������Ĳ���
                if step(i)<clip(i)-floor(mexcess/totaln*maxv)
                    h(i)=h(i)+mexcess;
                    excess=excess-mexcess;
                elseif step(i)<clip(i)
                        excess=excess-floor(clip(i)/255*totaln)+h(i);
                        h(i)=floor(clip(i)/255*totaln);
                end
            end

            while excess>0 %С������
                for i=1:N              
                    if h(i)<floor(clip/maxv*totaln)
                        h(i)=h(i)+1;
                        excess=excess-1;
                    end
                    if excess<=0
                        break;
                    end
                end
            end
        end

        
%         %������ֵ
%         list=h;
%         tag=list==0;%�ҳ�Ϊ0�ĻҶȼ�
%         tag(1)=0;
%         tag(256)=0;
%         list=list/sum(list(:));
%         for k=2:256
%             list(k)=list(k-1)+list(k)*maxv;
%         end
% 
%         for k=1:256
%             if tag(k)%�ҵ�Ϊ0�ĻҶȼ�������в�ֵ
%                 for ii=k:-1:1
%                     if(~tag(ii))
%                         s=ii;
%                         break;
%                     end
%                 end
%                 for ii=k:256
%                     if(~tag(ii))
%                         e=ii;
%                         break;
%                     end
%                 end
%                 list(k)=list(e)*(k-s)/(e-s)+list(s)*(e-k)/(e-s);
%             end
%         end
%         h=list;
end