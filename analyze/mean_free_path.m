function mfp = mean_free_path(boxName,iterations,pix_dim,phy_dim)
    %MEAN_FREE_PATH takes in the ionized box produced by 21cmFAST; create a
    %binary ionization map by imposing that a pixel is ionized if and only
    %if it is completely ionized, and all other are neutral; then lastly
    %spits out the physical linear distance traveled by a photon to the 
    %neutral pixel from a random ionized pixel and at the random direaction
    %
    %
    %MEAN_FREE_PATH(BOXNAME, ITERATIONS, PIXEL DIMENSION, PHYSICAL DIMENSION)
    
    [vec_x, vec_y, vec_z] = rand_Vec(iterations);
    HII_file = fopen(boxName);
    HII_box = fread(HII_file,'single');
    HII_box = reshape(HII_box, pix_dim, pix_dim, pix_dim);
    %impose ionization condition
    box = HII_box > 0;
    %invert the box the ionized pixels are represented as 1's
    box = (box == 0);
    fclose(HII_file);
    
    %{
    %echo ionization fraction for debugging
    ion = sum(box(:))/double(phy_dim).^3
    %}

    choices_lin = find(box > 0);
    [xi, yi, zi] = ind2sub(size(box), choices_lin);

    %transpose them so matlab won't spit out errors
    xi = xi.';
    yi = yi.';
    zi = zi.';

    mfp = [];
    for count = 1:iterations
        %counter
        if rem(count,10000)==0 && count ~=0
                count
        end
        %plus 0.5 to start out in the middle of a pixel 
        random_ind = randi(length(xi), 1);
        rand_x = xi(random_ind) + 0.5;
        rand_y = yi(random_ind) + 0.5;
        rand_z = zi(random_ind) + 0.5;
        rand_vecx = vec_x(count);
        rand_vecy = vec_y(count);
        rand_vecz = vec_z(count);
        %step size for advancing photon. Chosen to be the size of a pixel.
        t = 1;
        delta_t = 1;
        while 1
            temp_x = rand_x + (t * rand_vecx);
            temp_y = rand_y + (t * rand_vecy);
            temp_z = rand_z + (t * rand_vecz);
            
            %Conditions for determining if the photon reachs a neutral
            %pixel.
            %Note that if the photon hit the edge of the box, it is also 
            %counts as reaching an neutral pixel. Technically, the box in 
            %21cmFAST is periodic, however, this does not really make much
            %difference
            if temp_x < 1 || temp_y < 1 || temp_z < 1 ||...
                temp_x > pix_dim + 1 ||...
                temp_y > pix_dim + 1 || temp_z > pix_dim + 1 || ...
                box(floor(temp_x), floor(temp_y), floor(temp_z)) == 0

                mfp = [mfp t];
                break;
            end
            t = t + delta_t;

        end



    end

end


function [x, y, z] = rand_Vec(iterations)
%generate random 3D UNIT vectors for choosing the direction of photon
    theta  = acos(rand(1, iterations).*2 - 1);
    phi = rand(1,iterations) .* 2 .* pi;
    x = sin(theta) .* sin(phi);
    y = sin(theta) .* cos(phi);
    z = cos(theta);

end

function sphere = spherical_kernel(radius)
    %generate 3D sphere matrix of given radius
    cx = radius + 1;
    cy = radius + 1;
    cz = radius + 1;
    kernel_dim = 2*radius + 1;
    sphere = zeros(kernel_dim, kernel_dim, kernel_dim);

    for i = 1:kernel_dim
        for j = 1:kernel_dim
            for k = 1:kernel_dim
                dist = (cx - i)^2 + (cy - j)^2 + (cz - k)^2;
                if dist <= radius ^ 2
                    sphere(i,j,k) = 1.0;
                end
            end
        end
    end
end