% Implementação do filtro homomorfico
function filterHomomorphic = homomorphicFilter(a,D0,GL,GH)

    a = double(a); 
    b = a; % Copiando os pixels de a para b

    [m,n] = size(a);  % tamanho da imagem (m(linhas)xn(colunas))
    
    b = b+1;% adiciona 1 pixels para nao possuir valor de pixel 0   
    logB = log(b); % Aplicando o logaritmo 
    fftLog = fft2(logB); % Aplicando a transformada de Fourier bidimensional
    fftShiftLog = fftshift(fftLog);
    % Calculo da funcao do filtro homomorfico, tendo como base a equacao do
    % filtro Gaussiano
    for u=1:m
        for v=1:n
     H(u,v) = (GH - GL)*(1-exp(-1*(sqrt((u-m/2)^2+(v-n/2)^2))^2/D0)^2)+GL;
        end
    end   

    x = fftShiftLog.*H; % Multiplicando a transformada de Fourier pelo funcao do filtro homomorfico
    realX = abs(ifft2(x)); % Obtendo o valor absoluto da transformada inversa
 % Realizando o processo inverso
    finalImg = exp(realX);  % Como foi aplicado ln anteriormente, realiza-se o processo inverso aplicando a exponencial
    filterHomomorphic = finalImg;
end