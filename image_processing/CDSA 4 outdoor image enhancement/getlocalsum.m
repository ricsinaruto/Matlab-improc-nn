function output=getlocalsum(pic,win)%����
    [m,n]=size(pic);
    output=zeros(m,n);
    extpic=getextpic(pic,win);
    hv=zeros(1,n+2*win);
    for i=1:n+2*win
        hv(i)=sum(extpic(1:2*win,i));%�˴���һ�У�Ϊ�˺��洦��ķ���
    end
    vv=zeros(1,m+2*win);
    for i=1:m+2*win
        vv(i)=sum(extpic(i,1:2*win));%�˴���һ�У�Ϊ�˺��洦��ķ���
    end
    m_modual=sum(vv(1:2*win));%�˴���һ�У�Ϊ�˺��洦��ķ���
    for i=1+win:m+win
        m_modual=m_modual+vv(i+win);
        modual=m_modual;
        hv=hv+extpic(i+win,:);
        for j=1+win:n+win
            modual=modual+hv(j+win);
            output(i-win,j-win)=modual;
            modual=modual-hv(j-win);
        end
        hv=hv-extpic(i-win,:);
        m_modual=m_modual-vv(i-win);
    end
end