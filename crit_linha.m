function rowflag = crit_linha(a, size)
  %crit�rio das linhas
  rowalpha = 0;
  rowflag = 0; %se alguma das tr�s bandeiras se tornar 1, ent�o vamos saber
               %que pelo menos um dos crit�rios foi obedecido
  for i = 1:1:size
    rowalpha(i) = sum(abs(a(i,:))); %dessa forma, sum nos dara a soma da linha
    rowalpha(i) = rowalpha(i) - abs(a(i,i)); %ajustando o alpha, retirando aii e dividindo por aii em seguida 
    rowalpha(i) = rowalpha(i)/(abs(a(i,i)));
  end  
  disp('alfa maximo de linhas');
  disp(max(rowalpha));
  if(max(rowalpha) < 1)
    rowflag = 1;
  end