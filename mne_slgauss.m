function x = mne_slgauss (a,b)
  [a_column, a_row] = size(a);
  %pega o n�mero de colunas e linhas, considerando que � 
  %uma matriz quadrada, tanto faz usar o n�mero de linhas ou colunas
  
  %aqui checamos logo de cara se o sistema � SPD, SPI ou SI
  if(det(a) ~= 0)
    if(b == 0)
      disp('SPD com solucao trivial')
      x = zeros(a_column);
      return;
    else
      disp('SPD sem solucao trivial, prosseguindo com as contas...');
    end
  else
    flag = 0;
    for k = 1:1:(a_column);
      if(mod(a(:,k),b) == 0) %checa se b � m�ltiplo de alguma coluna de a
        flag = 1;
        break;
      end
    end
    if(b == 0 || flag == 1)
      disp('SPI, terminando');
      return;
    else
      disp('SI, terminando');
      return;
    end
   end
    
  %a primeira etapa do m�todo: a elimina��o  
  for k = 1: 1: (a_column)-1 %pega as linhas
  %aqui come�a o pivoteamento, checando se � necess�rio
  if(abs(a(k,k)) < 1)
    auxmax = a(k,k);
    auxcount = k;
    for m = k+1: 1: a_column  %come�a a percorrer a coluna, procurando o maior m�dulo
      if(abs(auxmax) < abs(a(m,k)));
        auxcount = m;
        auxmax = a(m,k);
      end
    end
    auxrow = a(k,:); %depois de achar o maior m�dulo, � efetuada a troca de linhas
    a(k,:) = a(auxcount,:);
    a(auxcount,:) = auxrow;
    bauxrow = b(k);
    b(k) = b(m); %bom lembrar que temos que modificar o vetor b tamb�m
    b(m) = bauxrow;
    disp(a); %s� pra checar se a troca foi feita corretamente
    disp(b);
  end
    
  for i = k + 1: 1: a_column %pegam as linhas abaixo da linha citada
    aux = a(i,k)/a(k,k);
    a(i,k) = 0;
    for j = k + 1: 1: a_column %pegam os elementos das linhas abaixo da linha citada
      a(i,j) = a(i,j) - aux*a(k,j);
      b(i) = b(i) - aux*b(k);
      end
    end
  end
  
  %a segunda etapa do m�todo: a resolu��o do sistema triangular
  x(a_column) = b(a_column)/a(a_column,a_column); %calcula o valor da variavel na ultima linha
  for k = a_column - 1: -1: 1 %pega a pen�z'ltima linha, calcula de "tr�s pra frente"
    s = 0;
    for j = (k+1): 1 : a_column
      s = s + a(k,j)*x(j); %soma os variaveis ja achadas, para isolar a incongnita
    end
    x(k) = (b(k) - s)/(a(k,k)); %calcula a incognita faltando na linha
  end