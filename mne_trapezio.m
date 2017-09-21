function i = mne_trapezio(a,b,n,nome_da_funcao)
  hrange = (b-a)/n %calculando o valor de h
  for count = 0:1:n %pegando os valores de f(xi)
    aux = a + hrange*count;
    results(count) = nome_da_funcao(aux);
  end
  sum = 0;
  for count = 1:1:n-1 %fazendo a soma dos f(xi) intermediarios
    sum = sum + nome_da_funcao(results(count));
  end
  i = (h/2)*((2*sum) + nome_da_funcao(results(0)) + nome_da_funcao(results(0))); %ajustando para somar f(x0) e f(xn)