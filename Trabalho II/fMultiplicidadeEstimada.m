function m = fMultiplicidadeEstimada(R, limite)
  m = 0;
  s = 0;
  n = length(R);
  for i = [1:n]
    s += abs(R(i));

    if (s < limite)
      m++;
    else
      break;
    end
  end

  if (m == 0)
    m = 1;
  end
end
