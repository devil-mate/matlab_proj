function syms_claulate_base()
clc
clear
diff_driver();
end
function diff_driver()
syms vr vl v w l;
eq1 =v-(vr+vl)/2;
eq2 = w-(vr-vl)/l;
[vr,vl]=solve(eq1,eq2,vr,vl)

end
function elementary_math_()
end

function linear_alg()
end
% solve 求解析解
function solve_test()
syms x y;
eq1 = x+y-1;
eq2 = x-y+2;
sol =solve(eq1,eq2,x,y);
x =sol.x
y =sol.y
% [x,y] = solve(eq1,eq2,x,y)
value_x = double(x)
valude_y = double(y)
end
% 数值解，fzero 求一元函数零点/解方程
function fzero_test()
syms x y;
fun = @(x)(x^2+x-2);
eq1 = fun
xx=solve(eq1,x)
[x,y] =fzero(fun,-5)
%  xx =sol.x
% y =sol.y
% [x,y] = solve(eq1,eq2,x,y)
% value_x = double(x)
% valude_y = double(y)
end