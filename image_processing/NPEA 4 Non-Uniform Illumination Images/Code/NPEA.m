function output = NPEA( input )

    pic = imread( input );
    [ m, n, k ] = size( pic );
    tpic = double( pic );
    tpic = tpic / max( tpic( : ) ) * 255;

    G = max( tpic( :, :, 1 ), max( tpic( :, :, 2 ), tpic( :, :, 3 ) ) );
    [ count, scale ] = imhist( uint8( G ) );
    sumPoint = 0;
    dl = 1;
    
    while ( sumPoint < m * n * 0.1 )
        sumPoint = sumPoint + count( dl );
        dl = dl + 1;
    end 
    
    dl = dl - 1;
    tag = G > dl;
    G = G .* tag + ( ~tag ) .* dl;
    G = max( G, 10 );
    G = BiFltL( round( G ) );


    tpic( :, :, 1 ) = tpic( :, :, 1 ) ./ G;
    tpic( :, :, 2 ) = tpic( :, :, 2 ) ./ G;
    tpic( :, :, 3 ) = tpic( :, :, 3 ) ./ G;

    TG = BLT( G );
    tpic( :, :, 1 ) = tpic( :, :, 1 ) .* TG;
    tpic( :, :, 2 ) = tpic( :, :, 2 ) .* TG;
    tpic( :, :, 3 ) = tpic( :, :, 3 ) .* TG;

    tpic = Post( tpic );
    output = uint8( tpic );
    
end