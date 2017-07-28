imclose    %zárás
imopen     %nyitás
bwmorph    %vékonyítás
imnoise    %rárak mindenféle zajt a képre
fspecial   %szûrõk, kerneleket lehet ezzel definiálni
edge       %canny is ebben van

% HOUGH TRANSF %
% rho és theta értékékkel egyenes keresés
% minden pontra megnézni összes egyenes lehetõséget (addot felbontáson)
% rho-theta mátrix, amiben minden elem egy egyenese, és benne az értékek
%... jelentik, hogy hány pont van az adott egyenesen
% legnagyobb elemekre megmondjuk hogy azok tényleg egyenesek
