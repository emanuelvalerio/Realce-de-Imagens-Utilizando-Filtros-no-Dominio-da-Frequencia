% Implementação do filtro passa-alta ideal
function highIdealPass = highIdealPassFilter(im,D0)
    im = im2double(im); 
    [m,n] = size(im);  % tamanho da imagem ( linhas x colunas)
    fftImg = fft2(im);   %calculo da transformada de Fourier bidimensional

    shiftFFT = fftshift(fftImg);  % centralizando na origem 
    fftReal = abs(shiftFFT);  %Real part of A_shift (Freq domain repres of image)
    
    H = zeros(m,n);
    D = zeros(m,n);
    % Calculo da funcao do filtro passa alta ideal, pecorrendo cada pixel
    % da imagem
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
    
    X = shiftFFT.*H; % Realizando a multiplicacao da transformada de Fourier da imagem pelo filtro
    invX = abs(ifft2(X)); % Realizando o processo inverso, ou seja, trazendo para o dominio do tempo
highIdealPass = invX;
end