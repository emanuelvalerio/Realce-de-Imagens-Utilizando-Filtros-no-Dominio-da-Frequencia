% Implementação do filtro Laplaciano

function filterLaplacian = laplacianFilter(im)
 im = im2double(im); 
    [m,n] = size(im);  % dimensao da imagem de entrada 
    im = normalize(im); % Como solicitado na teoria, se faz necessario normalizar os pixels
    fftImg = fft2(im);   % calculo da transformada de Fourier 2D

    fftShift = fftshift(fftImg);  
    fftReal = abs(fftShift);  % Obtendo a parte real da transformada de Fourier
    
    H = zeros(m,n);
    D = zeros(m,n);

    % Aplicacao do calculo matematico para o Laplaciano, pecorrendo todos
    % os pontos da imagem e realizando os calculos
    for u=1:m
        for v=1:n
            D(u,v)=sqrt((u-(m/2))^2+(v-(n/2))^2);
            H(u,v) = -4*pi*pi*D(u,v)^2; % calculo da funcao para filtro Laplaciano
        end
    end
    
    X = fftShift.*H; % Multiplicacao da transformada de Fourier pelo filtro obtido
    invX = abs(ifft2(X)); % Calculo inverso, obtendo a imagem no dominio do tempo
    % Realizacao de alguns outros processos exigidos na implementacao do
    % filtro
    maxi = max(max(invX)); % Maximo valor
    [m n] = size(invX);

   invX = invX/maxi; % Dividindo a imagem filtrada pelo maximo valor

 if invX < 0
   invX = -invX; % retorna multiplicando por -1 caso o resultado obtido seja negativo
  end
filterLaplacian = invX;
end