clear all
close all
file = 'avgTMDsLtR.txt'; avgs = importdata(file);
file = 'stdTMDsLtR.txt'; standev = importdata(file);
data=avgs(:,1:2);
pos=avgs(:,3);
dist=7;
angles=atan(pos/dist).*100;
yyaxis left
plot(angles,data(:,1),'LineWidth',3, 'Color',[0.1020    0.3961    0.5882]); hold on
fill([angles;flipud(angles)],[data(:,1)-(standev(:,1));flipud(data(:,1)+(standev(:,1)))],[0.1020    0.3961    0.5882],'linestyle','none','FaceAlpha',[0.3]);
ylabel('Output voltage, in mV','FontSize',12)
yyaxis right
plot(angles,data(:,2),'LineWidth',3, 'Color',[0.6784    0.1765    0.1765]);
fill([angles;flipud(angles)],[data(:,2)-(standev(:,2));flipud(data(:,2)+(standev(:,2)))],[0.6784    0.1765    0.1765],'linestyle','none', 'FaceAlpha',[0.3]);
ax = gca;
ax.YAxis(1).Color = [0.1020    0.3961    0.5882];
ax.YAxis(2).Color = [0.6784    0.1765    0.1765];
xlim([min(angles),max(angles)]);
legend('TL TMD2635 sensor','', 'LR TMD2635 sensor','FontSize',12)
xlabel('Angle from from sensor, in degrees','FontSize',12)
ylabel('Output voltage, in mV','FontSize',12)