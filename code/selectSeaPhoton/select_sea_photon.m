function [sel] = select_sea_photon(data_selected,water_loc,sig_thickness,height_centre_bou,semi_limit,width_jump,width_window...
    ,start_id,end_id,segment)
%UNTITLED3 此处显示有关此函数的摘要
%   此处显示详细说明
end_id_co = (end_id-width_window+width_jump);
id = start_id:width_jump:end_id_co;
selected_sea_photon_temp = zeros(10,length(id));
for i = id
    start_time = segment.segment_start_time(i);
    end_time = segment.segment_end_time(i+width_window-1);
    [h_limit_sea] = sea_photon_limit(water_loc,sig_thickness,data_selected,start_time,end_time,height_centre_bou,semi_limit);
    flag1 = (data_selected.delta_time>=start_time) & (data_selected.delta_time<=end_time);
    flag2 = (data_selected.height>=h_limit_sea(1)) & (data_selected.height<=h_limit_sea(2));
    flag = flag1&flag2;
    temp = data_selected.id(flag);
    selected_sea_photon_temp(1:length(temp),i) = data_selected.id(flag);
end
sel = selected_sea_photon_temp(:);
sel = unique(sel);
sel(sel == 0) = [];


end

