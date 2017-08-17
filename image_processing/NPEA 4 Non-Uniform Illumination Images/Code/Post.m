function output = Post( pic )

    [ k1, k2, k3 ] = size( pic );
    
    for i = 1:k3
        tpic = double( pic( :, :, i ) );
        minv = min( tpic( : ) );
        maxv = max( tpic( : ) );
        u = mean( tpic( : ) );
        tpic = tpic - u;
        tpic = ( tpic .* tpic ) / k1 / k2;
        sigma = sqrt( sum( tpic( : ) ) );
        low = u - 3 * sigma;
        high = u + 3 * sigma;
        
        if low < minv
            low = minv;
        end 
        
        if high > maxv
            high = maxv;
        end
        
        tpic = double( pic( :, :, i ) );
        tpic = ( tpic >= low ) .* tpic + ( tpic < low ) .* low;
        tpic = ( tpic <= high ) .* tpic + ( tpic > high ) .* high;

        pic( :, :, i ) = tpic;
    end 
    
    pic = ( pic - min( pic( : ) ) ) / ( max( pic( : ) ) - min( pic( : ) ) ) * 255;
    output = pic;
    
end