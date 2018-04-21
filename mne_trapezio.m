function i = mne_trapezio(a,b,n,nome_da_funcao)
  hrange = (b-a)/n; %calculando o valor de h
  sum = 0;
  for count = 2:1:n %pegando os valores intermediarios de xi, e somando os respectivos f(xi)
    aux = a + hrange*(count-1);
    sum = sum + feval(nome_da_funcao, aux);
  end
  i = (hrange/2)*((2*sum) + feval(nome_da_funcao, a) + feval(nome_da_funcao, b)); %ajustando para somar f(x0) e f(xn)