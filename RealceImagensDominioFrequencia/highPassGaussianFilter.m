% Implementação do filtro passa-alta Gaussiano
function gaussianFilter = highPassGaussianFilter(im,D0)
im = im2double(im); 
    [m,n] = size(im);  % Tamanho da imagem de entrada 
    fftImg = fft2(im);   %Calculo da transformada de Fourier 2D

    fftShift = fftshift(fftImg);  % deslocando para origem
    fftReal = abs(fftShift);  % Obtendo a parte real da transformada
    
    % Calculo da expresao do filtro passa alta Gaussiano, pecorrendo m*n
    % pontos
    H = zeros(m,n);
    D = zeros(m,n);
    for u=1:m
        for v=1:n
            D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
            H(u,v) = 1 - exp((-(D(u,v).^2))/(2*D0^2)); % Expressao do filtro 
        end
    end

    X = fftShift.*H; %Multiplicando a transformada de Fourier pelo filtro Gaussiano obtido
    invX = abs(ifft2(X)); % Calculo da transformada inversa de Fourier
gaussianFilter = invX;
end