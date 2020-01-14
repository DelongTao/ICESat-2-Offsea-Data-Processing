function [output_data] = struct_filter(data,id)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明

fields = fieldnames(data);
output_data = struct;
for i = 1:length(fields)
    temp = getfield(data,fields{i});
    output_data = setfield(output_data,fields{i},temp(id));
end

end

