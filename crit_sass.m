function sassmax = crit_sass(a, size)
  %criterio de sassenfeld
  sassmax = 0; %sassmax será o maior valor de alpha
  sassalpha(1) = 0;
  for i=2:1:size %calcula o primeiro valor em sassalpha
    sassalpha(1) = sassalpha(1) + abs(a(1,i));
  end
  sassalpha(1) = sassalpha(1)/abs(a(1,1));
  for i=2:1:size %começa a calcular os outros valores de sassalpha, a partir da segunda linha 
    sassalpha(i) = 0;
    for j = 1:1:size
      if(j <= i-1) %conta até quando usamos o sassalpha      
        sassalpha(i) = sassalpha(i) + abs(a(i,j))*sassalpha(j);
      else
        sassalpha(i) = sassalpha(i) + abs(a(i,j));
      end
    end
    sassalpha(i) = sassalpha(i) - abs(a(i,i)); %ajustando o alpha, tal qual o criterio das linhas
    sassalpha(i) = sassalpha(i)/abs(a(i,i));
  end
  sassmax = max(sassalpha);
  disp('alfa maximo de sassenfeld');
  disp(sassmax);
  end
  