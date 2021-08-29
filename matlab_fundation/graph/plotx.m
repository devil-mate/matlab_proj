function plotx_fun()
plot_tan()
end

function plot_tan()
clc 
clear
x =0:0.01:2*pi;
y=sin(x);

subplot(2,2,1);
plot(x,y)
subplot(2,2,2)
yt = tan(x);
plot(x,yt)

end
function plotx_()
%绘制曲线（二维）plot函数
x=0:0.1:100;
y=x.^2+4;
subplot(2,2,1)
plot(x,y)

y=5*x.^2+2;
subplot(2,2,2);
plot(x,y)
hold on
plot(50,10000,'p');
end
