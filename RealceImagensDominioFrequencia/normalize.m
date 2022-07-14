function normalizar = normalize(im)
     im = im2double(im); 
    [m,n] = size(im);  % size of input image
    maxi = max(max(im));
    mini = min(min(im));
    norma = zeros(m,n);
    for i = 1:m
        for j = 1:n
            norma(i,j) = (im(i,j)-mini)/(maxi-mini);
        end
    end
    normalizar = norma;
end