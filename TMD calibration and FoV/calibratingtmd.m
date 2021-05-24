clear all
close all
file = 'notargetTMDs.txt'; data = importdata(file);
offset=mean(data);
%data_equal=data;
%data_equal(:,1)=data_equal(:,1)-offset(1); data_equal(:,2)=data_equal(:,2)-offset(2);
%plot(data_equal);
%SNR1=snr(data(:,1)); SNR2=snr(data(:,2));
file = 'avgTMDs.txt'; data = importdata(file);
file = 'stdTMDs.txt'; standev = importdata(file);
first=data(:,1);
second=data(:,2);
dist=data(:,3);
yyaxis left
plot(dist,first,'LineWidth',3, 'Color',[0.1020    0.3961    0.5882]); hold on
fill([dist;flipud(dist)],[first-(standev(:,1));flipud(first+(standev(:,1)))],[0.1020    0.3961    0.5882],'linestyle','none','FaceAlpha',[0.3]);
ylabel('Output voltage, in mV','FontSize',12)
yyaxis right
plot(dist,second,'LineWidth',3, 'Color',[0.6784    0.1765    0.1765]); hold on
fill([dist;flipud(dist)],[second-(standev(:,2));flipud(second+(standev(:,2)))],[0.6784    0.1765    0.1765],'linestyle','none', 'FaceAlpha',[0.3]);
ax = gca;
ax.YAxis(1).Color = [0.1020    0.3961    0.5882];
ax.YAxis(2).Color = [0.6784    0.1765    0.1765];
xlim([min(dist),max(dist)]);
legend('TL TMD2635 sensor','','LR TMD2635 sensor','FontSize',12)
xlabel('Distance between target and sensor, in mm','FontSize',12)
ylabel('Output voltage, in mV','FontSize',12)
%p1=polyfit(first,dist,4); y1 = polyval(p1,first); plot(first,y1,'-b');
%p2=polyfit(second,dist,4); y2 = polyval(p2,second); plot(second,y2,'-b');
%avg=mean(data);
%standev=std(data);

%file = 'calibrate.txt'; data = importdata(file);
%y=data(1:15,1)-800;
%length=length(y); x=transpose(linspace(50,25,length));
%figure; scatter(x,y,20,[0.4941    0.1843    0.5569],'filled')
%ylabel('output from sensor, in mV'); xlabel('distance from target, in mm')
%hold on; grid on
%fill([x;flipud(x)],[y-(2*data(1:15,2));flipud(y+(2*data(1:15,2)))],[0.8588    0.6902    0.9608],'linestyle','none');
%p=polyfit(x,y,4); y1 = polyval(p,x); plot(x,y1,'-b');
%legend('polynomial line of best fit, 5th degree','± 2*standard deviation')
%title('line of best fit: F(x) =-0.00011*x^5+(0.01873)*x^4+(-1.25577)*x^3+(41.54705)*x^2+(-688.98882*x+(5585.37287)')

% hold on
%figure;
% Fit = polyfit(x(:,2),x(:,1),3); % x = x data, y = y data, 1 = order of the polynomial i.e a straight line 
% plot(polyval(Fit,x(:,2)))
%norm_data=normalize(data);
%findpeaks(norm_data(:,1));
%hold on
%findpeaks(norm_data(:,2));

%plot(x);
%hold on
%plot(polyfit(x(1),x(2),1));