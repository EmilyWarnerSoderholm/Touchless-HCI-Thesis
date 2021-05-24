function [ROCstats] = environmentstats(l,TMD, GT, VL, APDS)
[ROCtable_TMD,stats_TMD]=ROCtable(l,TMD,GT);
[ROCtable_VL,stats_VL]=ROCtable(l,VL,GT);
[ROCtable_APDS,stats_APDS]=ROCtable(l,APDS,GT);
ROCstats{1,1}= "TMD"; ROCstats{1,2}=ROCtable_TMD; ROCstats{1,3}=stats_TMD;
ROCstats{2,1}= "VL"; ROCstats{2,2}=ROCtable_VL; ROCstats{2,3}=stats_VL;
ROCstats{3,1}= "APDS"; ROCstats{3,2}=ROCtable_APDS; ROCstats{3,3}=stats_APDS;
end

