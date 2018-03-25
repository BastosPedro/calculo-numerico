function columnmax = crit_coluna(a, size)
  %criterio das colunas
  columnmax = 0; %columnmax guardará o maior valor de alpha
  columnalpha = sum(abs(a)); %sum nos dá um array com a soma de cada coluna
  for i = 1:1:size %ajustando o alpha, taç qual no criterio das linhas
    columnalpha(i) = columnalpha(i) - abs(a(i,i));
    columnalpha(i) = columnalpha(i)/abs(a(i,i));
  end
  columnmax = max(columnalpha);
  disp('alfa maximo de colunas');
  disp(columnmax);
  end