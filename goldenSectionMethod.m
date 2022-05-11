%--------------------------------------------------------------------------------
% auther:Zhu Binglong  blzhu@buaa.edu.cn   sdszbl@163.com
% Date: 2022年5月11日18:28:36
% Function: golden section method to find local minimum value
% Reference: https://blog.csdn.net/qq_42744976/article/details/105693133
%--------------------------------------------------------------------------------

clc;
clear all;
close all;
format long;

a = -1;b = 1; %初始区间
f = @(x) 2 * x ^ 2 -  x - 1; %创建题目要求匿名函数，方便使用

% a = -15;b = 15; %初始区间
% f = @(x)x.^2/10-2*sin(x);

figure(1)
fplot(f,[a,b]);hold on;
fa=f(a);fb=f(b);
plot([a b],[fa fb],'o','markerfacecolor','w');% plot the first point
eps = 1e-10; %区间精度
iter=0;
notCompute1=1;
notCompute2=1;
while((b - a) >= eps)
    iter=iter+1
    %找两个黄金分割点
    x1 = a + 0.382 * (b - a);
    x2 = a + 0.618 * (b - a); %黄金分割法主要步骤
    
    %节省一次计算
    if notCompute1==1
    fx1=f(x1);
    end
    if notCompute2==1
    fx2=f(x2);
    end

    plot([x1 x2],[fx1 fx2],'o','markerfacecolor','w');% plot the first point
    notCompute1=1;
    notCompute2=1;
    if fx1 < fx2 %两种情形的判断
        b = x2;%如果右侧黄金分割点误差大，就用右侧端点代替右分割点，下次右端点误差就不用求了
        notCompute2=0;
        fx2=fx1;
    else
        a = x1;%如果左侧黄金分割点误差大，则用左区间代替左分割点，下次左端点的误差就不用求了
        notCompute1=0;
        fx1=fx2;
    end
end
x = (a + b) / 2; %得到满足条件的最优解
disp(['最优解： x = ',num2str(x,'% 20.16g')]);
disp(['此时: f(x) = ',num2str(f(x),'% 20.16g')]);%使用disp函数和num2str()进行输出
saveas( 1, 'golden section method.png');
% ————————————————
% 版权声明：本文为CSDN博主「Yuan..」的原创文章，遵循CC 4.0 BY-SA版权协议，转载请附上原文出处链接及本声明。
% 原文链接：https://blog.csdn.net/qq_42744976/article/details/105693133