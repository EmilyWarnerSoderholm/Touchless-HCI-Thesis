clear all
close all
[TMD,VL,APDS,GT,l] = opensensortext('Performance test - beige.txt');
ROCstats{1} = environmentstats(l,TMD, GT, VL, APDS);
[TMD,VL,APDS,GT,l] = opensensortext('Performance test - black.txt');
ROCstats{2} = environmentstats(l,TMD, GT, VL, APDS);
[TMD,VL,APDS,GT,l] = opensensortext('Performance test - diffuse.txt');
ROCstats{3} = environmentstats(l,TMD, GT, VL, APDS);
[TMD,VL,APDS,GT,l] = opensensortext('Performance test - 307 lux.txt');
ROCstats{4} = environmentstats(l,TMD, GT, VL, APDS);
[TMD,VL,APDS,GT,l] = opensensortext('Performance test - 1.15 lux.txt');
ROCstats{5} = environmentstats(l,TMD, GT, VL, APDS);
TMDstats=[]; VLstats=[]; APDSstats=[];
for i=1:5
    TMDstats(i,:)=ROCstats{1, i}{1, 3};
    VLstats(i,:)=ROCstats{1, i}{2, 3};
    APDSstats(i,:)=ROCstats{1, i}{3, 3};
end

%%
figure;
X = categorical({'Bright target (T1)','Dark target (T2)','Diffuse target (T3)','Bright environment (T5)','Dark environment (T4)'});
vals = [TMDstats(:,5), VLstats(:,5), APDSstats(:,5)];
b = bar(X,vals);
%hold on
%vals = [TMDstats(:,5), VLstats(:,5), APDSstats(:,5)];
%b = bar(vals,'BarWidth',[0.3]);
%ylim([0.6,1.01]);
legend('TMD2635','VL6180x','APDS9500','FontSize',12);
ylabel('F1 score','FontSize',12);
env_robust=[max(TMDstats(:,5))-min(TMDstats(:,5)),max(VLstats(:,5))-min(VLstats(:,5)),max(APDSstats(:,5))-min(APDSstats(:,5))];
%env_robust=[env_robust(1)*100/mean(TMDstats(:,5)),env_robust(2)*100/mean(VLstats(:,5)),env_robust(3)*100/mean(APDSstats(:,5))];
q=5;
tmdlight=[TMDstats(1,q),TMDstats(4,q),TMDstats(5,q)];
tmdenv=diff(tmdlight)/mean(tmdlight);

% Binary_data = importdata(file); Binary_data = string(Binary_data);
% Decimal_data = bin2dec(Binary_data); Data_normalised = normalize(Decimal_data);
% Decimal_data(:,2) = Decimal_data(:,2); 
% APDS=find(Decimal_data(:,3)==1);
% GT=find(Decimal_data(:,4)==1);
% VL = find(islocalmin(Data_normalised(:,1))==1);
% [x,TMD]=findpeaks(abs(Data_normalised(:,2)));

%VL=plot(D(:,1), ':', 'DisplayName','VL')
%hold on
%TMD=plot(D(:,2), ':','DisplayName','TMD')
%yyaxis left;
%plot(abs(TMDmapped));
%yyaxis right;
%findpeaks(abs(Data_normalised(:,2)));
%xline(APDS,'--b',{'APDS'});
%xline(gt,'--',{'gt'});
%xline(TMD,'--r',{'TMD'});
%xline(VL,'--g',{'VL'});



%hold off
%legend('','VL6180x sensor','','TMD2635 sensor')
%title('Performance test to backwards gesture, comparing VL6180x, TMD2635 and APDS9500', [movement, lux, object])
%grid off
%xlabel('Intervals of 0.128 sec'); ylabel('sensor output, normalised')
%Parameters: lux= '1.15 lux'; movement=' 50 taps '; object = ' black diffuse object ';

