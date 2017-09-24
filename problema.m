function r = problema(t)
  %achando o valor de mi, para cada t colocado
  if(t>=0 && t<50)
    mi = 242;
  elseif(t>=50 && t<100)
    mi = 82.1;
  elseif(t>=100 && t<150)
    mi = 30.5;
  elseif(t>=150 && t<200)
    mi = 12.6;
  else
    mi = 5.57;
  end
  %calculando o valor de h separadamente, para facilitar a leitura do código
  h = ((0.023*0.153)/1.032) * ((180000/(pi*1.032*mi))^0.8) * ((mi*(0.53+0.00065*t))/0.153);
  %calculando o valor da função dentro da integral, para um dado valor de t
  r = ((0.53+0.00065*t)/(h*(250-t))); 
    