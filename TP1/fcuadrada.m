function y = fcuadrada(A,fc,tau,offset,N,fs)
% A: amplitud deseada (input)
% fc: frecuencia de la onda (input)
% tau: ciclo de actividad en porcentaje de 0 a 1 (input)
% offset: nivel de continua (input)
% N: numero de muestras de la senoidal (input)
% fs: frecuencia de muestreo (input)
% y: cuadrada (output)



    muestras_periodo = ceil(fs/fc);                                     % cantidad de muestras por periodo 
    
    muestras_duty=ceil(tau*muestras_periodo);                           % cantidad de muestras que se mantiene en 1 (sin amplitud)
    
    muestras_noduty = floor((1-tau)*muestras_periodo);                  % cantidad de muestras que se mantiene en -1 (sin amplitud)
    
    aux_muestrasduty(1:muestras_duty)=1;                                % Para el ciclo de actividad positivo
    
    aux_muestrasnoduty(1:muestras_noduty)=-1;                           % Para el ciclo de actividad negativo
        
    sal = 0;
    muestras_restantes = N-1;                                           % cantidad de muestras que me van quedando
    
    while(muestras_restantes>0)                                         % mientras tenga muestras, repito el proceso
        if(muestras_restantes>muestras_duty)                            % En caso de que no sean suficientes las muestras del duty
            muestras_restantes = muestras_restantes - muestras_duty;    % refresco las muestra que me quedan
            
            sal = [sal aux_muestrasduty];
        else                                                            % si es menor, quiere decir que termino luego de esto
            aux(1:muestras_restantes)=1;
            muestras_restantes=0;                               
            
            sal = [sal aux];
        end
        

        if(muestras_restantes>muestras_noduty)                          % lo mismo pero para no duty
            muestras_restantes = muestras_restantes - muestras_noduty;
            
            sal = [sal aux_muestrasnoduty];
        elseif muestras_restantes>0
            aux(1:muestras_restantes)=-1;
            muestras_restantes=0;
            
            sal = [sal aux];
        end
        
    end

    
    y = offset + A*sal;
end