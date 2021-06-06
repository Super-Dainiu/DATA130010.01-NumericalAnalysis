n=100;
h=2/n;
x=linspace(-1,1,n+1);
f=zeros(n+1,n+1);
f(1,:)=x+1; f(n+1,:)=x+1; f(:,1)=x.^2'-1; f(:,n+1)=x.^2+1;
f=reshape(f',[(n+1)^2,1])
Txx = spdiags([[1/h^2*ones(1,n+1)]' [-2/h^2*ones(1,n+1)]' [1/h^2*ones(1,n+1)]'], [-1 0 1], n+1, n+1); 
Tyy = Txx;
L = kron(eye(n+1),Txx)+kron(Tyy,eye(n+1));
L(1:n+1,1:n+1)=eye(n+1); L(1:n+1,n+2:2*n+2)=zeros(n+1);
L(n*(n+1)+1:end,n*(n+1)+1:end)=eye(n+1);  L(n*(n+1)+1:end, (n-1)*(n+1)+1:n*(n+1))=zeros(n+1);
for i=1:n-1
    L(i*(n+1)+1,:)=zeros(1,(n+1)^2);
    L(i*(n+1)+1,i*(n+1)+1)=1;
end
u=reshape(L\f,[n+1,n+1])';
imagesc([-1,1], [-1,1],u);
xlabel("x")
ylabel("y")