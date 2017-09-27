% Determine todas os zeros e respectivas multiplicidades do polinômio de grau 11 com os seguintes coeficientes em ordem decrescente de grau:
%
% a=[1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0]
%
% a). Use o método de Newton tradicional (com multiplicidade M=1) para determinar as raízes (sugestão: Extraia inicialmente as 3 raízes nulas);
%
% b). Use o método de Newton, usando a estimativa da multiplicidade M de cada raiz, para determinar as demais raízes (teste diferentes valores de raízes iniciais e diferentes limites para a soma dos restos na estimativa da multiplicidade). (sugestão: Extraia inicialmente as 3 raízes nulas de Pn(x)=0);
%
% c). Monte o polinômio de grau 11 fatorado;
%
% d). Obtenha as raízes pelo rootsovo do octave e pelo WolfraAlfa.
%
% Obs.:
%
% (i). Faça o algoritmo completo, com um programa principal (tipo main.m) que chame todas as functions necessárias para cada item, postado no ambiente VPL deste link, em ordem de chamada: main.m deve ser o primeiro arquivo;
%
% (ii). Imprima resposta de forma clara e concisa com os resultados de cada item;
%
% (iii) Não pode usar os algoritmos prontos do caderno de algoritmos, apenas aqueles desenvolvidos em aula.
%
% Referência: http://www.mathworks.com/help/matlab/functionlist.html
disp("\n------------------------------------------------")
disp("Método de Newton tracional com multiplicidade 1")
disp("------------------------------------------------")
%format long

% 1*xˆ11 - 3.4*xˆ10 + 2.35*xˆ9 + 4.32*xˆ8 - 7.1685*xˆ7 + 1.56006*xˆ6 + 3.287061*xˆ5 - 2.480058*xˆ4 + 0.531441*xˆ3
a = [1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0];

% structure das raízes
raizes(1).valor = 0;
raizes(1).multiplicidade = 3;

disp("Polinômio original: ");
fImprimePolinomio(a);
% fImprimeRaizes(raizes);

disp(cstrcat("\nReduzindo grau do polinômio ", mat2str(raizes(1).multiplicidade), " vezes com a raíz de valor ", mat2str(raizes(1).valor), ":"))
polinomiosReduzidos = fReduzGrau(a, raizes(1).valor, raizes(1).multiplicidade);
fImprimePolinomio(polinomiosReduzidos(1).polinomio);
fImprimePolinomio(polinomiosReduzidos(2).polinomio);
fImprimePolinomio(polinomiosReduzidos(3).polinomio);

% supondo multiplicidade 1, cálcula as raízes restantes
disp('Calculando usando Newton tradicional suponto multiplicidade 1 para as raízes restantes:');
ultimoPolinomio = polinomiosReduzidos(3).polinomio;
xini = raizes(1).valor; % 0
for i = [2:length(ultimoPolinomio)-1]
  raizes(i).valor = fNewtonTradicional(ultimoPolinomio, xini);
  raizes(i).multiplicidade = 1;

  disp(cstrcat("Reduzindo grau do polinômio 1 vez com a raíz de valor ", mat2str(raizes(i).valor), ":"))

  ultimoPolinomio = fReduzGrau(ultimoPolinomio, raizes(i).valor, raizes(i).multiplicidade).polinomio;
  %fImprimePolinomio(ultimoPolinomio);
end

fImprimeRaizes(raizes);

disp(cstrcat("\nVerificando as ", mat2str(length(raizes)), " raízes encontradas:"));

for raiz = raizes
  disp(cstrcat("Aplicação da raíz no polinômio original: ", mat2str(fResolvePolinomio(a, raiz.valor))))
end

disp("\n------------------------------------------------")
disp("Método de Newton com multiplicidade estimada e uso de restos")
disp("------------------------------------------------")
% structure das raízes
raizes = struct();
raizes(1).valor = 0;
raizes(1).multiplicidade = 3;
polinomiosReduzidos = fReduzGrau(a, raizes(1).valor, raizes(1).multiplicidade);
disp('Calculando usando Newton com uso dos restos e estimação das multiplicidades');
ultimoPolinomio = polinomiosReduzidos(3).polinomio;
i = 2;
n = length(a) - 1;
somaDasMultiplicidades = raizes(1).multiplicidade;

while (somaDasMultiplicidades < n)
  xini = fLocaliza(ultimoPolinomio); % acha x inicial usando cotas limites

  raizes(i) = fNewtonRestos(ultimoPolinomio, xini, 10e-6);

  disp(cstrcat("Reduzindo grau do polinômio ", mat2str(raizes(i).multiplicidade), " vez(es) com a raíz de valor ", mat2str(real(raizes(i).valor)), ":"))
  ultimoPolinomio = fReduzGrau(ultimoPolinomio, raizes(i).valor, raizes(i).multiplicidade);
  ultimoPolinomio = ultimoPolinomio(raizes(i).multiplicidade).polinomio;

  somaDasMultiplicidades += raizes(i).multiplicidade;
  i++;
end

fImprimeRaizes(raizes);

disp(cstrcat("\nVerificando as ", mat2str(length(raizes)), " raízes encontradas:"));

for raiz = raizes
  disp(cstrcat("Aplicação da raíz no polinômio original: ", mat2str(real(fResolvePolinomio(a, raiz.valor)))))
end

disp("\n------------------------------------------------")
disp("Polinômio fatorado: ")
disp("------------------------------------------------")
fFatora(raizes);

disp("\n------------------------------------------------")
disp("Saída do roots(a) do octave: ")
disp("------------------------------------------------")
roots(a)

disp("\n------------------------------------------------")
disp("Saída do WolfraAlfa: ")
disp("------------------------------------------------")
"\nSaída do WolfraAlfa: \n \
http://www.wolframalpha.com/input/?i=1*x%CB%8611+-+3.4*x%CB%8610+%2B+2.35*x%CB%869+%2B+4.32*x%CB%868+-+7.1685*x%CB%867+%2B+1.56006*x%CB%866+%2B+3.287061*x%CB%865+-+2.480058*x%CB%864+%2B+0.531441*x%CB%863 \
\n Raízes reais: \n \
x = -1 \n \
x = 0\n \
\n \
Raízes complexas: \n \
x = 0.898175 - 0.00105142 i\n \
x = 0.898175 + 0.00105142 i\n \
x = 0.899996 - 0.00210907 i\n \
x = 0.899996 + 0.00210907 i\n \
x = 0.901828 - 0.00105766 i\n \
x = 0.901828 + 0.00105766 i\n \
\n \
O WolfraAlfa não informa a multiplicidade das raízes.\
"
