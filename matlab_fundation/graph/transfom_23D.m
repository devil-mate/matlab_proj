function  transform_coord()
clc 
clear
% close
transform_q()

end
function imu_test()
%% 原坐标及向量
R = roty(90)
subplot(1,2,1)
title("word")
trplot()
hold on
gv=[0;0;-1];
gv(1) = gv(1)/norm(gv);
gv(2) = gv(2)/norm(gv);
gv(3) = gv(3)/norm(gv);
quiver3(0,0,0,gv(1),gv(2),gv(3));
%% 旋转-90，得到吸附垂直墙体时IMU四元数
subplot(1,2,2)
title("IMU")
trplot(R,"frame","b")
hold on
% 重力向量（跟随）坐标变换
%gv = [0;0;1]
g = R*gv
quiver3(0,0,0,gv(1),gv(2),gv(3));
% % 吸附墙体时IMU四元数
q = rotm2quat(R);
T = quat2rotm(q);
gg = T*gv

%验证欧拉角
eur = quat2eul(q)
gx =eur(1)*180/pi
y =eur(2)*180/pi
z =eur(3)*180/pi



end
function transform_q()
clc 
clear
cla
%% 任意给定四元数
% Q = [0.1461 0.9889 0.23 0.4]
% Rq = quaternion(Q)
% eur=quat2eul(Rq);
% anglx= eur(1)*180/pi
% angly= eur(2)*180/pi
% anglz= eur(3)*180/pi
% Q2R = rotmat(Rq,"point")
% q2R = quat2tform(Rq)
% q2r = quat2rotm(Rq)
% tranimate(Q2R)



%% 给定欧拉角，转换成四元数q
euler=[-pi,-pi/2,-pi/2];  %ZYX
Q_xyz = eul2quat(euler) 
% Rq = quat2tform(Q_xyz)
Rq = quat2rotm(Q_xyz)
tranimate(Rq)
% %% 在坐标中绘制向量
% % quiver3(),向量的原点，和向量坐标
% hold on
% x=[0;0;1]
% x(1) = x(1)/norm(x);
% x(2) = x(2)/norm(x);
% x(3) = x(3)/norm(x);
% quiver3(0,0,0,x(1),x(2),x(3));
% %% 旋转后的向量
% xx=Rq*x
% quiver3(0,0,0,xx(1),xx(2),xx(3));
%% 任意点在新坐标中的位姿
 hold on
 sourceP = [0;0;1];
 plot3(0,0,1,'r*')
targetP = inv(Rq)*sourceP
end
function  transform_2d()
clc
clear all
close

%% 二维空间位姿描述
T0 =SE2(0,0,0)
trplot2(T0)
% T1=SE2(1,2,30*pi/180);       %建立齐次坐标变换，代表（1,2）的平移和30°的旋转
% trplot2(T1,'frame','1','color','b')%绘制变换坐标系，名字：{1} 颜色：蓝色 
axis([0 5 0 5]);%坐标轴范围x为0-5 y为0-5
T2=SE2(2,1,0)   %齐次坐标变换：平移（2,1）零旋转的相对位姿
hold on 
trplot2(T2,'frame','2','color','r');%绘制变换坐标系，名字：{2} 颜色：红色
% T3=T1*T2
% trplot2(T3,'frame','3','color','g');%绘制复合坐标系，名字：{3} 颜色：绿色
% T4=T2*T1;
% trplot2(T4,'frame','4','color','c');
p=[1;2];%相对世界坐标系定义点（3,2）
plot_point(p,'*')%把p点用*表示在图中
p1=inv(T2)*[p]    %p点相对于坐标系{1}的坐标
plot_point(p1,'o')%把p点用*表示在图中
tranimate(T2)
% h2e(inv(T1)*e2h(p))     %通过附加一个1 将欧几里得点转换为齐次形式。该齐次形式结果在坐标系{1}中有
% % 一个负的y坐标，使用h2e函数可以进行反变换
% %辅助函数e2h将欧几里得坐标点转换为齐次形式，而h2e进行逆转换
% homtrans(inv(T1),p)     %简洁的表达式
% p2=homtrans(inv(T2),p)  %p点相对于坐标系{2}的描述

end

function transform_rotate()
clc
clear all
% 旋转
R = rotx(180)
subplot(2,2,1)
title("原始")
trplot()
subplot(2,2,2)
title("旋转后")
tranimate(R)
trplot(R,'frame', 'x')
%旋转+平移
T1=transl(1,0,0);
T2= transl(0,1,0);
R1 = trotx(180);
T = T1* R1*T2;
% T=transl(1,0,0)*trotx(140)*transl(0,1,0);
subplot(2,2,3)
tranimate(T)
trplot(T,'frame', 'rt')
% t2r(T)  %提取矩阵中旋转矩阵部分
% transl(T)  %提取矩阵中平移部分


% % T=transl(1,0,0)*trotx(pi/2)*transl(0,1,0)

end