function symMain()
%符号运算工具箱
% symCal_fun();
%f_sym01();
syms_solve1();
end
function symCal_fun()
a = sym("a");
6 == 3*a

end
function f_sym01()
a = sym('a');
b = sym('b');
c = sym('c');
d = sym('d');
symA = [a,b,c,d]
%numW = rand(1,4)
numW = [1,2,3,4]
s = numW+symA
end
function syms_solve()
%方程组求解
% a = sym("a");
% solve(6 == 3*a)
syms  x y ;
eq = 2*x+4==1;
solve(eq)

eq1 = x+y-1==0;
eq2 = x-y-1==0;
[x1,y1] = solve([eq1,eq2],[x,y])

end

function syms_solve1()
%方程求解
syms x y a b c
eq = a*x^2+b*x+c==0;
solve(eq,x)
f = a*x^2+b*x+c;
solve(f==0,x)
%结果表示成根号形式
end