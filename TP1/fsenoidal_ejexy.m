function [y, tout] = fsenoidal_ejexy(A,fo,phase,offset,N,fs)
% A: amplitud (input)
% fo: frecuencia de la onda (input)
% phase: desfazaje (input)
% offset: nivel de continua (input)
% N: numero de muestras (input)
% fs: frecuencia de muestreo (input)
% y: senoidal (output)
% tout: tiempo en segundos (output)
    y=fsenoidal(A,fo,phase,offset,N,fs);
    tout = 0:1/fs:(1/fs*N-1/fs);                    % Eje de tiempo
end