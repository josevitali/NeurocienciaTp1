function plotOjos() 

	titles = {'Ojo derecho','Ojo izquierdo', 'Ambos Ojos'};
	filenames = {'ojoderecho.dat', 'ojoizquierdo.dat', 'ojoambos.dat'};


	for i = 1 : 3	
		subplot(3,1,i);
		[count threshold] = blinkCounter(filenames{i})
		title(titles{i});
	end	

end
