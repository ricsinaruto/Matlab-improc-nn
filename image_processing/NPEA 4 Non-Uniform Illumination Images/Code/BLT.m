function mappic = BLT( pic )

    list = 0:255;
    tag = list <= 127;
    fsmall = 17 * ( 1 - sqrt( list / 127 ) ) + 3;
    flarge = 3 / 128 * ( list - 127 ) + 3;
    jnd = fsmall .* tag + flarge .* ( ~tag );
    
    mlist = 0:255;
    mlist( 1 ) = 127;
    
    for i = 2:256
        previous = round( mlist( i - 1 ) );
        if previous > 256
            break ;
        end 
        mlist( i ) = mlist( i - 1 ) + jnd( previous ) / jnd( i ) * 0.63;
    end 
    
    mlist( i:end  ) = mlist( i - 1 );
    mappic = mlist( round( pic ) );
    
end