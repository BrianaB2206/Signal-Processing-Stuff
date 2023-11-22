%Boeru Elena-Briana, 421G
close all;
clear;
clc

% 1) Convolution for nonperiodic signals

step =0.1;
tau=-6:step:10;
figure(1);
subplot(2,1,1);

plot(tau,f(tau));
%We set the limits for the graph display to see the whole signal through the axis function by choosing the parameters for the x and y axis 
axis([min(tau), max(tau), -4, 4]);
xlabel('tau'), ylabel('amplitude'), title('f(\tau)');
grid;
% We used this to put a grid on the graph in order to see it better

subplot(2,1,2);
plot(tau,g(tau));
axis([min(tau), max(tau), -3, 4]);
xlabel('tau'), ylabel('amplitude'), title('g(\tau)');
grid;


tmin = -1;
tmax = 9;
t = tmin:step:tmax;
for index_t=1:length(t)
 % For the first figure we show 3 signals f(tau), g(t-tau) and f(tau)*g(t-tau)
 figure(2);
 subplot(211);
 plot(tau,f(tau),'b');
 xlabel('tau');
 ylabel('amplitude');
 title('f(\tau), g(t-\tau) and f(tau)*g(t-tau)');
 hold on
 plot(tau,g(t(index_t)-tau),'r');
 prod = f(tau).*g(t(index_t)-tau);
 stem(tau, prod,'g');
 hold off
 axis([min(tau),max(tau),-7,8]);
 % We use legend() to show the name of each graph on the figure
 legend('f(\tau)', 'g(t-\tau)', 'f(\tau)*g(t-\tau)');
 grid;

    % ex. c)
% cnv(index_t) = integral(@(tau)f(tau).*g(t(index_t)-tau),-10,10);
 
    %ex. d)
% cnv(index_t) = integral(@(tau)f(tau).*g(-t(index_t)+tau),-10,10);

    % ex. e)
% cnv(index_t) = integral(@(tau)f(-tau).*g(t(index_t)-tau),-10,10);
 
    % ex. f)
% cnv(index_t) = integral(@(tau)f(tau).*g(t(index_t)-tau+3),-10,10);
 
    % ex. i)
 cnv(index_t) = integral(@(tau)f(-tau).*g(t(index_t)-tau+5),-10,10);

 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('time');
 ylabel('amplitude');
 title('Convolution (f*g)(t)');
 axis([-2,max(tau),-10,15]);
 grid;
 pause(0.1);
end

% 2) Correlation for nonperiodic signals

tmin = -1;
tmax = 9;
t = tmin:step:tmax;
for index_t=1:length(t)
 % We show on the figure the 3 signals f(tau), g(t-tau) and f(tau)*g(t+tau)
 figure(3);
 subplot(211);
 plot(tau,f(tau),'b');
 xlabel('tau');
 ylabel('amplitude');
 title('Signals f(\tau), g(\tau+t) and f*g');
 hold on
 plot(tau,g(tau + t(index_t)),'r');
 prod = f(tau).*g(tau + t(index_t));
 stem(tau, prod,'g');
 hold off
 axis([min(tau),max(tau),-6,7]);
 legend('f(\tau)', 'g(\tau+t)', 'f(\tau)g(\tau+t)');
 grid;

     % ex. a)
% cnv(index_t) = integral(@(tau)f(tau).*g(tau + t(index_t)),-10,10); 
 
    % ex. b)
% cnv(index_t) = integral(@(tau)g(tau).*f(t(index_t)-tau),-10,10);
 
    % ex. g)
%cnv(index_t) = integral(@(tau)f(tau).*g(-tau -t(index_t)),-10,10);
  
    %ex. h)
cnv(index_t) = integral(@(tau)f(tau-3).*g(tau + t(index_t)),-10,10); 
 
 subplot(212);
 plot(t(1:length(cnv)),cnv);
 xlabel('time');
 ylabel('amplitude');
 % The 'Interpreter', 'latex' dirrective are used only to display
 % the proper symbol for correlation ( a * with ^ on top)
 title('Correlation (f$\hat{*}$g)(t)','Interpreter','latex');
 axis([-2,max(tau),-10,15]);
 grid;
 pause(0.1);
end