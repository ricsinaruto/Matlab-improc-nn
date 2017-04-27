
% beolvaso file
% kell m�g egy neural net train file, a k�sz neural net file ami ki�rt�kel
% egy inputot, �s pr�b�lj m�g egy genetikus algoritmust ami gy�rt egy k�pet
all_chars=['A','B','C','D','E','F','G','H','I','J'];
for i=1:10
    temp_folder=char("data/"+all_chars(i)+"/"+"*.png");
    imagefiles = dir(temp_folder);      
    nfiles = length(imagefiles);    % Number of files found
    for j=1:nfiles
        currentfilename = imagefiles(j).name;
        full_filename=char("data/"+all_chars(i)+"/"+currentfilename);
        try
            currentimage = imread(full_filename);
            images{i,j} = currentimage;
        catch 
            warning('file omitted, dont worry');
        end
    end
end

save('images.mat','images');