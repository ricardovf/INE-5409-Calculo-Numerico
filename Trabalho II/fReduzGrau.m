function polinomios = fReduzGrau(a, divisor, vezes = 1)
  % aplica briot-ruffini para reduzir o grau e obter o resto das divisões

  if (vezes < 1)
    error("A redução de grau precisa ser aplicada ao menos 1 vez.");
  end

  polinomios = {};

  p = a;
  for k = [1:vezes]
    n = length(p);

    for i = [2:n]
      p(i) += p(i-1)*divisor;
    end

    polinomios(k).resto = p(length(p));
    p = p(1:n-1);
    polinomios(k).polinomio = p;
  end
end
