function [  valoresDisparos,indices,rta ] = minMaxComp( ambos , upTreshold, downTreshold)
    rta = 1; 
    %threshold = getThreshold(ambos);
     pendientes = diff(ambos); %Pendientes
     %Ahora encontramos los cambios de pendientes
     i = 1 ; 
     nMax = 0;
     valoresDisparos = 0;
     while( i < (length(ambos)-10) )
        maximo=1;
        minimo=1;
        iMin = 1 ;
        iMax = 1;
         %Primero encuentro un maximo
        while(pendientes(i)<pendientes(i+1) )
            i = i+1;
        end
        if(ambos(i) > upTreshold)     
            maximo  = ambos(i);
            iMax = i;
            i = i + 1;
        end
        %guardar solo si ambos cumplen
        
        %Ahora encuentro minimos 
        while(pendientes(i) < pendientes(i+1) && i < length(ambos) )
            i = i+1;
        end
        if( ambos(i) < downTreshold)
            minimo = ambos(i);
            iMin = i;
            i = i+1;
        end
        if( (minimo < downTreshold) && ( maximo > upTreshold))
            nMax = nMax+1;
            indices(nMax,2) = iMin;
            indices(nMax,1) = iMax;
            valoresDisparos(nMax,2) = minimo;
            valoresDisparos(nMax,1) = maximo;  
        end
        i = i+1;
     end
     if(valoresDisparos == 0 ) 
        rta = 0;
     end
 end
    