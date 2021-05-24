%%%% APDS sensor %%%%%
clear all
close all
%up = 1, down = 2, left = 3, right = 4, forward = 5, backward = 6
%clockwise = 7, cntclockwise = 8, wave = 9

%% Ground truth
gt=ones(17,10);
gt_num=[4 3 2 1 5 6];
gt(1,:) =gt(1,:).*4; gt(2,:) = gt(2,:).*3; gt(3,:) = gt(3,:).*2; 
gt(5,:) = gt(5,:).*5; gt(6,:) = gt(6,:).*6; gt(7,:) = gt(7,:).*4; 
gt(8,:) = gt(8,:).*3; gt(9,:) = gt(9,:).*2; gt(11,:) = gt(11,:).*5; 
gt(12,:) = gt(12,:).*6; gt(13,:) = [4;3;4;3;4;3;4;3;4;3]; 
gt(14,:) = [2;1;2;1;2;1;2;1;2;1]; 
gt(15,:) = [6;5;6;5;6;5;6;5;6;5]; 
gt(16,:) = gt(16,:).*4; gt(17,:) = gt(17,:).*4;

%% Person 1
test1 = ones(17,10);
for i=1:17
    file1 = sprintf('/Users/emilysoderholm/Desktop/MEng project/Human testing/Person 1/APDS/%d.txt', i);
    test1(i,:)=importdata(file1);
end

[diff1, TP1, unequal1] = processAPDS(test1,17, gt);
%% Person 2
test2 = ones(17,10);
for i=1:17
    file2 = sprintf('/Users/emilysoderholm/Desktop/MEng project/Human testing/Person 2/APDS/%d.txt', i);
    test2(i,:)=importdata(file2);
end

[diff2, TP2, unequal2] = processAPDS(test2, 17, gt);
%% Person 3
test3 = ones(17,10);
for i=1:17
    file3 = sprintf('/Users/emilysoderholm/Desktop/MEng project/Human testing/Person 3/APDS/%d.txt', i);
    test3(i,:)=importdata(file3);
end

[diff3, TP3, unequal3] = processAPDS(test3, 17, gt);
%%
figure;
X = categorical({'Forward (1)','Backward (2)','Upwards (3)','Downwards (4)','Towards (6)','Away (5)'});
vals = [TP1(1:6), TP2(1:6), TP3(1:6)];
b = bar(X,vals);
legend('Person 1', 'Person 2', 'Person 3','FontSize',12);
ylabel('Gestures registered correctly, in %','FontSize',12);
%title('Test 1-6 on isolated gestures')

figure;
X = categorical({'Default','Hat','Glove', 'Hair'});
vals = [TP1([1,16,17,18]), TP2([1,16,17,18]), TP3([1,16,17,18])];
b = bar(X,vals);
legend('Person 1', 'Person 2', 'Person 3','FontSize',12);
ylabel('Gestures registered correctly, in %','FontSize',12);
%title('Test 1,7,16 and 17 on moving left to right, with different distracting elements')

p1obj_change=[(max(TP1([1,16,17])-min(TP1([1,16,17])))/mean(TP1([1,16,17])))];
p2obj_change=[(max(TP2([1,16,17])-min(TP2([1,16,17])))/mean(TP2([1,16,17])))];
p3obj_change=[(max(TP3([1,16,17])-min(TP3([1,16,17])))/mean(TP3([1,16,17])))];
obj_change=mean(p1obj_change,p2obj_change,p3obj_change);
%%% plot data correctly, some more ROC analysis
%%
unnatural1=TP1(1:6)-TP1(7:12);
unnatural2=TP2(1:6)-TP2(7:12);
unnatural3=TP3(1:6)-TP3(7:12);
figure;
X = categorical({'LEFT','RIGHT','UP','DOWN','FORWARD','BACKWARD'});
vals = [unnatural1, unnatural2, unnatural3];
b = bar(X,vals);
legend('Person 1', 'Person 2', 'Person 3','FontSize',12);
ylabel('gestures registered correctly in percentage','FontSize',12);
unnatural=[];
for i=1:6
    unnatural(i)=(unnatural1(i)+unnatural2(i)+unnatural3(i))/3;
end
%%
%title('Test 1-6 on isolated gestures')
confusion_mat=zeros(6);
for i=1:6
    for j=1:6
    confusion_mat(i,j)=sum(ismember(unequal1(i,:),gt_num(j)))+sum(ismember(unequal2(i,:),gt_num(j)))+sum(ismember(unequal3(i,:),gt_num(j)));
    end
    confusion_mat(i,i)=round(TP1(i)/10)+round(TP2(i)/10)+round(TP3(i)/10);
end