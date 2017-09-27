disp("\n------------------------------------------------")
disp("Método de Newton tracional com multiplicidade 1")
disp("------------------------------------------------")
%format long

% 1*xˆ11 - 3.4*xˆ10 + 2.35*xˆ9 + 4.32*xˆ8 - 7.1685*xˆ7 + 1.56006*xˆ6 + 3.287061*xˆ5 - 2.480058*xˆ4 + 0.531441*xˆ3
%a = [1 -3.4 +2.35  4.32 -7.1685 +1.56006 +3.287061 -2.480058 0.531441  0  0  0];
a = [1 -3 3 -1];

disp("Polinómio original: ");
fImprimePolinomio(a);
% fImprimeRaizes(raizes);

% supondo multiplicidade 1, cálcula as raízes restantes
disp('Calculando usando Newton tradicional suponto multiplicidade 1 para as raízes restantes:');
ultimoPolinomio = a;
xini = 1.1;
for i = [1:length(ultimoPolinomio)-1]
  raizes(i).valor = fNewtonTradicional(ultimoPolinomio, xini);
  raizes(i).multiplicidade = 1;

  disp(cstrcat("Reduzindo grau do polinómio 1 vez com a raíz de valor ", mat2str(raizes(i).valor), ":"))

  ultimoPolinomio = fReduzGrau(ultimoPolinomio, raizes(i).valor, raizes(i).multiplicidade).polinomio;

  xini = raizes(i).valor;
  %fImprimePolinomio(ultimoPolinomio);
end

fImprimeRaizes(raizes);

disp(cstrcat("\nVerificando as ", mat2str(length(raizes)), " raízes encontradas:"));

for raiz = raizes
  disp(cstrcat("Aplicação da raíz no polinómio original: ", mat2str(fResolvePolinomio(a, raiz.valor))))
end

disp("\n------------------------------------------------")
disp("Método de Newton com multiplicidade estimada e uso de restos")
disp("------------------------------------------------")
% structure das raízes
disp('Calculando usando Newton com uso dos restos e estimação das multiplicidades');
ultimoPolinomio = a;
i = 1;
n = length(a);
somaDasMultiplicidades = 0;
xini = 1.1;
while (somaDasMultiplicidades < n - 1)
  raizesB(i) = fNewtonRestos(ultimoPolinomio, xini, 10e-6);

  disp(cstrcat("Reduzindo grau do polinómio ", mat2str(raizes(i).multiplicidade), " vez(es) com a raíz de valor ", mat2str(raizes(i).valor), ":"))

  ultimoPolinomio = fReduzGrau(ultimoPolinomio, raizes(i).valor, raizes(i).multiplicidade).polinomio;
  fImprimePolinomio(ultimoPolinomio);

  % aumentamos i conforme a multiplicidade da última raíz calculada
  somaDasMultiplicidades += raizesB(i).multiplicidade;
  xini = raizesB(i).valor;
  i++;
end

fImprimeRaizes(raizesB);

disp(cstrcat("\nVerificando as ", mat2str(length(raizesB)), " raízes encontradas:"));
for raiz = raizesB
  disp(cstrcat("Aplicação da raíz no polinómio original: ", mat2str(fResolvePolinomio(a, raiz.valor))))
end

fFatora(raizesB);
