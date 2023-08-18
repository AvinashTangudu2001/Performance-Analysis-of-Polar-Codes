EbN0dB=-4:1:24;
R=1/3;%uncoded bpsk(1bit/sym)
EbN0=10.^(EbN0dB/10);

sigma=sqrt(1./(2*R*EbN0));
BER=0.5*erfc(sqrt(EbN0));
N=3;%number of codeword bits
k=1;
BER_SIM=[];

for j=sigma,
    error=0;
    for i=1:1000000
        msg=randi([0,1],1,k);
        cword =[msg msg msg];
        s=1-2*cword;
        r=s+j*randn(1,N);
        %hard threshold
        b=(r<0);
        if sum(b)>1
            msg_cap=1;
        else
            msg_cap=0;
        end
        error= error+sum(msg~=msg_cap);
    end
    BER_SIM=[BER_SIM, error/(1000000)];

end
plot(EbN0dB,log10(BER_SIM))
axis([-4 24 -6 0])