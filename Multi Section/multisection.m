clear all;
clc;
syms teta;
N=input('Enter the number of sectors: \n');
coup=input('Enter the couppling in dB : \n');
coup=10^(-coup/20);
C = sym('C',[1 (N+1)/2]);
x=0;
for i=1:floor(N/2)
    x=x+2*C(i)*sin(teta)*cos((N-(2*i-1))*teta); 
end
x=x+C(ceil(N/2))*sin(teta);
k=1;
for j=0:2:N
    y(k)=subs(diff(x,teta,j),teta,pi/2);
    k=k+1;
end
for i=1:length(y)
coff(i,:)=flip(double(coeffs(y(i))));
end
b=zeros(1,(N+1)/2);
b(1)=coup;
t=inv(coff)*b';
sol=C==t';


