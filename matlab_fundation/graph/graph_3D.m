function graph_3D()
clc;
clear;
close all;
init();
% plot_3D();
% mesh_test();
% surf_test();
test();

end
function init()
global theta;
global t;
t = 0:pi/50:2*pi;
theta = 0:2*pi/100:2*pi;
end


function plot_3D()
%������ά���ߣ�plot3���� 
global t;
global theta;
x = 8*cos(t);
y =4*sqrt(2)*sin(t);
z = -4*sqrt(2)*sin(t);
plot3(x,y,z);
grid;
% plot3(x,y,t)
c1 =10;
c2 = 10;
c3= 10;
r =1;
%��ά�ռ���Բ�Ĳ������̣�(c1,c2,c3)Բ�ģ�a��b ����(�������ȡ�����ݣ�Ӧ���Ǹ���Բ��״����)
x = c1+ r*5*cos(theta)+r*20*sin(theta);%Բ�ϸ����x����
y = c2+ r*2*cos(theta)+r*5*sin(theta);%Բ�ϸ����x����
z = c3+ r*9*cos(theta)+r*15*sin(theta);%Բ�ϸ����x����
figure
plot3(x,y,z)
end

function mesh_test()
%�����������棬mesh()
[a,b,c]= peaks(50);
figure
subplot(2,2,1); mesh(a,b,c);
subplot(2,2,2); meshc(a,b,c);
subplot(2,2,3); meshz(a,b,c);

end
function surf_test()
%�����������棬mesh()
z= peaks(50);
figure
subplot(2,2,1); surf(z);
subplot(2,2,2); surfc(z);
subplot(2,2,3); surfl(z);
subplot(2,2,4); surfl(z);
shading interp

end
function test()
xa = -2:0.5:2;
ya= xa;
[x,y]=meshgrid(xa,ya)
z = x.*exp(-5*x.^2 - y.^2)
mesh(x,y,z)
end
