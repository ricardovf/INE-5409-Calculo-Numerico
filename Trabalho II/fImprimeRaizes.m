function fImprimeRaizes(raizes)
  i = 0;
  for raiz = raizes, i++;
    disp([mat2str(i) "ª raíz tem multiplicidade " mat2str(raiz.multiplicidade) " e valor " mat2str(raiz.valor)]);
  end
end
