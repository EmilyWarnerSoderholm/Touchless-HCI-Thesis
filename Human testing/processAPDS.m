function [diff, TP, unequal] = processAPDS(test,number, gt)
unequal=zeros(size(1,10));
diff=[];
TP=zeros(number+1,1);
for i=1:number
    tp=0; FN = 0; 
    for j=1:10
        if gt(i,j)==(test(i,j))
            tp=tp+1;
        else
            unequal(i,j)=test(i,j);
        end
    end
    TP(i) = tp;
    diff(i) = nnz(unequal);  
end
diff=diff.*10;
TP=TP.*10;
end

