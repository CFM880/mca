%% 实验3
% 
%  寻峰
%  TEXT
% 
clear
clc
close all
%% 读取数据
data=xlsread('4号样.xlsx','Sheet1');
%% 获得指定范围内的数据
tmp1=GetMyData(1882,50,data);
%% 进行一次拟合光滑谱线
tmp2=FivePointLeastSquaresFitting(tmp1);
%% 一次求导
tmp3=FivePointFirstOrder(tmp2);
%% 五点极大值法寻找峰位
tmp5=F5Max(tmp2);
%% 得到过零点的两个点
tmp6=CrossZeroTwoPoint(tmp3);
%% 的到峰位即最大值
max1=FindMax(tmp5);
%% 利用梯形法求指定范围的面积
area1=CalcTotalArea(1874,1888,tmp2);
%% 改进型线性本底面积
area2=ImpLinerBackArea(1874,1888,0,0,tmp2);
%% 高斯求峰面积
area3=GaussArea(1874,1888,463.142857142857,tmp2);
%% 画图
figure
plot(tmp2(:,1),tmp2(:,2));
hold on
plot(tmp3(:,1),tmp3(:,2));
hold on
plot(tmp3(:,1),zeros(length(tmp3(:,2))))
title('4号五点最小二乘拟合');
xlabel('道址');
ylabel('计数');






