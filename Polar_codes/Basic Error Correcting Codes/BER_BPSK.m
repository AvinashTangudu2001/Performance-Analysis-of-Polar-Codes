%Channel Modelling without fading.
function [x,y]=BER_BPSK()
EbN0dB=-4:1:8;
R=1;%uncoded bpsk(1bit/sym)
EbN0=10.^(EbN0dB/10);

sigma=sqrt(1./(2*R*EbN0));
BER_NF=0.5*erfc(sqrt(EbN0));
N=10000;
BER_SIM_NF=[];

for j=sigma,
    error=0;
    for i=1:N
        msg=randi([0,1],1,N);
        s=1-2*msg;
        r=s+j*randn(1,N);
        %hard threshold
        msg_cap=(r<0);
        error=error+sum(msg ~= msg_cap);
    end
    BER_SIM_NF=[BER_SIM_NF, error/(N*N)];
    x=BER_SIM_NF;
    y=BER_NF;
end
plot(EbN0dB,log10(BER_SIM_NF))
axis([-4 24 -6 0])
end
