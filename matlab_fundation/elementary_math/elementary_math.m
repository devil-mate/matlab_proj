% ��һ��������Ϊ������/m�ļ�����ں���
function elementary_math_main()

close all 
clc
clear
% numerical_integration()
graph_fun()
linear_equation()
end


function elementary_math_()
end

function linear_alg()
end

function linear_equation()

x =5+6
%���Է���
end




function differential_equation()
%����΢�ַ���: ��΢�ַ���(ODE)��
sys a b;

end

function numerical_integration()
%��ֵ����
t= 0:0.1:3*pi;
xt = sin(2*t)
yt = cos(t);
% zt = sin(5*t);
plot3(xt,yt,t)
% ������ʽ:���������
f = @(t) sqrt(4*cos(2*t).^2 + sin(t).^2+ 1);
len = integral(f,0,3*pi)


end

function graph_fun()
%ͼ����
% A = [9 1 2;1 5 3;2 3 1];
A = ceil(rand(5)*10)
node_names = {'A','B','C','D','E'};
G = graph(A,node_names,'upper')
figure
plot(G,'EdgeLabel',G.Edges.Weight)
title('undigraph')

G1 = digraph(A,node_names);
figure
title('digraph')
plot(G1,'EdgeLabel',G1.Edges.Weight)

end


