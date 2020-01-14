function [data,segment] = ICESat2_read(h5_name, path, pcex_num, type)
%UNTITLED2 此处显示有关此函数的摘要
% type的值为  'strong' or 'weak'
%   此处显示详细说明

addpath(path);
orientation = h5read(h5_name,'/orbit_info/sc_orient');
LorR = LOR(orientation,type);
data.delta_time = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/heights/delta_time']);
data.lon = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/heights/lon_ph']);
data.lat = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/heights/lat_ph']);
data.id = (1:length(data.delta_time))';
[~,~,ph_dis_out] = ATLread2(h5_name,pcex_num,LorR);
data.height = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/heights/h_ph']);
segment.delta_time = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/geolocation/delta_time']);
segment.surf_type = h5read(h5_name,['/gt' num2str(pcex_num) LorR '/geolocation/surf_type'])';
data.dis = ph_dis_out;


end

function LorR = LOR(orientation,type)
% 该函数是为了获得左右波束的
if strcmp(type,'strong')
    type_id = 1;
elseif strcmp(type,'weak')
    type_id = 2;
end
if orientation==1
    if type_id == 1
        LorR = 'r';
    elseif type_id == 2
        LorR = 'l';
    end
elseif orientation==0
    if type_id == 1
        LorR = 'l';
    elseif type_id == 2
        LorR = 'r';
    end    
elseif orientation==2
    LorR = [];
end

end

