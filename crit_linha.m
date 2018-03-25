function rowmax = crit_linha(a, size)
  %critério das linhas
  rowalpha = 0;
  rowmax = 0; %rowmax guardará o maior valor de alpha
  for i = 1:1:size
    rowalpha(i) = sum(abs(a(i,:))); %dessa forma, sum nos dara a soma da linha
    rowalpha(i) = rowalpha(i) - abs(a(i,i)); %ajustando o alpha, retirando aii e dividindo por aii em seguida 
    rowalpha(i) = rowalpha(i)/(abs(a(i,i)));
  end  
  rowmax = max(rowalpha);
  disp('alfa maximo de linhas');
  disp(rowmax);
  end