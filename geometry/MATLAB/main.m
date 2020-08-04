snrlen=10;
snr_db=linspace(0,snrlen,snrlen);
snr=6*10.^(0.1*snr_db);
bitsimlen=99999;
bits=bitstream(bitsimlen);
simlen=bitsimlen/3;
s=zeros(8,2);
s_comp=zeros(8,1)+1j*zeros(8,1);
for j=1:8
    s(j,:)=[cos((j-1)*2*pi/8),sin((j-1)*2*pi/8)];
    s_comp(j)=s(j,1)+1j*s(j,2);
end
symbols_lst=symb(bits,simlen,s);
symbols=transpose(symbols_lst);
symbols_comp=symbols(1,:)+1j*symbols(2,:);

ser=zeros(1,snrlen);
ser_anal=zeros(1,snrlen);
ber=zeros(1,snrlen);

A = zeros(8,2,2);
A(1,:,:) = [[sqrt(2)-1,1];[sqrt(2)-1,-1]];
A(2,:,:) = [[sqrt(2)+1,-1];[-sqrt(2)+1,1]];
A(3,:,:) = [[-(sqrt(2)+1),1];[sqrt(2)+1,1]];
A(4,:,:) = [[sqrt(2)-1,1];[-(sqrt(2)+1),-1]];
A(5,:,:) = [[-(sqrt(2)-1),-1];[-(sqrt(2)-1),1]];
A(6,:,:) = [[-(sqrt(2)+1),1];[sqrt(2)-1,-1]];
A(7,:,:) = [[sqrt(2)+1,-1];[-(sqrt(2)+1),-1]];
A(8,:,:) = [[-(sqrt(2)-1),-1];[sqrt(2)+1,1]];

gray = zeros(8,3);
gray(1,:) = [0,0,0];
gray(2,:) = [0,0,1];
gray(3,:) = [0,1,1];
gray(4,:) = [0,1,0];
gray(5,:) = [1,1,0];
gray(6,:) = [1,1,1];
gray(7,:) = [1,0,1];
gray(8,:) = [1,0,0];

for k = 1:snrlen
    recieved=[];
    t=0;
    noise_comp=normrnd(0,1,[1,simlen])+1j*normrnd(0,1,[1,simlen]);
    y_comp = sqrt(snr(k))*symbols_comp+noise_comp;
    brx=zeros(simlen,3);
    for i= 1:simlen
        srx_compd=decode(y_comp(i));
        for count=1:8
            x=A(count,:,:).*srx_compd;
            if x(1)>=0 && x(2)>=0
                srx_comp=s_comp(count);
            end
        end
        brx(i,:)=detect(srx_comp,s,gray);
%         for count1=1:8
%             if s(count1,1)==brx_vec(1) && s(count1,2)==brx_vec(2)
%                 brx(i)=gray(count1,:);
%             end
%         end
        if symbols_comp(i)==srx_comp
            t=t+1;
        end
    end
        ser(k)=1-(t/33334.0);
        ser_anal(k)=2*qfunc(sqrt(snr(k))*sin(pi/8));
        brx=reshape(brx.',1,[]);
        bitt_diff=bits-brx;
        check_bit=find(bitt_diff==0);
        ber(k)=1-length(check_bit)/bitsimlen;
end
hold on
semilogy(snr_db,ser_anal)
%semilogx(snr_db,ser)