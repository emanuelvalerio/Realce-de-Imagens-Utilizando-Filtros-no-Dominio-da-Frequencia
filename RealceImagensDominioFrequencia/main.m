%=========================================================================%
% TRABALHO FINAL DA DISCIPLINA DE PROCESSAMENTO DIGITAL DE SINAIS
% TEMA: AGUÇAMENTO DE IMAGENS APLICANDO FILTROS NO DOMINIO DA FREQUENCIA
% NOME : Emanuel Valerio Pereira
% MATRICULA : 471055
%=========================================================================%
% Orientacoes : Caso deseje visualizar o resultado da filtragem em uma
% imgem que nao esta na pasta, basta copiar a imagem para a pasta e colocar
% o nome e a extensao dela nas funcoes imread() abaixo. Junto com o projeto
% deixei algumas imagens para teste, caso queira visualizar essas imagens,
% novamente, verificar qual o nome da imagem e a extensao dela, e alterar
% as funcoes imread() nos respectivos filtros abaixo.
% Os testes de filtragens pode ser realizado alterando os parametros das
% funcoes dos filtros implementados.
%=========================================================================%

x = menu;
while x ~= 9
    switch x
        case 1
            % Quando 1 for digitado, a funcao referente ao filtro
            % passa-alta ideal eh chamada.

            im = imread('Imagens\teste.jpg'); % Imagem de entrada 
            im = rgb2gray(im);        % Alterando para escala de cinza
            im1 = highIdealPassFilter(im,30); % Chamada da funcao do filtro passa alta ideal
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2),imshow(im2double(im)+ im1);title('High Pass Filter');
            pause(3);
            x = menu;
 
        case 2
            % Quando 2 for digitado a funcao do filtro passa alta
            % Butterworth eh chamada
            im = imread('Imagens\teste.jpg'); % Imagem de entrada
            im = rgb2gray(im);        % Mudanca para escala de cinza
            im1 = highFilterButterworth(im,80,4); % Chamada da funcao do filtro passa alta Butterworth
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2),imshow(im2double(im)+ im1);title('Filter High Pass Butterworth');
            pause(3);
            x = menu;
   
        case 3
            % Quando 3 for digitado a funcao do filtro passa alta Gaussiano
            % eh chamada
            im = imread('Imagens\lua.png'); % Imagem de entrada
            im = rgb2gray(im);      % Alterando para escala de cinza
            im1 = highPassGaussianFilter(im,50); % Chamada da funcao do filtro passa alta Gaussiano
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2),imshow(im2double(im)+ im1);title('Filter High Pass Gaussian');
            pause(3);
            x = menu;
          
        case 4
            % Quando 4 for digitado a funcao do filtro Laplaciano eh
            % chamada
            im = imread('Imagens\lua.png'); % Imagem de entrada
            im = rgb2gray(im);        % Alterando para escala cinza
            im1 = laplacianFilter(im); % Chamada do filtro Laplaciano
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2),imshow(im2double(im)+ im1);title('Laplacian Filter');
            pause(3);
            x = menu;
           
        case 5
            % Quando 5 for digitado a funcao do filtro High-Boost eh
            % chamada
            im = imread('Imagens\aorta.png'); % Imagem de entrada
            im = rgb2gray(im);        % Alterando para escala de cinza
            im1 = filterHighBoost(im,500,2); % Chamada da funcao do filtro high-Boost
            im1 = im2double(im)+im1;
            im1 = histeq(im1,100); % Aplicando a equalizacao do histograma
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2),imshow(im1);title('High Boost Filter');
            pause(3);
            x = menu;
           
        case 6
            % Quando 6 for digitado o funcao do filtro homomorfico eh
            % chamada
            im = imread('Imagens\raiox.png'); % Imagem de entrada
            im = rgb2gray(im);        % Alterando para escala cinza
            im1 = homomorphicFilter(im,50,0.9,1.9); % Chamada da Funcao do filtro homomorfico
            subplot(1,2,1);imshow(im);title('Imagem Original');
            subplot(1,2,2);imshow((uint8(im1)));title('Homomorphic Filter');
            pause(3);
            x = menu;
           
        case 7
            % Caso 7 for digitado sera exibido uma comparacao entre todos
            % os filtros implementados
            im = imread('Imagens\montanha.png'); % Imagem de entrada
            im = rgb2gray(im);           % Mudanca para escala cinza 
            im1 = highIdealPassFilter(im,60); % Chamada do filtro passa alta ideal
            im2 = highFilterButterworth(im,60,2); % Chamada do filtro passa alta Butterworth
            im3 = highPassGaussianFilter(im,60);  % Chamada do filtro passa alta Gaussiano
            im4 = laplacianFilter(im);            % Chamada do filtro Laplaciano
            im5 = filterHighBoost(im,60,2);       % Chamada do filtro High-Boost
            im6 = homomorphicFilter(im,60,0.9,1.9);% Chamada do filtro Homomorfico

            subplot(3,2,1),imshow(im);title('Original Image');
            subplot(3,2,2),imshow(im2double(im)+im1);title('High Pass Filter');
            subplot(3,2,3),imshow(im2double(im)+ im2);title('Filter High Pass Butterworth');
            subplot(3,2,4),imshow(im2double(im)+ im3);title('Filter High Pass Gaussian');
            subplot(3,2,5),imshow(im2double(im)+ im4);title('Laplacian Filter');
            im5 = im2double(im)+im5;
            im5 = histeq(im5,500); % equalizacao do histograma
            subplot(3,2,6),imshow(im5);title('High Boost Filter');
            pause(3);
            x = menu;
        case 8
            fprintf('==================================================\n');
            fprintf('highIdealPassFilter(imagem,D0);\n');
            fprintf('highFilterButterworth(imagem,D0,n);\n');
            fprintf('highPassGaussianFilter(imagem,D0);\n');
            fprintf('laplacianFilter(imagem);\n');
            fprintf(' filterHighBoost(imagem,D0,k);\n');
            fprintf('homomorphicFilter(imagem,D0,GL,GH);\n');
            fprintf('. D0 representa a frequencia de corte\n');
            fprintf('. n a ordem do filtro \n');
            fprintf('. k, GH e GL sao parametros especificos do filtro\n');
            fprintf('==================================================\n');
            t = input('Pressione qualquer tecla para encerrar -> ');
            x = menu();
        otherwise
            x = 9;
    end
end