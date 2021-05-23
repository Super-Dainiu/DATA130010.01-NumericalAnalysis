f=@(x) x.^64-0.1;
[x,res]=bisection(f,0,1);
semilogy(res,'b');
hold on
n=numel(res);
x=linspace(1,n,n)';
A=@(x)[x,sin(x),cos(x),sin(2*x),cos(2*x),sin(3*x),cos(3*x),ones(numel(x),1)];
[Q,R]=qr(A(x),0);
w=R\(Q'*log(res'));  %linear model on log(y)
x=linspace(1,n,1000)';
semilogy(x,exp(A(x)*w));
