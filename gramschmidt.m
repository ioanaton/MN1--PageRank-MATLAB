function [Q R]= gramschmidth(A)
  [m,n]=size(A)
  Q=[];
  for(i=1:n)
    q=A(1:n,i)#pune coloana i
    aux=q;
    for k=1:i-1
      suma=sum(aux.*Q(:,k));
      q=q-suma*Q(1:m,k);
         endfor
      q=q/norm(q);
     Q=[Q,q];
  endfor
    R=Q'*A;
  endfunction
  
