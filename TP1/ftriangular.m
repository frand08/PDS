function y = ftriangular(A,fc,sym,offset,N,fs)
% A: amplitud (input)
% fc: frecuencia de la onda (input)
% sym: punto de simetria en porcentaje de 0 a 1 (input)
% offset: nivel de continua (input)
% N: numero de muestras (input)
% fs: frecuencia de muestreo (input)
% y: triangular (output)
    
    
    if fs<fc                                                            % en caso que sea fc mayor que fs voy a tomar que dio la vueta
        fc = fc - fs;
    end
    muestras_periodo = ceil(fs/fc);                                     % cantidad de muestras por periodo 

    muestras_sympos = ceil(sym*muestras_periodo);                       % cantidad de muestras que se mantiene en 1 (sin amplitud)
    
    muestras_symneg = floor((1-sym)*muestras_periodo);                  % cantidad de muestras que se mantiene en -1 (sin amplitud)
    
    t=(-1+1/muestras_sympos):1/muestras_sympos:(1);
    aux_muestrassympos=t;                                                  % Para el ciclo de actividad positivo
    
    t=(-1+1/muestras_symneg):1/muestras_symneg:(1);
    aux_muestrassymneg=-t;                                                % Para el ciclo de actividad negativo
        
    sal = 0;
    muestras_restantes = N-1;                                           % cantidad de muestras que me van quedando
    
    sal =-(0:1/muestras_sympos:1);
    
    muestras_restantes = muestras_restantes - length(sal);
    
    while(muestras_restantes>0)                                         % mientras tenga muestras, repito el proceso
        if(muestras_restantes>muestras_sympos)                        % En caso de que no sean suficientes las muestras del duty
            muestras_restantes = muestras_restantes - muestras_sympos;    % refresco las muestra que me quedan
            
            sal = [sal aux_muestrassympos];
        else                                                            % si es menor, quiere decir que termino luego de esto
            %aux=(-1+1/muestras_restantes):1/muestras_restantes:1;
            sal = [sal aux_muestrassympos(1:muestras_restantes)];
            
            muestras_restantes=0;                               
            
        end
        

        if(muestras_restantes>muestras_symneg)                          % lo mismo pero para no duty
            muestras_restantes = muestras_restantes - muestras_symneg;
            
            sal = [sal aux_muestrassymneg];
        elseif muestras_restantes>0
            %aux=-((-1+1/muestras_restantes):1/muestras_restantes:1);
            sal = [sal aux_muestrassymneg(1:muestras_restantes)];
            
            muestras_restantes=0;
            
        end
        
    end

    
    y = offset + A*sal;
    
end