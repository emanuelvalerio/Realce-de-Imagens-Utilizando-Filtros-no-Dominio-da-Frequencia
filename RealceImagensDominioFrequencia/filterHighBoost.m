function highBoost = filterHighBoost(im,D0,k)
    im = im2double(im); 
    [m,n] = size(im);  % tamanho da imagem de entrada
    fftImg = fft2(im);   %Aplicando a transformada bidimensional de Fourier

    fftShift = fftshift(fftImg);  % operacao de deslocamneto do espectro
    fftReal = abs(fftShift);  %Obtendo a parte real da transformada de Fourier

    H = zeros(m,n);
    D = zeros(m,n);
    % Calculo da funcao do filtro passa alta ideal
    for u=1:m
        for v=1:n
            D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
            if D(u,v)<=D0
                H(u,v) = 0;
            else
                H(u,v) = 1; 
            end
        end 
    end
    G = (1+k*(H.*fftReal)); %  aplicando a equacao do filtro high-Boost
    invG = abs(ifft2(G));     % Obtendo a imagem filtrada ( processo de aplicacao da transformada inversa de Fourier)
highBoost = invG;
end