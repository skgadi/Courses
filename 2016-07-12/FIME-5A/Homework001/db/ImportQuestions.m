function [No1,Name1,VarOOA1,VarOOB1,VarOOC1,VarOOD1,VarOOE1,VarOOF1,VarOOG1,VarOOH1,VarOOI1,VarOOJ1,VarOOK1,VarOOL1,VarOOM1,VarOON1,VarOOO1,VarOOP1,VarOOQ1,VarOOR1,VarOOS1,VarOOT1,VarOOU1,VarOOV1,VarOOW1,VarOOX1,VarOOY1,VarOOZ1,VarOOa1,VarOOb1,VarOOc1,VarOOd1,VarOOe1,VarOOf1,VarOOg1,VarOOh1,VarOOi1,VarOOj1,VarOOk1,VarOOl1,VarOOm1,VarOOn1,VarOOo1,VarOOp1,VarOOq1,VarOOr1,VarOOs1,VarOOt1,VarOOu1,VarOOv1,VarOOw1,VarOOx1,VarOOy1,VarOOz1] = ImportQuestions(filename, startRow, endRow)
%IMPORTFILE Import numeric data from a text file as column vectors.
%   [NO1,NAME1,VAROOA1,VAROOB1,VAROOC1,VAROOD1,VAROOE1,VAROOF1,VAROOG1,VAROOH1,VAROOI1,VAROOJ1,VAROOK1,VAROOL1,VAROOM1,VAROON1,VAROOO1,VAROOP1,VAROOQ1,VAROOR1,VAROOS1,VAROOT1,VAROOU1,VAROOV1,VAROOW1,VAROOX1,VAROOY1,VAROOZ1,VAROOA1,VAROOB1,VAROOC1,VAROOD1,VAROOE1,VAROOF1,VAROOG1,VAROOH1,VAROOI1,VAROOJ1,VAROOK1,VAROOL1,VAROOM1,VAROON1,VAROOO1,VAROOP1,VAROOQ1,VAROOR1,VAROOS1,VAROOT1,VAROOU1,VAROOV1,VAROOW1,VAROOX1,VAROOY1,VAROOZ1]
%   = IMPORTFILE(FILENAME) Reads data from text file FILENAME for the
%   default selection.
%
%   [NO1,NAME1,VAROOA1,VAROOB1,VAROOC1,VAROOD1,VAROOE1,VAROOF1,VAROOG1,VAROOH1,VAROOI1,VAROOJ1,VAROOK1,VAROOL1,VAROOM1,VAROON1,VAROOO1,VAROOP1,VAROOQ1,VAROOR1,VAROOS1,VAROOT1,VAROOU1,VAROOV1,VAROOW1,VAROOX1,VAROOY1,VAROOZ1,VAROOA1,VAROOB1,VAROOC1,VAROOD1,VAROOE1,VAROOF1,VAROOG1,VAROOH1,VAROOI1,VAROOJ1,VAROOK1,VAROOL1,VAROOM1,VAROON1,VAROOO1,VAROOP1,VAROOQ1,VAROOR1,VAROOS1,VAROOT1,VAROOU1,VAROOV1,VAROOW1,VAROOX1,VAROOY1,VAROOZ1]
%   = IMPORTFILE(FILENAME, STARTROW, ENDROW) Reads data from rows STARTROW
%   through ENDROW of text file FILENAME.
%
% Example:
%   [No1,Name1,VarOOA1,VarOOB1,VarOOC1,VarOOD1,VarOOE1,VarOOF1,VarOOG1,VarOOH1,VarOOI1,VarOOJ1,VarOOK1,VarOOL1,VarOOM1,VarOON1,VarOOO1,VarOOP1,VarOOQ1,VarOOR1,VarOOS1,VarOOT1,VarOOU1,VarOOV1,VarOOW1,VarOOX1,VarOOY1,VarOOZ1,VarOOa1,VarOOb1,VarOOc1,VarOOd1,VarOOe1,VarOOf1,VarOOg1,VarOOh1,VarOOi1,VarOOj1,VarOOk1,VarOOl1,VarOOm1,VarOOn1,VarOOo1,VarOOp1,VarOOq1,VarOOr1,VarOOs1,VarOOt1,VarOOu1,VarOOv1,VarOOw1,VarOOx1,VarOOy1,VarOOz1] = importfile('questions.csv',2, 17);
%
%    See also TEXTSCAN.

% Auto-generated by MATLAB on 2016/08/30 13:32:55

%% Initialize variables.
delimiter = ',';
if nargin<=2
    startRow = 2;
    endRow = inf;
end

%% Format string for each line of text:
%   column1: double (%f)
%	column2: text (%s)
%   column3: double (%f)
%	column4: double (%f)
%   column5: double (%f)
%	column6: double (%f)
%   column7: double (%f)
%	column8: double (%f)
%   column9: double (%f)
%	column10: double (%f)
%   column11: double (%f)
%	column12: double (%f)
%   column13: double (%f)
%	column14: text (%s)
%   column15: text (%s)
%	column16: text (%s)
%   column17: text (%s)
%	column18: text (%s)
%   column19: text (%s)
%	column20: text (%s)
%   column21: text (%s)
%	column22: text (%s)
%   column23: text (%s)
%	column24: text (%s)
%   column25: text (%s)
%	column26: text (%s)
%   column27: text (%s)
%	column28: text (%s)
%   column29: text (%s)
%	column30: text (%s)
%   column31: text (%s)
%	column32: text (%s)
%   column33: text (%s)
%	column34: text (%s)
%   column35: text (%s)
%	column36: text (%s)
%   column37: text (%s)
%	column38: text (%s)
%   column39: text (%s)
%	column40: text (%s)
%   column41: text (%s)
%	column42: text (%s)
%   column43: text (%s)
%	column44: text (%s)
%   column45: text (%s)
%	column46: text (%s)
%   column47: text (%s)
%	column48: text (%s)
%   column49: text (%s)
%	column50: text (%s)
%   column51: text (%s)
%	column52: text (%s)
%   column53: text (%s)
%	column54: text (%s)
% For more information, see the TEXTSCAN documentation.
formatSpec = '%s%s%f%f%f%f%f%f%f%f%f%f%f%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%s%[^\n\r]';

%% Open the text file.
fileID = fopen(filename,'r');

%% Read columns of data according to format string.
% This call is based on the structure of the file used to generate this
% code. If an error occurs for a different file, try regenerating the code
% from the Import Tool.
dataArray = textscan(fileID, formatSpec, endRow(1)-startRow(1)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(1)-1, 'ReturnOnError', false);
for block=2:length(startRow)
    frewind(fileID);
    dataArrayBlock = textscan(fileID, formatSpec, endRow(block)-startRow(block)+1, 'Delimiter', delimiter, 'HeaderLines', startRow(block)-1, 'ReturnOnError', false);
    for col=1:length(dataArray)
        dataArray{col} = [dataArray{col};dataArrayBlock{col}];
    end
end

%% Close the text file.
fclose(fileID);

%% Post processing for unimportable data.
% No unimportable data rules were applied during the import, so no post
% processing code is included. To generate code which works for
% unimportable data, select unimportable cells in a file and regenerate the
% script.

%% Allocate imported array to column variable names
No1 = dataArray{:, 1};
Name1 = dataArray{:, 2};
VarOOA1 = dataArray{:, 3};
VarOOB1 = dataArray{:, 4};
VarOOC1 = dataArray{:, 5};
VarOOD1 = dataArray{:, 6};
VarOOE1 = dataArray{:, 7};
VarOOF1 = dataArray{:, 8};
VarOOG1 = dataArray{:, 9};
VarOOH1 = dataArray{:, 10};
VarOOI1 = dataArray{:, 11};
VarOOJ1 = dataArray{:, 12};
VarOOK1 = dataArray{:, 13};
VarOOL1 = dataArray{:, 14};
VarOOM1 = dataArray{:, 15};
VarOON1 = dataArray{:, 16};
VarOOO1 = dataArray{:, 17};
VarOOP1 = dataArray{:, 18};
VarOOQ1 = dataArray{:, 19};
VarOOR1 = dataArray{:, 20};
VarOOS1 = dataArray{:, 21};
VarOOT1 = dataArray{:, 22};
VarOOU1 = dataArray{:, 23};
VarOOV1 = dataArray{:, 24};
VarOOW1 = dataArray{:, 25};
VarOOX1 = dataArray{:, 26};
VarOOY1 = dataArray{:, 27};
VarOOZ1 = dataArray{:, 28};
VarOOa1 = dataArray{:, 29};
VarOOb1 = dataArray{:, 30};
VarOOc1 = dataArray{:, 31};
VarOOd1 = dataArray{:, 32};
VarOOe1 = dataArray{:, 33};
VarOOf1 = dataArray{:, 34};
VarOOg1 = dataArray{:, 35};
VarOOh1 = dataArray{:, 36};
VarOOi1 = dataArray{:, 37};
VarOOj1 = dataArray{:, 38};
VarOOk1 = dataArray{:, 39};
VarOOl1 = dataArray{:, 40};
VarOOm1 = dataArray{:, 41};
VarOOn1 = dataArray{:, 42};
VarOOo1 = dataArray{:, 43};
VarOOp1 = dataArray{:, 44};
VarOOq1 = dataArray{:, 45};
VarOOr1 = dataArray{:, 46};
VarOOs1 = dataArray{:, 47};
VarOOt1 = dataArray{:, 48};
VarOOu1 = dataArray{:, 49};
VarOOv1 = dataArray{:, 50};
VarOOw1 = dataArray{:, 51};
VarOOx1 = dataArray{:, 52};
VarOOy1 = dataArray{:, 53};
VarOOz1 = dataArray{:, 54};


