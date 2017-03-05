function readWord(fileName, saveName )
%READWORD Summary of this function goes here
%   Detailed explanation goes here
    row = 1;
    col = 1448;
    fid = fopen(fileName);
    document = 1;
    tline = fgetl(fid);
    y = [];
    x = sparse(row, col);
    while ischar(tline)
        C = strsplit(tline);
        y = [y;str2double(C{1})];
        for i=2:size(C,2)
            element = strsplit(C{i},':');
            x(document, str2double(element{1})) = str2double(element{2});
        end
        %disp(tline);
        tline = fgetl(fid);
        document = document + 1;
    end
    fclose(fid);
    save(['data\', saveName, '.mat'],'x','y');
end

