%% ʵ��3
% 
%  Ѱ��
%  TEXT
% 
clear
clc
close all
%% ��ȡ����
data=xlsread('4����.xlsx','Sheet1');
%% ���ָ����Χ�ڵ�����
tmp1=GetMyData(1882,50,data);
%% ����һ����Ϲ⻬����
tmp2=FivePointLeastSquaresFitting(tmp1);
%% һ����
tmp3=FivePointFirstOrder(tmp2);
%% ��㼫��ֵ��Ѱ�ҷ�λ
tmp5=F5Max(tmp2);
%% �õ�������������
tmp6=CrossZeroTwoPoint(tmp3);
%% �ĵ���λ�����ֵ
max1=FindMax(tmp5);
%% �������η���ָ����Χ�����
area1=CalcTotalArea(1874,1888,tmp2);
%% �Ľ������Ա������
area2=ImpLinerBackArea(1874,1888,0,0,tmp2);
%% ��˹������
area3=GaussArea(1874,1888,463.142857142857,tmp2);
%% ��ͼ
figure
plot(tmp2(:,1),tmp2(:,2));
hold on
plot(tmp3(:,1),tmp3(:,2));
hold on
plot(tmp3(:,1),zeros(length(tmp3(:,2))))
title('4�������С�������');
xlabel('��ַ');
ylabel('����');






