function fFatora(raizes)
  text = "P(x) = ";

  for raiz = raizes
      vr = -real(raiz.valor);
      v = mat2str(-real(raiz.valor));
      if (vr >= 1e-14)
        v = strcat("+", v);
      end
      m = mat2str(raiz.multiplicidade);
      v = strrep(v, "+",  "+ ");
      v = strrep(v, "-",  "- ");

        v = cstrcat("(x ", v, ")^", m);
        text = cstrcat(text, v, " * ");
  end
  text = strtrunc(text, length(text) - 2); % remove último *
  disp(text);
end
