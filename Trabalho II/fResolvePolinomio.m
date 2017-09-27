function s = fResolvePolinomio(a, x)
  n = length(a);

  s = 0;

  for i = [1:n-1]
    s += a(i) * x ^ (n - i);
  end

  s += a(n);
end
