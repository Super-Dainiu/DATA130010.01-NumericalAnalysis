f=@(x) power(x,64)-0.1;
[x1,loss1]=bisection(f,0,1);
[x2,loss2]=regula_falsi(f,0,1);