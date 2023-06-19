for k=1:length(G0(1,1,:))
    s(:,:,k)=svd(G0(:,:,k));
    QYZ(k,1)=s(1,1,k);
end
subplot(2,1,1);
semilogy(f,QYZ);
ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;
subplot(2,1,2);
semilogy(f,G1);
ylabel('spectrum[g2/HZ]');
xlabel('f[HZ]');
grid on;
