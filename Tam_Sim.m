%==========================================================================
% Proyecto Simulación               Mayo 2015
% Dioney Blanco González            131370
% Stefano Molina Martínez           12
%==========================================================================
% Programa para calcular el tamaño de la simulación
%--------------------------------------------------------------------------

function n = Tam_Sim(So, mu, sigma, T, K, m)

% Realizamos una simulación piloto con N = 100
N = 100;
B = 15e10;
P = MBG_Call_u_o( So, mu, sigma, T, K, B, m, N);

% Determinamos s^2
media = mean(P);
S_sq  = 0;

for j = 1:N
    
    aux  = (P(j) - media)^2;
    S_sq = S_sq + aux;

end

S_sq = ( 1/ (N-1) ) * S_sq;

n    = S_sq * (1.96/.01)^2;


end