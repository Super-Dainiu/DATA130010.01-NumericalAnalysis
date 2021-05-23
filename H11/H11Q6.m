[y,Fs] = audioread('DTMF_dialing.ogg');
info = audioinfo('DTMF_dialing.ogg');
k=1;
s=[1];
e=[];
while k<numel(y)
    while k<numel(y) && abs(y(k))<1e-1
        k=k+1;
    end
    e=[e,k];
    while k<numel(y) && abs(y(k))>1e-1
        k=k+1;
    end
    s=[s,k];
end
s=s(1:end-1); r=[]; t=[];
for i=1:numel(s)
    if e(i)-s(i)>100
        r=[r,e(i)]; t=[t,s(i)];
    end
end
l=[]; h=[];
for i=1:numel(r)-1
    Y=abs(fft(y(r(i):t(i+1)))); L=numel(Y);
    f=Fs*(0:(L/2))/L;
    Y=Y(1:numel(f));
    low=Y(f<1000); [m,index]=max(low); l=[l,f(index)];
    high=Y(f>1000); [m,index]=max(high); h=[h,f(index+numel(low))];
end
% plot(h);
% hold on
% plot(l);
l(l<720)=1; l((l>720)&(l<800))=2; l((l>800)&(l<900))=3; l((l>900))=4;
h(h<1280)=1; h((h>1280)&(h<1400))=2; h((h>1400)&(h<1550))=3; h(h>1550)=4;
mat=[1,2,3,"A";4,5,6,"B";7,8,9,"C";"*",0,"#","D"]; res='';
for i=1:numel(h)
    res=strcat(res,mat(l(i),h(i)));
end
res