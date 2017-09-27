function xini = fLocaliza(a)
  raioMax = 1 + (max(abs(a(2:length(a)))) / abs(a(1)));

  aInv = flip(a);
  raioMin = 1 / (1 + (max(abs(aInv(2:length(aInv)))) / abs(aInv(1))));

  %Caso raioMin e RMax sejam iguais
  if abs(raioMin-raioMax)<1e-15
    raioMin=0.99*raioMin;
    raioMax=1.01*raioMax;
  end

  raioMedio = (raioMax + raioMin)/2;
  xini = complex(0.7 * raioMedio, 0.7 * raioMedio);
end
