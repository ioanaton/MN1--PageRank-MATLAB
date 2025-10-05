function [R1 R2]=PageRank(file1,d,eps)
    file=fopen(file1,'r');
  N=fscanf(file,"%d",1);%citim N
  R=ones(N,1);%initiam R cu 1
  A=zeros(N,N);%initializam matricea de adiacenta cu 0
  one1=ones(N,1);
  for i= 1:N
    a(i)=fscanf(file,"%d",1);
    link_nr(i)=fscanf(file,"%d",1);%citim nr de linkuri de la ficare link
      for j=1:link_nr(i)
        node=fscanf(file,"%d",1);
        A(i,node)=1;
        if A(i,i)==1% daca pagina contine link catre ea insasi
          A(i,i)=0;
          link_nr(i)--;%scadem nr de linkuri din pagina
        endif
      endfor
  endfor
  val1=fscanf(file,"%f",1);% reading val1 and val2
  val2=fscanf(file,"%f",1);
  for t=1:N
    for i=1:N
      A(t,i)=A(t,i)/link_nr(t);
    endfor
  endfor
  
 outputfile=[file1 ".out"];%formam numele fisierului in care scriem
  file_out=fopen(outputfile,'w');%deschidem fisierul de output
  %aval1+b=0
  %aval2+b=1
  a=1/(val2-val1);%calculam a
  b=1-a*val2;%calculam b
  PR=Iterative(file1,d,eps);%calculam PR cu Iterative
  PR1=Algebraic(file1,d,eps);%calculam PR cu Algebraic
    fprintf(file_out,"%d \n",N);%printam nr de noduri
  for i=1:N
  fprintf(file_out,"%f \n",PR(i,1));%printam PR
  endfor
    fprintf(file_out,"\n");
    for i=1:N
  fprintf(file_out,"%f \n",PR1(i,1));%printam PR1
  endfor
      fprintf(file_out,"\n");

 K=zeros(N,1);%vector in care vom retine ordinea nodurilor
 for i=1:N
   K(i,1)=i;%introducem nodurile in vector
  endfor
  for i=1:N-1
    for j=i:N
      if PR(i)<PR(j)%sortam valorile si schimbam ordinea nordurilor
        aux=PR(i);
        PR(i)=PR(j);
        PR(j)=aux;
        k=K(i,1);
        K(i,1)=K(j,1);
        K(j,1)=k;
      endif
    endfor
  endfor
  
  for i=1:N%printam nr si nodurile in ordinea schimbata
   fprintf(file_out,"%d ",i);
  fprintf(file_out,"%d ",K(i));
    if(PR(i,1)<val1)
      F(i)=0;
     endif%calculam fct F pt fiecare val din PR sortat
       if(PR(i,1)>val1 || PR(i,1)<val2);
       F(i)=a*PR(i,1)+b;
     endif
     if(PR(i,1)>val2);
     F(i)=1;
     endif
    fprintf(file_out,"%f\n",F(i));%printam valoarea functiei F
    
   endfor
   fclose(file_out);
endfunction
