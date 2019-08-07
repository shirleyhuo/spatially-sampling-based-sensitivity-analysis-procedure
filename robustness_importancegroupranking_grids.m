%% Grassland Pa5 Parameter samples 60
%% Bootstrapping On Grids
%% Sort For Bootstrap samples
ngrid=418;
nreps=80;
finalgrouprankgppv7aipa5s60bs80=zeros(nreps,12);
finalgridportiongppv7aipa5s60bs80=zeros(nreps,12);

for irep=1:nreps
    tempgrouprank=zeros(ngrid,12);
    for ns=1:ngrid
        tempgrouprank(ns,:)=grouprankmtgppv7aipa5s60g418mars(gridv7pa5bs80(ns,irep),:);
    end

%% Group rank statistics
    tempgrouprankfreq=zeros(4,12);
    for i=1:4
        for j=1:12
            for k=1:ngrid
                if (tempgrouprank(k,j)==i) 
                    tempgrouprankfreq(i,j)=tempgrouprankfreq(i,j)+1;
                end
            end
        end
    end

%%
    finalgrouprankgppv7aipa5s60temp=zeros(1,12);
    for i=1:12
        maxi=find(tempgrouprankfreq(:,i)==max(tempgrouprankfreq(:,i)));
        finalgrouprankgppv7aipa5s60temp(i)=maxi(1);
    end
    finalgrouprankgppv7aipa5s60bs80(irep,:)=finalgrouprankgppv7aipa5s60temp;

    finalgridportiongppv7aipa5s60temp=zeros(1,12);
    for i=1:12
        finalgridportiongppv7aipa5s60temp(i)=tempgrouprankfreq(finalgrouprankgppv7aipa5s60temp(i),i)/ngrid;
    end
    finalgridportiongppv7aipa5s60bs80(irep,:)=finalgridportiongppv7aipa5s60temp;
end

%% Grid robustness
finalgridportionrobustgppv7aipa5s60bs80=zeros(nreps,12);
orisamplerank=finalgrouprankgppv7aipa5s60g418;
robustness=zeros(1,12);
nreps=80;
for i=1:12
    for j=1:nreps
        if (finalgrouprankgppv7aipa5s60bs80(j,i)==orisamplerank(i))
            finalgridportionrobustgppv7aipa5s60bs80(j,i)=finalgridportiongppv7aipa5s60bs80(j,i);
            robustness(i)=robustness(i)+1;
        end
    end
    robustness(i)=robustness(i)/nreps;
end
finalgrouprankrobustgppv7aipa5s60bs80=robustness;
%% D. Statistics
meangridportionrobustgppv7ais60bs80=zeros(1,12);
stdgridportionrobustgppv7sai60bs80=zeros(1,12);
for i=1:12
    meangridportionrobustgppv7ais60bs80(1,i)=mean(finalgridportionrobustgppv7aipa5s60bs80(:,i));
    stdgridportionrobustgppv7sai60bs80(1,i)=std(finalgridportionrobustgppv7aipa5s60bs80(:,i));
end
