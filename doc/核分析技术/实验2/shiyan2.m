clear
clc
close all
x=xlsread('4����.xlsx','Sheet1','A1:A4096');
y=xlsread('4����.xlsx','Sheet1','B1:B4096');


figure
plot(x,y,'.');
title('4��ȫ��');
xlabel('��ַ');
ylabel('����');


figure
plot(x,log(y),'.');
title('4��ȡ������');
xlabel('��ַ');
ylabel('����');
figure
my_x=x(1882-25:1882+25);
my_y=y(1882-25:1882+25);
plot(my_x,my_y,'.');
title('4��(1882-25,1882+25)��');
xlabel('��ַ');
ylabel('����');

%���⻬����
total=length(my_y);

for i=3:total-2
    guanghua_y(i-2)=(my_y(i-2)+4*my_y(i-1)+6*my_y(i)+4*my_y(i+1)+my_y(i+2))/16;
end
guanghua_x=my_x(3:total-2);
guanghua_y=guanghua_y';
figure
plot(guanghua_x,guanghua_y,'.');
title('4��������Ĺ⻬��');
xlabel('��ַ');
ylabel('����');
%�׷�����Ѱ�塪��㼫��ֵ��

%�׷�����Ѱ�塪һ�׵�����
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
title('4��һ�׵�����');
xlabel('��ַ');
ylabel('����');



