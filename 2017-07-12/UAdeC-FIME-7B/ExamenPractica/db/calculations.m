clc;
clear;
% copyfile('questions.csv','answers.csv')
% Qtns = csvread('questions.csv',1,2);
[No1,Name1,VarOOA1,VarOOB1,VarOOC1,VarOOD1,VarOOE1,VarOOF1,VarOOG1,VarOOH1,VarOOI1,VarOOJ1,...
    VarOOK1,VarOOL1,VarOOM1,VarOON1,VarOOO1,VarOOP1,VarOOQ1,VarOOR1,VarOOS1,VarOOT1,VarOOU1,...
    VarOOV1,VarOOW1,VarOOX1,VarOOY1,VarOOZ1,VarOOa1,VarOOb1,VarOOc1,VarOOd1,VarOOe1,VarOOf1,...
    VarOOg1,VarOOh1,VarOOi1,VarOOj1,VarOOk1,VarOOl1,VarOOm1,VarOOn1,VarOOo1,VarOOp1,VarOOq1,...
    VarOOr1,VarOOs1,VarOOt1,VarOOu1,VarOOv1,VarOOw1,VarOOx1,VarOOy1,VarOOz1]...
    = ImportQuestions ('questions.csv', 2);
Alphabet = char(('A':'Z').',('a':'z').');
[I,J] = meshgrid(1:52,1:52);
OutVar=[Alphabet(I(:)), Alphabet(J(:))];
OutVar=char(Alphabet,OutVar);
NoOfOutVar = 52;
% Ans = zeros(size(Qtns));
AnsFile=fopen( 'answeres.csv', 'wt' );%fopen('answeres.csv');
fprintf(AnsFile,'No,Name');
for itr = 1:(NoOfOutVar)
    fprintf(AnsFile,',SKGVar%s',OutVar(itr));
end
fprintf(AnsFile,'\n');

for itr = 1:size(No1,1)
%     Number and Name
    fprintf(AnsFile,'%s,%s',char(No1(itr)),char(Name1(itr)));
%     First question
    Q1Z1 = - VarOOA1(itr)*1i;
    Q1Z2 = VarOOB1(itr)*1i;
    Q1Z3 = VarOOC1(itr);
    Q1Z4 = VarOOD1(itr);
    Q1Z5 = VarOOE1(itr);
    Q1Z6 = VarOOF1(itr) + VarOOG1(itr)*1i;
    Q1V1 = VarOOH1(itr);
    Q1V2 = VarOOI1(itr) + VarOOJ1(itr)*1i;

    Q1Z7 = 1/(1/Q1Z1 + 1/Q1Z2);
    Q1Z8 = 1/(1/Q1Z4 + 1/Q1Z5);
    Q1Z = [ Q1Z6+Q1Z7+Q1Z3,         -Q1Z3,          0,          -Q1Z6; 
            -Q1Z3,             Q1Z3+Q1Z6+Q1Z8,      -Q1Z6,      0;
            0                   -Q1Z6,          Q1Z6+Q1Z3+Q1Z7, -Q1Z3;
            -Q1Z6,          0,                  -Q1Z3,          Q1Z6+Q1Z3+Q1Z8;];
    
    Q1V = [Q1V1-Q1V2; Q1V2-Q1V1; Q1V1-Q1V2; Q1V2-Q1V1];
    Q1I = Q1Z\Q1V;
    Q1i1 = Q1I(1)*Q1Z2/(Q1Z1+Q1Z2);
    Q1i2 = Q1I(1)*Q1Z1/(Q1Z1+Q1Z2);
    Q1i4 = Q1I(2)*Q1Z5/(Q1Z4+Q1Z5);
    Q1i5 = Q1I(2)*Q1Z4/(Q1Z4+Q1Z5);
    Q1i3 = Q1I(2)-Q1I(1);
    Q1i6 = Q1I(1)-Q1I(4);
    fprintf(AnsFile,',%s',num2str(Q1i1));
    fprintf(AnsFile,',%s',num2str(Q1i2));
    fprintf(AnsFile,',%s',num2str(Q1i3));
    fprintf(AnsFile,',%s',num2str(Q1i4));
    fprintf(AnsFile,',%s',num2str(Q1i5));
    fprintf(AnsFile,',%s',num2str(Q1i6));

%     Question 2
    Q2t0 = asin(0.1)/20/pi;
    Q2t1 = asin(0.9)/20/pi;
    Q2RMS = sqrt( 1/0.025*(...
                                Q2t0 ...
                                + 81*(0.025-Q2t1) ...
                                + 100/2*(Q2t1-Q2t0) ...
                                - 10/2/4/pi*( ...
                                            sin(40*pi*Q2t1) ...
                                            -sin(40*pi*Q2t0) ...
                                )...
                              )...
            );
    fprintf(AnsFile,',%s',num2str(Q2RMS));
    Q2ARV = 1/0.025*(...
                        Q2t0 ...
                        + 9*(0.025-Q2t1) ...
                        - 1/2/pi* ( ...
                                cos(20*pi*Q2t1) ...
                                - cos(20*pi*Q2t0) ...
                                )...
                     );
    fprintf(AnsFile,',%s',num2str(Q2ARV));
%     Third question

    Q3Z = VarOOK1(itr) + VarOOL1(itr)*1i;
    fprintf(AnsFile,',%s',num2str(Q3Z*3/4));
%     Finishing the CSV line
    for itr2 = 1:(52-9)
        fprintf(AnsFile,',');
    end
    fprintf(AnsFile,'\n');
end

fclose(AnsFile);
