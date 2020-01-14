function [his_seg,h_limit] = build_his2(data,start_time,end_time,height_centre_bou,semi_limit)
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
flag1 = (data.delta_time>=start_time)&(data.delta_time<=end_time);
delta_time = data.delta_time(flag1);
height = data.height(flag1);

max_height = max(height); min_height = min(height);
h_cen = (min_height:height_centre_bou:max_height)';
h_cen_start = h_cen - semi_limit;
h_cen_end = h_cen + semi_limit;

his_seg = zeros(length(h_cen),1);
for i = 1:length(height)
    flag2 = (height(i)>=h_cen_start)&(height(i)<=h_cen_end);
    his_seg = his_seg + double(flag2);
end
h_limit = [h_cen_start h_cen_end];


end

