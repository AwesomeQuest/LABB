function L = Indeplinearity(coeff,x,y)
a=coeff(1);
b=coeff(2);
z=a*x+b;
L=norm(y-z,inf);