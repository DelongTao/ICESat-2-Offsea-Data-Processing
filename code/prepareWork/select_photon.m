function [start_id,end_id,data_selected] = select_photon(data,segment,start_time,end_time)
%UNTITLED5 此处显示有关此函数的摘要
%   此处显示详细说明
start_time_vector = segment.segment_start_time;
flag1 = abs(start_time_vector-start_time);
[~,start_id] = min(flag1);
start_id = start_id - 1;

flag2 = abs(end_time - segment.segment_end_time);
[~,end_id] = min(flag2);
end_id = end_id + 1;

start_time_correction = segment.segment_start_time(start_id);
end_time_correction =  segment.segment_end_time(end_id);
delta_time = data.delta_time;

flag3 = (delta_time>=start_time_correction)& (delta_time<=end_time_correction);
data_selected.delta_time = data.delta_time(flag3);
data_selected.height = data.height(flag3);
data_selected.id = data.id(flag3);
data_selected.lon = data.lon(flag3);
data_selected.lat = data.lat(flag3);
data_selected.dis = data.dis(flag3);

end

