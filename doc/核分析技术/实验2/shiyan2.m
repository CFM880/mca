clear
clc
close all
x=xlsread('4号样.xlsx','Sheet1','A1:A4096');
y=xlsread('4号样.xlsx','Sheet1','B1:B4096');


figure
plot(x,y,'.');
title('4号全谱');
xlabel('道址');
ylabel('计数');


figure
plot(x,log(y),'.');
title('4号取对数谱');
xlabel('道址');
ylabel('计数');
figure
my_x=x(1882-25:1882+25);
my_y=y(1882-25:1882+25);
plot(my_x,my_y,'.');
title('4号(1882-25,1882+25)谱');
xlabel('道址');
ylabel('计数');

%五点光滑处理
total=length(my_y);

for i=3:total-2
    guanghua_y(i-2)=(my_y(i-2)+4*my_y(i-1)+6*my_y(i)+4*my_y(i+1)+my_y(i+2))/16;
end
guanghua_x=my_x(3:total-2);
guanghua_y=guanghua_y';
figure
plot(guanghua_x,guanghua_y,'.');
title('4号五点重心光滑谱');
xlabel('道址');
ylabel('计数');
%谱分析—寻峰—五点极大值法

%谱分析—寻峰—一阶导数法
total=length(guanghua_y);
for i=3:total-2
    yijie_y(i-2)=(guanghua_y(i-2)-8*guanghua_y(i-1)+8*guanghua_y(i+1)-guanghua_y(i+2))/12;
end
yijie_x=guanghua_x(3:total-2);
figure
%plot(yijie_x(1:length(yijie_x)),0);
%hlod on
yijie_y=yijie_y';
plot(yijie_x,yijie_y,'.');
title('4号一阶导数法');
xlabel('道址');
ylabel('计数');



