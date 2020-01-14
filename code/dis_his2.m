function [num_dis] = dis_his2(data,num)
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
x = [data.dis,double(data.height)];
num_dis = zeros(length(data.dis),1);
[z] = built_dis(data);
for i = 1:size(z,1)
    temp = sort(z(:,i));
    num_dis(i) = sum(temp(1:num+1));
end


end


