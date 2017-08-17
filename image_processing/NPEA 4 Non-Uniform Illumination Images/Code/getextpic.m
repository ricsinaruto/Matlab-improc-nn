function output = getextpic( im, win_size )
    
    [ h, w, c ] = size( im );

    extpic = zeros( h + 2 * win_size, w + 2 * win_size, c );
    extpic( win_size + 1:win_size + h, win_size + 1:win_size + w, : ) = im;
    
    for i = 1:win_size
        extpic( win_size + 1 - i, win_size + 1:win_size + w, : ) = extpic( win_size + 1 + i, win_size + 1:win_size + w, : );
        extpic( h + win_size + i, win_size + 1:win_size + w, : ) = extpic( h + win_size - i, win_size + 1:win_size + w, : );
    end 
    
    for i = 1:win_size
        extpic( :, win_size + 1 - i, : ) = extpic( :, win_size + 1 + i, : );
        extpic( :, win_size + w + i, : ) = extpic( :, win_size + w - i, : );
    end 
    
    output = extpic;
    
end