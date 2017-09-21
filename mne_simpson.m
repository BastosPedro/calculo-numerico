function v = mne_simpson(a,b,n,nome_da_funcao)
  hrange = (b-a)/(2*n); %calculando o valor de h
  for count = 0:1:(2*n) %pegando os valores de f(xi)
    aux = a + hrange*count;
    results(count) = nome_da_funcao(aux);
  end
  sum = 0;
  for count = 1:2:n-1 %fazendo a soma dos f(xi) intermediarios
    sum = sum + 2*nome_da_funcao(results(count)) + nome_da_funcao(results(count); 
  end
  v = (hrange/3)*((2*soma)+nome_da_funcao(results(0))-nome_da_funcao(results(n))); %ajustando para somar f(x0) e f(xn)