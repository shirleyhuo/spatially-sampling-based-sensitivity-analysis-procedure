%% A. Benchmark
ngrid=8361;
grouprankmtgppv7alls120g8361mars=zeros(ngrid,12);
for ns=1:ngrid
    [transdat,lambda] = boxcox((senscoreMARSgppv7alls120g8361(ns,:)+1)');
    Y = pdist(transdat);
    Z = linkage(Y,'ward');
    [~,T] = dendrogram(Z,4);

    orimax=zeros(4,1);
    for i=1:4
        orimax(i,1)=max(transdat(find(T==i))');
    end
    [stmax,index]=sort(orimax);
    tT=T;
    for i=1:4
        tT(find(T==index(i)),1)=5-i;
    end
    grouprankmtgppv7alls120g8361mars(ns,:)=tT;
end
% Group rank statistics
grouprankfreqgppv7alls120g8361=zeros(4,12);
for i=1:4
    for j=1:12
        for k=1:ngrid
            if (grouprankmtgppv7alls120g8361mars(k,j)==i) 
                grouprankfreqgppv7alls120g8361(i,j)=grouprankfreqgppv7alls120g8361(i,j)+1;
            end
        end
    end
end
finalgrouprankgppv7alls120g8361=zeros(1,12);
for i=1:12
    finalgrouprankgppv7alls120g8361(i)=find(grouprankfreqgppv7alls120g8361(:,i)==max(grouprankfreqgppv7alls120g8361(:,i)));
end

finalgridportiongppv7alls120g8361=zeros(1,12);
for i=1:12
    finalgridportiongppv7alls120g8361(i)=grouprankfreqgppv7alls120g8361(finalgrouprankgppv7alls120g8361(i),i)/ngrid;
end