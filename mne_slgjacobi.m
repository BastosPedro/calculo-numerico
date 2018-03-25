function [x,nite] = mne_slgjacobi(a,b,x0,nmaxnite,tol)
  [a_column, a_row] = size(a);
  %pega o número de colunas e linhas, considerando que é 
  %uma matriz quadrada, tanto faz usar o número de linhas ou colunas  
  
  %checando se uma ou mais dos critérios foram obedecidos
  if(crit_linha(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio das linhas');
  end
  if(crit_coluna(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio das colunas');
  end
  if(crit_sass(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio de sassenfeld');
  end
  %o código irá prosseguir se nenhum dos critérios for atendido
  %mas não existirá garantias de que vai rodar
  
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
  