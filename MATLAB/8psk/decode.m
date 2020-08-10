function srx = decode(vec_comp,A)

vec=zeros(2,1);
vec(1,1)=real(vec_comp);
vec(2,1)=imag(vec_comp);
 for i = 1:8
     x=[A(i,:,1);A(i,:,2)]*vec;
        if and(x(1,1)>=0, x(2,1)>=0)
         srx=i;
        end
 end
end

