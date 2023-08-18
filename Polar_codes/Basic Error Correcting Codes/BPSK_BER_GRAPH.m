x=[];

a=[];

for  Eb_No_db = -4 : 14

     x = [x,Eb_No_db];
     a = [a,bpsk_ham_7_4(Eb_No_db)];

end  

plot(x,log10(a));
hold off;