f=@(x) x.^64-0.1;
[x,res]=regula_falsi(f,0,1);
semilogy(res,'r');
hold on
n=numel(res);
k=27;
A=@(x)[x,x.^2,x.^3,x.^4,ones(numel(x),1)];
x=linspace(1,k,k)';
xx=linspace(k,n,n-k+1)';
[Q,R]=qr(A(x),0);
w=R\(Q'*log(res(1:k)'));  %linear model on log(y)
[Q,R]=qr(A(xx),0);
ww=R\(Q'*log(res(k:n)'));  %linear model on log(y)
x=linspace(1,k,500)';
xx=linspace(k,n,1000)';
semilogy([x',xx'],[exp(A(x)*w)',exp(A(xx)*ww)'],"b");

