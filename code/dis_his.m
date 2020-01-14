function [num_dis] = dis_his(data,num)
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
x = [data.dis,double(data.height)];
num_dis = zeros(length(data.dis),1);
for i = 1:length(data.dis)
    if (i-num*100/2)<=0
        boud = 1:num*100;
    elseif i+num*100/2>=length(data.dis)
        boud = (length(data.dis)-num*100):length(data.dis);
    else 
        boud = (i-num*100/2):(i+num*100/2);
    end
    diff = x(boud,:)-x(i,:);
    dis = diff(:,1).^2+diff(:,2).^2;
    temp = sort(dis);
    num_dis(i) = sum(temp(1:num+1));
end

end

