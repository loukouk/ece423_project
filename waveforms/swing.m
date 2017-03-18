% Don't forget to right click and add the HspiceToolbox directory to your path

close all
clc

x_space = linspace(1.249,1.251,2001);
x_space2 = linspace(1.249,1.251,2000);
x_diff = diff(x_space)

% Output curves
x=loadsig('../pro_extracted.sw0');

V1= evalsig(x, 'v_out1');
V2= -evalsig(x, 'v_out2');

d1 = diff(V1);
d2 = diff(-V2);


figure('color','w');
s(1) = subplot(2,1,1);
plot(x_space2,d1/.000001);
hold;
plot(x_space2,d2/.000001);
xlim([1.2497 1.2503]);
ylabel('Differential Gain (V/V)') % y-axis label
%set(s(1),'XTick',[]);
grid on;
title('Gain Curves for Extracted Layout');

s(2)=subplot(2,1,2);
plot(x_space,V1);
hold;
plot(x_space,-V2);
xlim([1.2497 1.2503])
xlabel('Differential Input Voltage (V)') % x-axis label
ylabel('Output Voltage (V)') % y-axis label
title('Voltage Swing for Extracted Layout')
set(s,'box','off');
grid on;