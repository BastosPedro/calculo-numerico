function columnflag = crit_coluna(a, size)
  %criterio das colunas
  columnflag = 0;
  columnalpha = sum(abs(a)); %sum nos dá um array com a soma de cada coluna
  for i = 1:1:size %ajustando o alpha, taç qual no criterio das linhas
    columnalpha(i) = columnalpha(i) - abs(a(i,i));
    columnalpha(i) = columnalpha(i)/abs(a(i,i));
  end
  columnflag = max(columnalpha);
  disp('alfa maximo de colunas');
  disp(columnflag);
  end