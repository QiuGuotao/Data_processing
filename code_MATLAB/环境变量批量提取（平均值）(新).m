clear
close all
clc  
aa=1; 
textpath=pathfun(aa);
for pattern=1:length(textpath(:,1))   

textpath1=textpath(pattern,:);  
textfiles1=dir(fullfile(textpath1,'/*.env')); 
num_re1=size(textfiles1,1);     

textpath1=textpath(pattern,:); 
textfiles1=dir(fullfile(textpath1,'/*.env')); 
num_re1=size(textfiles1,1);    

for kk1=1:num_re1 
textname1=textfiles1(kk1,1).name; 
fid1=fopen(textname1,'r'); 
clear tline1 
tline0=fgetl(fid1);     

for kk=1:10 
tline_temp=fgetl(fid1); 
tline1(kk,:)=tline_temp;  
end

fclose(fid1);

if kk1==1
env_signal1(:,:,pattern)=str2num(tline1); 
mean_pos(pattern,:)=mean(env_signal1(:,:,pattern));
else 
env_signal2(:,:,pattern)=str2num(tline1); 
mean_pre(pattern,:)=mean(env_signal2(:,:,pattern));
end



    

end
end
for tt=1:length(mean_pos)
mean_total(:,2*tt-1)=mean_pre(:,tt);

mean_total(:,2*tt)=mean_pos(:,tt)£»


end
