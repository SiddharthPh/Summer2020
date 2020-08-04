function srx = decode(vec_comp)

vec=zeros(2,1);
vec(1,1)=real(vec_comp);
vec(2,1)=imag(vec_comp);
% for i = 1:8
%     x=A(i,:,:).*vec;
%     if x(1)>=0 && x(2)>=0
%         srx=s_comp(i);
%     end
% end
% srx=x;
srx=vec;
end

