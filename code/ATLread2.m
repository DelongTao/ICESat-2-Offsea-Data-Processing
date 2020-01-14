function [ph_delta_time_out ,ph_h_out,ph_dis_out] = ATLread2(h5filename,spot_num,distru)
%UNTITLED �˴���ʾ�йش˺�����ժҪ
% flag_surface = 3; flag_surface����ر����ͣ�1Ϊ½�أ�2Ϊ����3Ϊ������4Ϊ½�ر���5Ϊ��½ˮ
% spot_num = 2;��������ȡֵΪ1,2,3
% distru = 'r';����right����left��ȡֵΪr��l
%   �˴���ʾ��ϸ˵��
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

