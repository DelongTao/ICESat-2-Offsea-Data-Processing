function [limit] = find_boundary(his_seg,h_limit)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
mean_his = mean(his_seg);
std_his = std(his_seg);
flag = his_seg<=(mean_his + 3*std_his);
back_noise = his_seg(flag);
mean_his_back = mean(back_noise);
std_his_back = std(back_noise);
flag = his_seg>=(mean_his_back+5*std_his_back);
if sum(flag)==0
    limit = [];
else
    [start,end1] = test_continuous(flag);
    [start,end1] = test_corr(start,end1,5);
    limit(1:length(start),1) = h_limit(start,1);
    limit(1:length(start),2) = h_limit(end1,2);
end


end

function [start1,end11] = test_corr(start,end1,num_bin)
start = start-num_bin;
end1 = end1 - num_bin;
if length(start)<2
    start1 = start;
    end11 = end1;
else
    while true
        num = length(start);
        for i = 1:num-1
            if end1(i)>=start(i+1)
                end1(i)=end1(i+1);
                start(i+1)=[];end1(i+1)=[];
                break;
            end
        end
        if i == num-1
            break
        end
    end
    start1 = start;
    end11 = end1;
end
end

