function [output_data] = struct_filter(data,id)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��

fields = fieldnames(data);
output_data = struct;
for i = 1:length(fields)
    temp = getfield(data,fields{i});
    output_data = setfield(output_data,fields{i},temp(id));
end

end

