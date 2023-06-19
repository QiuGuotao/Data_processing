for i = 2:19
    for j = 1:i-1
        Magmom(20-j,i)=Magmom(j,20-i);
    end
end

a = 1;
for i = 1:37
    for j = 1:37
        Plot(a,1)= (i-1)/36;
        Plot(a,2)= (j-1)/36;
        Plot(a,3)= AFM_map(38-j,i);
        Plot(a,4)= FM_map(38-j,i);
        Plot(a,5)= Magmom(38-j,i);
        a = a+1;
    end
end
Plot(:,6)=  Plot(:,4)- Plot(:,3);


%%%%%%%%%%%%%%%%%%%%Right

for i = 1:19
    for j = 1: 20-i
        Magmom(20-j,20-i) = Magmom(i,j);
    end
end


%%%%%%%%%%%%%big

for i = 1:18
    AFM_map(:,i+19) = AFM_map(:,19-i);
    FM_map(:,i+19) = FM_map(:,19-i);
    Magmom(:,i+19) = Magmom(:,19-i);
end

for j = 1:18

    AFM_map(j+19,:) = AFM_map(19-j,:);
     FM_map(j+19,:) = FM_map(19-j,:);
     Magmom(j+19,:) = Magmom(19-j,:);
end



