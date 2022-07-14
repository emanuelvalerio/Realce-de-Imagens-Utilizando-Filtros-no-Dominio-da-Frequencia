% Implementacao do filtro passa-alta Butterworth
function butterworthFilter = highFilterButterworth(im,D0,N)

    im = im2double(im); % converte a imagem em precisao double
    [m,n] = size(im);  % tamanho da imagem de entrada
    fftImg = fft2(im);   %calculo da transformada bidimensional de Fourier

    fftShift = fftshift(fftImg);  % deslocando a imagem para origem
    fftReal = abs(fftShift);  % obtendo a parte real da transformada
    
    H = zeros(m,n);
    D = zeros(m,n);
    % Pecorrendo pixel a pixel para calcular o filtro
    for u=1:m
        for v=1:n
            D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
            H(u,v) = (1/(1+(D0/D(u,v)))^2*N); % funcao do filtro butterworth
        end
    end

    X = fftShift.*H; % multiplicando a transformada da imagem pelo filtro
    invX = abs(ifft2(X)); % Processo inverso (obtendo o resultado da filtragem) e trazendo para o dominio temporal

butterworthFilter = invX;
end