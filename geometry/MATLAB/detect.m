function y= detect(vec_comp,s,gray)

vec=zeros(2,1);
vec(1)=real(vec_comp);
vec(2)=imag(vec_comp);
for i=1:8
    if s(i,1)==vec(1) && s(i,2)==vec(2)
        y= gray(i,:);
    end
end
% y=vec;
end

