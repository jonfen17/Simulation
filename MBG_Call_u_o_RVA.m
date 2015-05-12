%==========================================================================
% Proyecto Simulación               Mayo 2015
% Dioney Blanco González            131370
% Stefano Molina Martínez           12
%==========================================================================
% Programa para calcular el tamaño de la simulación
% Input:
% So - Punto inicial del MBG
% mu    - drift
% sigma - varianza
% T     - Tiempo
% K     - Precio del ejercicio
% B     - Barrera
% m     - tamaño de subintervalos
% n     - número de simulaciones
% 
% Output:
% P   - precios de la opción
% %--------------------------------------------------------------------------

function [P] = MBG_Call_u_o_RVA( So, mu, sigma, T, K, B, m, n)

P = zeros( n, 1);

% Simulamos n veces la trayectoria del MBG Call up and out
for j = 1:n
    
    % Damos condiciones iniciales y el tamaño del intervalo
    S     = zeros( m+1, 1);
    S(1)  = So;
    dt    = T/m;
    mu_dt = ( mu - 0.5 * sigma^2 ) * dt;
    sg_dt = sigma * sqrt(dt);

    for i = 1:(m/2)
    
        z = randn(1);
        d = mu_dt + sg_dt * z;
    
        S(i+1) = S(i) * exp( d );
        
        if S(i+1) >=  B
          
          S(m) = 0;
          break
            
        end
    end
    
    for i = (m/2):m
    
        z = randn(1);
        d = mu_dt - sg_dt * z;
    
        S(i+1) = S(i) * exp( d );
        
        if S(i+1) >=  B
          
          S(m) = 0;
          break
            
        end
    end
    
    maux = S(m) - K;
    P(j) = max( maux, 0) * exp( -mu * T );
    
end

end