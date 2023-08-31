function optimize_()
clc;
clear;
% close all;
global fun;
fun = @(x)(100*(x(2) - x(1)^2)^2 + (1 - x(1))^2);
fminsearch_fun();
fminunc_fun();
end
function fminsearch_fun()
global fun;
 options = optimset('OutputFcn',@bananaoutxx,'Display','off');
 x0 = [-1.9,2];
[x,fval,eflag,output] = fminsearch(fun,x0,options);
x
fval
title 'Rosenbrock solution via fminsearch'
end
function fminunc_fun()
global fun;
options = optimoptions('fminunc','Display','off',...
    'OutputFcn',@bananaoutxx,'Algorithm','quasi-newton');
x0 = [-1.9,2];
[x,fval,eflag,output] = fminunc(fun,x0,options);
title 'Rosenbrock solution via fminunc'
end 