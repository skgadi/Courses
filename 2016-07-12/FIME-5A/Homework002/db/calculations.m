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
    Q1Omega = 2*pi*VarOOE1(itr)*10;
    Q1V = VarOOD1(itr)*10;
    Q1R = VarOOA1(itr)*10;
    Q1XL = 1i*Q1Omega*(VarOOB1(itr)/100);
    Q1XC = -1i/(Q1Omega*(VarOOC1(itr)*1e-4));
%     Figure 1
    Q1Z = (Q1R+Q1XL+Q1XC);
    Q1I = Q1V/Q1Z;
    Q1VR = Q1I*Q1R;
    Q1VXL = Q1I*Q1XL;
    Q1VXC = Q1I*Q1XC;
    
    fprintf(AnsFile,',%s',num2str(Q1I));
    fprintf(AnsFile,',%s',num2str(Q1VR));
    fprintf(AnsFile,',%s',num2str(Q1VXL));
    fprintf(AnsFile,',%s',num2str(Q1VXC));
    fprintf(AnsFile,',%s',num2str(VarOOF1(itr)));
    
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1V, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1I, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1VR, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1VXL, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1VXC, Q1Omega, VarOOF1(itr)/100)));
    
%     Figure 2
    Q1Z1 = 1/(1/Q1R + 1/Q1XL + 1/Q1XC);
    Q1Z = Q1R + Q1Z1;
    Q1I = Q1V/Q1Z;
    Q1VR1 = Q1I*Q1R;
    Q1VR2 = Q1I*Q1Z1;
    Q1IR2 = Q1VR2/Q1R;
    Q1IXL = Q1VR2/Q1XL;
    Q1IXC = Q1VR2/Q1XC;
    
    fprintf(AnsFile,',%s',num2str(Q1VR1));
    fprintf(AnsFile,',%s',num2str(Q1VR2));
    fprintf(AnsFile,',%s',num2str(Q1I));
    fprintf(AnsFile,',%s',num2str(Q1IR2));
    fprintf(AnsFile,',%s',num2str(Q1IXL));
    fprintf(AnsFile,',%s',num2str(Q1IXC));
    
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1VR1, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1VR2, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1I, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1IR2, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1IXL, Q1Omega, VarOOF1(itr)/100)));
    fprintf(AnsFile,',%s',num2str(ComplexToIntantVal(Q1IXC, Q1Omega, VarOOF1(itr)/100)));
    
%     Second question
%     Sine wave
    fprintf(AnsFile,',%s',num2str(VarOOG1(itr)/sqrt(2)));
    fprintf(AnsFile,',%s',num2str(VarOOG1(itr)*2/pi));
    fprintf(AnsFile,',%s',num2str(sqrt(2)));
    fprintf(AnsFile,',%s',num2str(pi/(2*sqrt(2))));
%     Half-wave rectified sine
    fprintf(AnsFile,',%s',num2str(VarOOI1(itr)/2));
    fprintf(AnsFile,',%s',num2str(VarOOI1(itr)/pi));
    fprintf(AnsFile,',%s',num2str(2));
    fprintf(AnsFile,',%s',num2str(pi/2));
%     Full-wave rectified sine
    fprintf(AnsFile,',%s',num2str(VarOOK1(itr)/sqrt(2)));
    fprintf(AnsFile,',%s',num2str(VarOOK1(itr)*2/pi));
    fprintf(AnsFile,',%s',num2str(sqrt(2)));
    fprintf(AnsFile,',%s',num2str(pi/(2*sqrt(2))));
%     Triangle wave
    fprintf(AnsFile,',%s',num2str(VarOOM1(itr)/sqrt(3)));
    fprintf(AnsFile,',%s',num2str(VarOOM1(itr)/2));
    fprintf(AnsFile,',%s',num2str(sqrt(3)));
    fprintf(AnsFile,',%s',num2str(2/sqrt(3)));
%     Sawtooth wave
    fprintf(AnsFile,',%s',num2str(VarOOO1(itr)/sqrt(3)));
    fprintf(AnsFile,',%s',num2str(VarOOO1(itr)/2));
    fprintf(AnsFile,',%s',num2str(sqrt(3)));
    fprintf(AnsFile,',%s',num2str(2/sqrt(3)));
%     Rectangular wave
    fprintf(AnsFile,',%s',num2str(VarOOQ1(itr)));
%     Pulse wave
    Q2DutyC = VarOOT1(itr)/10;
    fprintf(AnsFile,',%s',num2str(VarOOS1(itr)*sqrt(Q2DutyC)));
    fprintf(AnsFile,',%s',num2str(VarOOS1(itr)*Q2DutyC));
    fprintf(AnsFile,',%s',num2str(1/sqrt(Q2DutyC)));
    
%     Finishing the CSV line
    for itr2 = 1:(52-45)
        fprintf(AnsFile,',');
    end
    fprintf(AnsFile,'\n');
end

fclose(AnsFile);
