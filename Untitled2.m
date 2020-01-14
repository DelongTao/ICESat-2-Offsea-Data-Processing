clc
clear
% 本代码功能为绘制图
dbstop if all error
addpath(genpath('./'))
addpath('../')

filepath = 'D:\first year PhD\2020IGRASS\';
filename = 'ATL03_20190430102139_04910307_002_01.h5';
[data,segment] = ICESat2_read(filename,filepath, 1, 'strong');
[segment.segment_start_time, segment.segment_end_time] = segment_cal(segment);
% plot(data.delta_time,data.height,'b.','MarkerSize',0.10)

% 选取数据区域
start_time = 41854996.42; end_time = 41854997.5; 

[start_id,end_id,data_selected] = select_photon(data,segment,start_time,end_time);
p = data_selected.dis-data_selected.dis(1);


plot(p,data_selected.height,'b.','MarkerSize',0.10)
xlabel('distance initial (m)')
ylabel('elevation (meters)')
% 
% xlswrite('D:\first year PhD\2020IGRASS\program_v1.01\result\lon_lat.csv',[data_selected.lat...
%     ,data_selected.lon])
