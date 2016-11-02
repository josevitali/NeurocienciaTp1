function [  valoresDisparos ] = minMaxComp( ambos )
     threshold = getThreshold(ambos);
     pendientes = diff(ambos); %Pendientes
     %Ahora encontramos los cambios de pendientes
     i = 1 ; 
     nMax = 0;
     valoresDisparos = 0;
     while( i < (length(ambos)-10) )
        maximo=0;
        minimo=0;
         %Primero encuentro un maximo
        while(pendientes(i)<pendientes(i+1) )
            i = i+1;
        end
        if(ambos(i) > threshold)     
            maximo  = ambos(i);
            i = i + 1;
        end
        %guardar solo si ambos cumplen
        
        %Ahora encuentro minimos 
        while(pendientes(i) < pendientes(i+1) && i < length(ambos) )
            i = i+1;
        end
        if(abs(ambos(i)) > abs(threshold))
            minimo = ambos(i);
            i = i+1;
        end
        if(minimo < -threshold &&  maximo > threshold)
            nMax = nMax+1;
            valoresDisparos(nMax,1) = minimo;
            valoresDisparos(nMax,2) = maximo;  
        end
        i = i+1;
     end
     if(valoresDisparos == 0 ) 
        valoresDisparos = 'Asimetria';
     end
 end
    