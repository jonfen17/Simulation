%==========================================================================
% Proyecto Simulación               Mayo 2015
% Dioney Blanco González            131370
% Stefano Molina Martínez           12
%==========================================================================
% Programa para calcular el tamaño de la simulación
%--------------------------------------------------------------------------

function [P] = MBG( So, mu, sigma, T, K, m, n, B)

P = zeros( n, 1);

for j = 1:n
    S     = zeros( m+1, 1);
    S(1)  = So;
    dt    = T/m;
    mu_dt = ( mu - 0.5 * sigma^2 ) * dt;
    sg_dt = sigma * sqrt(dt);

    for i = 1:m
    
        z = randn(1);
        d = mu_dt + sg_dt * z;
    
        S(i+1) = S(i) * exp( d );
        
        if S(i+1) > H
    
    end
    maux = S(m) - K;
    P(j) = max( maux, 0) * exp( -mu * T );
    
end

end
