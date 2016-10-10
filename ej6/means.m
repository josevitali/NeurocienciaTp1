function rta = means(matrix)
    dim = size(matrix);
    rta = zeros(1,dim(2));    
    for i = 1 : dim(2)
       rta(i) = mean(matrix(:,i));        
    end
end