x=1:10;
AT_PRE=env_signalPRE(:,3)*100-40;
AT_POS=env_signalPOS(:,3)*100-40;
y1=AT_PRE;
y2=AT_POS;
plot(x,y1,x,y2);
ylabel('T[¡æ]');
xlabel('t');
grid on;