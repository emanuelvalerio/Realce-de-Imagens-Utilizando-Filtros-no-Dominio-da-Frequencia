% Implementacao de um Menu 
function menu = menu()
clc;clear all;
    fprintf('================================================================\n');
    fprintf('-> Escolha uma das opções abaixo \n');
    fprintf('1) - Filtro passa-alta Ideal \n');
    fprintf('2) - Filtro passa-alta Butterworth\n');
    fprintf('3) - Filtro passa-alta Gaussiano\n');
    fprintf('4) - Filtro Laplaciano\n');
    fprintf('5) - Filtro High-Boost (ênfase de alta frequência)\n');
    fprintf('6) - Filtragem Homomórfica\n');
    fprintf('7) - Vizualizar Comparação entre os Filtros\n');
    fprintf('8) - Parâmetros dos filtros\n')
    fprintf('9) - Encerrar\n');
    x = input('->');
    menu = x;
end