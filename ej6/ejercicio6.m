
plot(stim,mean(neuron1)/get_rmax(neuron1),stim,mean(neuron2)/get_rmax(neuron2),stim,mean(neuron3)/get_rmax(neuron3),stim,mean(neuron4)/get_rmax(neuron4))

[medias , varianzas] = fano(neuron1);
rectaAjuste = polyval(polyfit(medias,varianzas,1),medias);
plot(medias,rectaAjuste,medias,varianzas,'.'); xlabel('Media'); ylabel('Varianza'),title('Neurona 1');

plot(stim,mean(neuron1),stim,mean(neuron2),stim,mean(neuron3),stim,mean(neuron4));

%Todas las neuronas juntas con f / rmax 
plot(stim,mean(neuron1)/get_rmax(neuron1),stim,mean(neuron2)/get_rmax(neuron2),stim,mean(neuron3)/get_rmax(neuron3),stim,mean(neuron4)/get_rmax(neuron4));
xlabel('Direccion'); ylabel('f/rmax'); title('Conjunto de datos');
c = [cos(degtorad(45)),cos(degtorad(135)),cos(degtorad(225)),cos(degtorad(315))];


% Vector poblacional 
% se sabe que los valores de c son : 45 , 135 , 225 , 315 %




