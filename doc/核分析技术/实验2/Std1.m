clear
clc
close all
temp=xlsread('4������׼��.xlsx','Sheet1');

tmp1=GetMyData(3072,50,temp);
plot(tmp1(:,1),tmp1(:,2));
%���⻬����
tmp2=FivePointSmooth_G(tmp1);

%�׷�����Ѱ�塪��㼫��ֵ��
tmp3=F5Max(tmp2);

%�׷�����Ѱ�塪һ�׵�����
tmp4=FivePointFirstOrder(tmp2);

%���������
tmp5=CrossZeroTwoPoint(tmp4);
