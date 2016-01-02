clear
clc
close all
temp=xlsread('4号样标准谱.xlsx','Sheet1');

tmp1=GetMyData(3072,50,temp);
plot(tmp1(:,1),tmp1(:,2));
%五点光滑处理
tmp2=FivePointSmooth_G(tmp1);

%谱分析—寻峰—五点极大值法
tmp3=F5Max(tmp2);

%谱分析—寻峰—一阶导数法
tmp4=FivePointFirstOrder(tmp2);

%过零的两点
tmp5=CrossZeroTwoPoint(tmp4);
