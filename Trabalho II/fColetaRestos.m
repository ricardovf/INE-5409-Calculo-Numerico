function R = fColetaRestos(a, xini)
  n = length(a);

  for i = [1:n-1]
    divisao = fReduzGrau(a, xini);
    a = divisao.polinomio;
    R(i) = divisao.resto;
  end

  R(n) = 1;
end
