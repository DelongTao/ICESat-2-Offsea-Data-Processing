function [ph_delta_time_out ,ph_h_out,ph_dis_out] = ATLread2(h5filename,spot_num,distru)
%UNTITLED 此处显示有关此函数的摘要
% flag_surface = 3; flag_surface代表地表类型，1为陆地，2为海洋，3为海冰，4为陆地冰，5为内陆水
% spot_num = 2;代表波束，取值为1,2,3
% distru = 'r';代表right还是left，取值为r，l
%   此处显示详细说明
h_ph = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/heights/h_ph'));
delta_time = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/heights/delta_time'));



dist_ph_along = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/heights/dist_ph_along'));
ph_index_beg = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/geolocation/ph_index_beg'));
segment_length = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/geolocation/segment_length'));
segment_ph_cnt = h5read(h5filename,strcat('/gt',num2str(spot_num),distru,'/geolocation/segment_ph_cnt'));

segment_dis = cumsum(segment_length);
ph_segment = zeros(length(h_ph),1);
for i = 1:length(ph_index_beg)
    if ph_index_beg(i)==0
        continue
    else 
        ph_id_start = ph_index_beg(i);
        ph_id_end = ph_id_start+int64(segment_ph_cnt(i))-1;
    end
    ph_segment(ph_id_start:int64(ph_id_end)) = i;
end

ph_dis_segment = segment_dis(ph_segment)-segment_length(ph_segment);
ph_dis = ph_dis_segment + double(dist_ph_along);

ph_delta_time_out = delta_time;
ph_dis_out = ph_dis;
ph_h_out = h_ph;

end

