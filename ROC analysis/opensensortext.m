function [TMD,VL,APDS,GT,l] = opensensortext(file)
Binary_data = importdata(file); Binary_data = string(Binary_data);
Decimal_data = bin2dec(Binary_data); Data_normalised = normalize(Decimal_data);
Decimal_data(:,2) = Decimal_data(:,2); 
APDS=find(Decimal_data(:,3)==1);
GT=find(Decimal_data(:,4)==1);
VL = find(islocalmin(Data_normalised(:,1))==1);
[x,TMD]=findpeaks(abs(Data_normalised(:,2)));
l=length(Decimal_data);
end

