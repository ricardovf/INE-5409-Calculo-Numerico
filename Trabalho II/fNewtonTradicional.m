function x = fNewtonTradicional(a, xini)
    n = length(a);
    x = xini;
    k = 0;
    dif = Inf;
    derivada = fDerivadaPolinomio(a);

    while dif > 1e-14 && k < 1000
        k = k+1;
        deltax = - fResolvePolinomio(a, x) / fResolvePolinomio(derivada, x);
        x = xini + deltax;
        dif = abs(deltax);
        xini = x;
    end
end
