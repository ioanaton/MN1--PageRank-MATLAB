function [R]=Iterative(file_name,d,eps)
  file=fopen(file_name,'r');%deschidem fisierul
  N=fscanf(file,"%d",1);%citim nr de noduri
  R=ones(N,1);
  A=zeros(N,N);%initializam matricea de adiancenta cu 0
  one1=ones(N,1);
  for i= 1:N
    a(i)=fscanf(file,"%d",1);%citim nodul
    link_nr(i)=fscanf(file,"%d",1);%citim care nr de linkuri are fiecare pagina
      for j=1:link_nr(i)
        node=fscanf(file,"%d",1);%citim nodul la care pagina are link
        A(i,node)=1;
        if A(i,i)==1% daca exista link spre aceeasi pagina
          A(i,i)=0;%punem 0 pe diag
          link_nr(i)--;%scadem nr de linkuri citite
        endif
      endfor
  endfor
  val1=fscanf(file,"%f",1);%citim val 1 si 2
  val2=fscanf(file,"%f",1);
  for t=1:N
    for i=1:N
      A(t,i)=A(t,i)/link_nr(t);%impartim fiecare val la nr de linkuri existente la un nod
    endfor
  endfor
  A=A';%transpunem A
  R=1/norm(R)*R;%inmultim R cu 1/norma si ii actualizam valoarea
   R1=d.*A*R+((1-d)./N).*one1;
  while norm(R1-R,2)>=eps%cat timp norma e mai mare decat toleranta
    R=R1;% actualizam R
    R1=d.*A*R+((1-d)./N).*one1;%folosim formula
  endwhile
endfunction