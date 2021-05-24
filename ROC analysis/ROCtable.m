function [roc_table,stats] = ROCtable(l,sensor,groundtruth)
GTeven=groundtruth(2:2:end);
GTodd=groundtruth(1:2:end);
test=zeros(l,1); test(sensor)=1;
gt=zeros(l,1); gt(groundtruth)=1;
gteven=zeros(l,1); gteven(GTeven)=1;
gtodd=zeros(l,1); gtodd(GTodd)=1;
%gt_non_events=linspace(1,l,l);gt_non_events(gt)=[];
%sensor_non_events=linspace(1,l,l);sensor_non_events(sensor)=[];

%TP=0;
%for i=1:length(sensor)
%    if ismember(sensor(i),gteven) || ismember(sensor(i),gtodd)
%        TP=TP+1;
%    end
%end

%TP=sum(ismember(sensor,gteven))+sum(ismember(sensor,gtodd)) ; %tmd has values that gt also has
%FP=length(setdiff(sensor,gt)); %tmd has values that gt doesnt
%TN=sum(ismember(sensor_non_events,gt_non_events)); %tmd doesnt have values that gt also doesnt have
%FN=length(setdiff(sensor_non_events,gt_non_events)); %tmd doesnt have values that gt has

TP=0;FP=0;TN=0;FN=0;
      for i=1:l;
              if((gteven(i)==1 || gtodd(i)==1) & test(i)==1);
                  TP=TP+1;
              elseif((gteven(i)==0 || gtodd(i)==0) & test(i)==1);
                  FP=FP+1;
              elseif((gteven(i)==0 || gtodd(i)==0) & test(i)==0);
                  TN=TN+1;
              else
                  FN=FN+1;
              end
          end
          
roc_table=[TP, FN, TP+FN; FP, TN, FP+TN; TP+FP,FN+TN,TP+FN+FP+TN];
Recall=round(TP/(TP+FN),2);
sp = round(TN/(TN + FP),2);
Precision = round(TP/ (TP + FP),2);
Accuracy = round((Recall+sp)/2);
F1score=(Precision*Recall)/(Precision+Recall);

stats = [Recall,sp,Precision,Accuracy, F1score];

end

