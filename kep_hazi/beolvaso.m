
% beolvaso file
% kell még egy neural net train file, a kész neural net file ami kiértékel
% egy inputot, és próbálj még egy genetikus algoritmust ami gyárt egy képet
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