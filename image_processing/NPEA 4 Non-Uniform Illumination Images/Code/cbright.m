function localmax = cbright( pic, win )

    [ m, n, k ] = size( pic );
    localmax = getlocalmax( pic, win );

    extlmax = getextpic( localmax, win );

    for i = 1 + win:m + win
        for j = 1 + win:n + win
            modual = extlmax( i - win:i + win, j - win:j + win );
            modual = modual( modual >= pic( i - win, j - win ) );
            localmax( i - win, j - win ) = min( modual( : ) );
        end 
    end 
    
end