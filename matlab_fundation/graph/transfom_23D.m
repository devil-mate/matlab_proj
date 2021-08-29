function  transform_coord()
clc 
clear
% close
transform_q()

end
function imu_test()
%% ԭ���꼰����
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
%% ��ת-90���õ�������ֱǽ��ʱIMU��Ԫ��
subplot(1,2,2)
title("IMU")
trplot(R,"frame","b")
hold on
% �������������棩����任
%gv = [0;0;1]
g = R*gv
quiver3(0,0,0,gv(1),gv(2),gv(3));
% % ����ǽ��ʱIMU��Ԫ��
q = rotm2quat(R);
T = quat2rotm(q);
gg = T*gv

%��֤ŷ����
eur = quat2eul(q)
gx =eur(1)*180/pi
y =eur(2)*180/pi
z =eur(3)*180/pi



end
function transform_q()
clc 
clear
cla
%% ���������Ԫ��
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



%% ����ŷ���ǣ�ת������Ԫ��q
euler=[-pi,-pi/2,-pi/2];  %ZYX
Q_xyz = eul2quat(euler) 
% Rq = quat2tform(Q_xyz)
Rq = quat2rotm(Q_xyz)
tranimate(Rq)
% %% �������л�������
% % quiver3(),������ԭ�㣬����������
% hold on
% x=[0;0;1]
% x(1) = x(1)/norm(x);
% x(2) = x(2)/norm(x);
% x(3) = x(3)/norm(x);
% quiver3(0,0,0,x(1),x(2),x(3));
% %% ��ת�������
% xx=Rq*x
% quiver3(0,0,0,xx(1),xx(2),xx(3));
%% ��������������е�λ��
 hold on
 sourceP = [0;0;1];
 plot3(0,0,1,'r*')
targetP = inv(Rq)*sourceP
end
function  transform_2d()
clc
clear all
close

%% ��ά�ռ�λ������
T0 =SE2(0,0,0)
trplot2(T0)
% T1=SE2(1,2,30*pi/180);       %�����������任������1,2����ƽ�ƺ�30�����ת
% trplot2(T1,'frame','1','color','b')%���Ʊ任����ϵ�����֣�{1} ��ɫ����ɫ 
axis([0 5 0 5]);%�����᷶ΧxΪ0-5 yΪ0-5
T2=SE2(2,1,0)   %�������任��ƽ�ƣ�2,1������ת�����λ��
hold on 
trplot2(T2,'frame','2','color','r');%���Ʊ任����ϵ�����֣�{2} ��ɫ����ɫ
% T3=T1*T2
% trplot2(T3,'frame','3','color','g');%���Ƹ�������ϵ�����֣�{3} ��ɫ����ɫ
% T4=T2*T1;
% trplot2(T4,'frame','4','color','c');
p=[1;2];%�����������ϵ����㣨3,2��
plot_point(p,'*')%��p����*��ʾ��ͼ��
p1=inv(T2)*[p]    %p�����������ϵ{1}������
plot_point(p1,'o')%��p����*��ʾ��ͼ��
tranimate(T2)
% h2e(inv(T1)*e2h(p))     %ͨ������һ��1 ��ŷ����õ�ת��Ϊ�����ʽ���������ʽ���������ϵ{1}����
% % һ������y���꣬ʹ��h2e�������Խ��з��任
% %��������e2h��ŷ����������ת��Ϊ�����ʽ����h2e������ת��
% homtrans(inv(T1),p)     %���ı��ʽ
% p2=homtrans(inv(T2),p)  %p�����������ϵ{2}������

end

function transform_rotate()
clc
clear all
% ��ת
R = rotx(180)
subplot(2,2,1)
title("ԭʼ")
trplot()
subplot(2,2,2)
title("��ת��")
tranimate(R)
trplot(R,'frame', 'x')
%��ת+ƽ��
T1=transl(1,0,0);
T2= transl(0,1,0);
R1 = trotx(180);
T = T1* R1*T2;
% T=transl(1,0,0)*trotx(140)*transl(0,1,0);
subplot(2,2,3)
tranimate(T)
trplot(T,'frame', 'rt')
% t2r(T)  %��ȡ��������ת���󲿷�
% transl(T)  %��ȡ������ƽ�Ʋ���


% % T=transl(1,0,0)*trotx(pi/2)*transl(0,1,0)

end