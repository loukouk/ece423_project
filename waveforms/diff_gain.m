
close all
clc
clearvars

fp1=fopen('diff_gain_extracted.txt','r');
%fp2=fopen('diff_gain_nominal.txt','r');
%fp3=fopen('diff_gain_slow.txt','r');
f1=fscanf(fp1,'%f\t%f+j%f',[3,61]);
%f2=fscanf(fp2,'%f\t%f+j%f',[3,61]);
%f3=fscanf(fp3,'%f\t%f+j%f',[3,61])


for i = 1:61
    y12(i) = angle(f1(2,i) + f1(3,i)*j) * 180 / pi;
    y10(i) = sqrt( (f1(2,i))^2 + (f1(3,i))^2 );
    x(i) = f1(1,i);
end
y11 = 10*log(y10)

% for i = 1:61
%     y22(i) = angle(f2(2,i) + f2(3,i)*j) * 180 / pi;
%     y20(i) = sqrt( (f2(2,i))^2 + (f2(3,i))^2 );
%     x(i) = f2(1,i);
% end
% y21 = 10*log(y20)
% 
% for i = 1:61
%     y32(i) = angle(f3(2,i) + f3(3,i)*j) * 180 / pi;
%     y30(i) = sqrt( (f3(2,i))^2 + (f3(3,i))^2 );
%     x(i) = f3(1,i);
% end
% y31 = 10*log(y30)

figure('color', 'w');
subplot(2,1,1);
semilogx(x,y11);
% hold on
% semilogx(x,y21);
% hold on
% semilogx(x,y31);
% hold off
xlim([1000 500000000])
title('Differential Gain of Extracted Layout');
%xlabel('Frequency (Hz)') % x-axis label
ylabel('CMFB Gain (dB)') % y-axis label
legend('Extracted','Fast', 'Nominal', 'Slow');
grid on;


subplot(2,1,2);
semilogx(x,y12);
% hold on;
% semilogx(x,y22);
% hold on;
% semilogx(x,y32);
xlim([1000 500000000])
title('Differential Phase of Extracted Layout');
xlabel('Frequency (Hz)') % x-axis label
ylabel('CMFB Phase (deg)') % y-axis label
legend('Extracted','Fast', 'Nominal', 'Slow');
grid on