function [R]=Algebraic(file,d)
    file=fopen(file,'r');
  N=fscanf(file,"%d",1);
  R=ones(N,1);
  A=zeros(N,N);
  one1=ones(N,1);
  for i= 1:N
    a(i)=fscanf(file,"%d",1);
    link_nr(i)=fscanf(file,"%d",1);
      for j=1:link_nr(i)
        node=fscanf(file,"%d",1);
        A(i,node)=1;
        if A(i,i)==1
          A(i,i)=0;
          link_nr(i)--;
        endif
      endfor
  endfor
  val1=fscanf(file,"%f",1);
  val2=fscanf(file,"%f",1);
  for t=1:N
    for i=1:N
      A(t,i)=A(t,i)/link_nr(t);%calculam idem matricea ca la iterative
    endfor
  endfor
  A=A';%calculam transpusa
  In=eye(N);%matricea In
  M=In-d*A;%calculam matricea a carei inversa vrem sa o calculam
 % [Q R]=gramschmidt(M);
 


% for i=1:N
  % e(i)=In(:,i);
  % y(i)=Q'*e(i);
 % endfor
 % for i=N:i
  %  for j=1:i-1
   %   sum=R(i,j)*x(j)
   % endfor
  %  x(i)=(b(i)-sum)/A(i,i);
  %endfor
   %InvA=Q*R;
   InvA=inv(M);%calculam inversa de M
  R=InvA*(1-d)/N*one1;%folosim formula pentru a afla R
endfunction