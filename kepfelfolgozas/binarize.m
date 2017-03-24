function kep=binarize(I,kuszob)

for i=1:size(I,1)
    for j=1:size(I,2)
        if I(i,j)<kuszob
            kep(i,j)=0;
        else
            kep(i,j)=1;
        end
    end
end
%okosabb módszer:
%kep=I<kuszob;
end