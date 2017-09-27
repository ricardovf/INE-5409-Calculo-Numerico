function r = fNewtonRestos(a, xini, limiteMultiplicidade)
    r = {};
    n = length(a);
    x = xini;
    k = 0;
    dif = Inf;

    while dif > 1e-14 && k < 100
        k = k+1;

        R = fColetaRestos(a, xini);
        m = fMultiplicidadeEstimada(R, limiteMultiplicidade);

        deltax = - R(m) / (m * R(m+1));
        x = xini + deltax;
        dif = abs(deltax);
        xini = x;
    end

    r.valor = x;
    r.multiplicidade = m;
end
