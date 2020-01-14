function [his_seg] = build_his(data,start_time,end_time,height_centre_bou,semi_limit)
%UNTITLED6 此处显示有关此函数的摘要
%   此处显示详细说明
flag1 = (data.delta_time>=start_time)&(data.delta_time<=end_time);
delta_time = data.delta_time(flag1);
height = data.height(flag1);

max_height = max(height); min_height = min(height);
h_cen = (min_height:height_centre_bou:max_height)';
h_cen_start = h_cen - semi_limit;
h_cen_end = h_cen + semi_limit;
temp = [h_cen_start;h_cen_end];
edges1 = roundn(temp,-3); 
[~, ia, ~] = unique(edges1);
edges2 = temp(ia);
edges = sort(edges2);

histg = histcounts(height,edges);

his_seg = zeros(length(h_cen),1);
for i = 1:length(h_cen)
    [~,id1] = find(h_cen_start(i)==edges);
    [~,id2] = find(h_cen_end(i)==edges);
    id2 = id2-1;
    his_seg(i) = sum(histg(id1:id2));
end


end

