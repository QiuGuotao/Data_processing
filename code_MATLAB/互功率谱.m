Fs=100;
n=0:1/Fs:1;
nfft=1024;
Nd=length(res_signal0(1,:));
channel = [1:Nd];  
G0 = zeros(length(channel),length(channel),(nfft/2+1));   
G1=0;              

for i=1:length(channel) 
    for j=1:length(channel) 
%       [Pff2,f] = csd(AY(:,channel(i)),AY(:,channel(j)),NFFT,fs,kaiser(NFFT),NFFT/2); 
        [Pff2,f_disc]=cpsd(res_signal0(:,channel(i)),res_signal0(:,channel(j)),kaiser(nfft),nfft/2,nfft,Fs);
      
        G0(j,i,:) = Pff2; 
            if i==j 
            G1=G1+Pff2; 
        end 
 end 
end
