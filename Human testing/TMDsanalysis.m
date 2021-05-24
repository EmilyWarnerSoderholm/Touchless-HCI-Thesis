close all
clear all
file = ('/Users/emilysoderholm/Desktop/MEng project/Human testing/Person 3/TMD/1.txt');
data1 = importdata(file);
%file = ('/Users/emilysoderholm/Desktop/MEng project/Human testing/Person 3/TMD/2.txt');
%data2 = importdata(file);
%plot(data(:,1:2));
%poly4one=[2.595e-06,-0.00041,0.02322,-0.5956,9.4083];
%poly4two=[2.66803829670167e-07,-8.15189365860138e-05,0.00896781420994667,-0.441548744676391,11.9831780229863];
%dist_one=(poly4one(1)*data(:,1).^4)+(poly4one(2)*data(:,1).^3)+(poly4one(3)*data(:,1).^2)+(poly4one(4)*data(:,1))+(poly4one(5));
%plot(dist_one); hold on
%dist_two=(poly4two(1)*data(:,2).^4)+(poly4two(2)*data(:,2).^3)+(poly4two(3)*data(:,2).^2)+(poly4two(4)*data(:,2))+(poly4two(5));
yyaxis left
plot(data1(:,1),'Color',[0.1020    0.3961    0.5882]); hold on
yline(765, '--b');
ylim([750,900])
ylabel('Output voltage, in mV','FontSize',12)
%plot(data2(:,1))
yyaxis right
plot(data1(:,2),'Color',[0.6784    0.1765    0.1765]); hold on
ylim([800,1000])
%plot(data2(:,2))
%SNR=snr(data2(:,1));
%together=(data(:,1)-mean(data(:,1)))+(data(:,2)-mean(data(:,2)));
%plot(together);
gt=find(data1(:,3)==1); yline(965,'--r');
xline(gt, '-o');
xlim([0,160])
ax = gca;
ax.YAxis(1).Color = [0.1020    0.3961    0.5882];
ax.YAxis(2).Color = [0.6784    0.1765    0.1765];
legend('TL sensor', 'TL threshold','LR sensor', 'LR threshold','gt','FontSize',12)
%title('Left-to-right motion x 10, by Person 3','FontSize',12)
xlabel('Time points, intervals of 100ms','FontSize',12)
ylabel('Output voltage, in mV','FontSize',12)