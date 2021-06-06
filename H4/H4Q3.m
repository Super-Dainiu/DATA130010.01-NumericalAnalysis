title=[]; 
color=["r","b","g","m"];
k=1;
for n=[2,3,5,9]  
    r=0.0:2*pi/(n-1):2*pi;
    f=@(x) sin(x);
    ff=@(x) cos(x);
    xx=[];pp=[];
    for i=1:(numel(r)-1)
        x1=r(i); x2=r(i+1);
        c0 = f(x1); c1=ff(x1); c2=((f(x2)-f(x1))/(x2-x1)-ff(x1))/(x2-x1);
        c3=(ff(x1)+ff(x2)-2*(f(x2)-f(x1))/(x2-x1))/(x2-x1)^2; %c0,c1,c2,c3 are the coefficients
        p=@(x) c0+c1*(x-x1)+c2*(x-x1).*(x-x1)+c3*(x-x1).*(x-x1).*(x-x2);
        x = r(i):0.01:r(i+1);  %We estimate on these points
        xx=[xx,x]; %pp=[pp,p(x)];
        pp=[pp,abs((p(x)-sin(x))./sin(x))]; %error analysis
    end
    semilogy(xx,pp,color(k));k=k+1;
    title = [title, "n="+num2str(n)];
    hold on
 end
% plot(xx,sin(xx),"k");
 legend(title(1),title(2),title(3),title(4));