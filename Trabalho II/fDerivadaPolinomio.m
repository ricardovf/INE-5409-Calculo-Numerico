function d = fDerivadaPolinomio(a, x)
  n = length(a);

  for i = [1:n-1]
    d(i) = a(i) * (n - i);
  end

  d = d(1:n-1);
end
