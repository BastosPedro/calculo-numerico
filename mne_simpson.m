function v = mne_simpson(a,b,n,nome_da_funcao)
  hrange = (b-a)/(2*n); %calculando o valor de h
  sum = 0;
  for count = 1:2:(2*n)-1 %pegando e somando os valores dos f(xi intermediarios
    sum = sum + 2*(nome_da_funcao(a + hrange*(count))) + nome_da_funcao(a+ hrange*(count+1));
  end
  v = (hrange/3)*((2*sum)+nome_da_funcao(a)-nome_da_funcao(b)); %ajustando para somar f(x0) e f(xn)