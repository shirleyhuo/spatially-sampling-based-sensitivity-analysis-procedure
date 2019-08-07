%% A. Get para robustness on each grid. Original data.
ngrid=263;
gppv11aipa5s60p300pararoubsteachgridrank1=zeros(ngrid,12);
for ig=1:ngrid
    nreps=300;
    tempgrankpararobustbs=zeros(nreps,12);
    for irep=1:valirepnumbergppv11aipa5s60p300(ig)
        lindx=irep+endaccnumbergppv11aipa5s60p300(ig);
        [transdat,lambda] = boxcox((gppv11aipa5s60marsbs300eachgrid(lindx,:)+1)');
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
        tempgrankpararobustbs(irep,:)=tT;
    end

%% factor grouping samples
    orisamplerank=1;
    robustness=zeros(1,12);
    for i=1:12
        for j=1:nreps
            if (tempgrankpararobustbs(j,i)==orisamplerank)
                robustness(i)=robustness(i)+1;
            end
        end
        robustness(i)=robustness(i)/nreps;
    end
    gppv11aipa5s60p300pararoubsteachgridrank1(ig,:)=robustness;
end

%% B Now Bar Plot
gppv11aipa5s60p300pararoubsteachgridrankbootstrap=zeros(4,12);
for j=1:12
    gppv11aipa5s60p300pararoubsteachgridrankbootstrap(1,j)=mean(gppv11aipa5s60p300pararoubsteachgridrank1(:,j));
    gppv11aipa5s60p300pararoubsteachgridrankbootstrap(2,j)=mean(gppv11aipa5s60p300pararoubsteachgridrank2(:,j));
    gppv11aipa5s60p300pararoubsteachgridrankbootstrap(3,j)=mean(gppv11aipa5s60p300pararoubsteachgridrank3(:,j));
    gppv11aipa5s60p300pararoubsteachgridrankbootstrap(4,j)=mean(gppv11aipa5s60p300pararoubsteachgridrank4(:,j));
end
bar(gppv11aipa5s60p300pararoubsteachgridrankbootstrap');
