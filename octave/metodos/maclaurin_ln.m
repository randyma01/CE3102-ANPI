function [Sk,k]=maclaurin_ln(alpha,tol)
  Sk=0;
  k=1;
  error=tol+1;
  while error>=tol
    Sk_new=Sk+((-1)^(k-1)/k)*(alpha-1)^k;
    error=abs(Sk_new-Sk);
    Sk=Sk_new;
    k=k+1;
  end
end


[Sk,k]=maclaurin_ln(0.5,10^-3)
