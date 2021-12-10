function symMain()
clear
clc
% symCal_fun();
%f_sym01();
% syms_solve1();
syms_solve_cmd_vel()
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
%���������
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
%�������
syms x y a b c
eq = a*x^2+b*x+c==0;
solve(eq,x)
f = a*x^2+b*x+c;
solve(f==0,x)
%�����ʾ�ɸ�����ʽ
end
function syms_solve_cmd_vel()
%�������
syms vl vr l w v
eq1 =(vl+vr)/2-v==0;
eq2 =(vr-vl)/l-w==0;
[vl,vr] = solve([eq1,eq2],[vl,vr])
[v,w] = solve([eq1,eq2],[v,w])
%�����ʾ�ɸ�����ʽ
end