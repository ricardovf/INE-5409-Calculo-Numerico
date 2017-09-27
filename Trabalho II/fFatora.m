function fFatora(raizes)
  text = "P(x) = ";

  for raiz = raizes
      v = mat2str(-raiz.valor);
      m = mat2str(raiz.multiplicidade);
      v = strrep(v, "+",  "+ ");
      v = strrep(v, "-",  "- ");

      % se não for zero, imprime a parcela
      if (abs(raiz.valor) > 10e-10)
        v = cstrcat("(x ", v, ")^", m);
        text = cstrcat(text, v, " * ");
      end
  end
  text = strtrunc(text, length(text) - 2); % remove último *
  disp(text);
end
