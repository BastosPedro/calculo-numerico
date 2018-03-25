function [x,nite] = mne_slgjacobi(a,b,x0,nmaxnite,tol)
  [a_column, a_row] = size(a);
  %pega o n�mero de colunas e linhas, considerando que � 
  %uma matriz quadrada, tanto faz usar o n�mero de linhas ou colunas  
  
  %checando se uma ou mais dos crit�rios foram obedecidos
  if(crit_linha(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio das linhas');
  end
  if(crit_coluna(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio das colunas');
  end
  if(crit_sass(a, a_column) < 1)
    disp('vai convergir, de acordo com o criterio de sassenfeld');
  end
  %o c�digo ir� prosseguir se nenhum dos crit�rios for atendido
  %mas n�o existir� garantias de que vai rodar
  
  %a partir daqui formamos a matriz C e g, que satsifazem a equa��o 'xk+1 = C*xk + g'
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
                                           %x at� batermos uma das condi��es
    nite = nite+1;
    x = C*x0 + g;
    dist = norm(x-x0);
    if(dist > tol)
      x0 = x;
    end
  end
  