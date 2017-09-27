function fImprimePolinomio(a)
  text = "P(x) =";
  n = length(a);

  for i = [1:n]
      v = mat2str(real(a(i)));
      if (a(i) >= 0)
        v = cstrcat("+ ", v);
      else
        v = strrep(v, "-", "- ");
      end

      if (i < n)
        v = cstrcat(v, "x^", mat2str(n - i));
      end
      text = cstrcat(text, " ", v);
  end
  disp(text);
end
