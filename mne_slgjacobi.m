function [x,nite] = mne_slgjacobi(a,b,x0,nmaxnite,tol)
  [a_column, a_row] = size(a);
  %pega o número de colunas e linhas, considerando que é 
  %uma matriz quadrada, tanto faz usar o número de linhas ou colunas  
  
  %critério das linhas
  rowalpha = 0;
  rowflag = 0; %se alguma das três bandeiras se tornar 1, então vamos saber
               %que pelo menos um dos critérios foi obedecido
  for i = 1:1:a_column
    rowalpha(i) = sum(abs(a(i,:))); %dessa forma, sum nos dara a soma da linha
    rowalpha(i) = rowalpha(i) - abs(a(i,i)); %ajustando o alpha, retirando aii e dividindo por aii em seguida 
    rowalpha(i) = rowalpha(i)/(abs(a(i,i)));
  end  
  disp('alfa maximo de linhas');
  disp(max(rowalpha));
  if(max(rowalpha) < 1)
    rowflag = 1;
  end
  
  %criterio das colunas
  columnflag = 0;
  columnalpha = sum(abs(a)); %sum nos dá um array com a soma de cada coluna
  for i = 1:1:a_column %ajustando o alpha, taç qual no criterio das linhas
    columnalpha(i) = columnalpha(i) - abs(a(i,i));
    columnalpha(i) = columnalpha(i)/abs(a(i,i));
  end
  disp('alfa maximo de colunas');
  disp(max(columnalpha));
  if(max(columnalpha) < 1)
    columnflag = 1;
  end
  
  %criterio de sassenfeld
  sassflag = 0;
  sassalpha(1) = 0;
  for i=2:1:a_column %calcula o primeiro valor em sassalpha
    sassalpha(1) = sassalpha(1) + abs(a(1,i));
  end
  sassalpha(1) = sassalpha(1)/abs(a(1,1));
  for i=2:1:a_column %começa a calcular os outros valores de sassalpha, a partir da segunda linha 
    sassalpha(i) = 0;
    for j = 1:1:a_column
      if(j <= i-1) %conta até quando usamos o sassalpha      
        sassalpha(i) = sassalpha(i) + abs(a(i,j))*sassalpha(j);
      else
        sassalpha(i) = sassalpha(i) + abs(a(i,j));
      end
    end
    sassalpha(i) = sassalpha(i) - abs(a(i,i)); %ajustando o alpha, tal qual o criterio das linhas
    sassalpha(i) = sassalpha(i)/abs(a(i,i));
  end
  disp('alfa maximo de sassenfeld');
  disp(max(sassalpha));
  if(max(sassalpha) < 1)
    sassflag = 1;
  end
  
  %checando se alguma das flags se tornou 1
  if(rowflag == 1)
    disp('vai convergir, de acordo com o criterio das linhas');
  end
  if(columnflag == 1)
    disp('vai convergir, de acordo com o criterio das colunas');
  end
  if(sassflag == 1)
    disp('vai convergir, de acordo com o criterio de sassenfeld');
  end
  if(sassflag == 0 && rowflag == 0 && columnflag == 0)
    disp('nenhum critério obedecido, não há garantias');
  end  
  
  %a partir daqui formamos a matriz C e g, que satsifazem a equação 'xk+1 = C*xk + g'
  for i = 1:1:a_column
    for j = 1:1:a_column
      if(i == j)
        C(i,j) = 0;
      else
        C(i,j) = (-1)*(a(i,j)/a(i,i));
      end
    end
    g(i,1) = b(i)/a(i,i);
  end
  
  %a partir daqui calcumos os valores de x
  x = C*x0 + g; %calculamos os primeiros valores de x
  dist = norm(x-x0);
  if(dist > tol)
    x0 = x;
  end
  nite = 1;
  
  while  (nite < nmaxnite) && (dist > tol) %calculamos os valores seguintes de
                                           %x até batermos uma das condições
    nite = nite+1;
    x = C*x0 + g;
    dist = norm(x-x0);
    if(dist > tol)
      x0 = x;
    end
  end