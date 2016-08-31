clc;
clear;
% copyfile('questions.csv','answers.csv')
% Qtns = csvread('questions.csv',1,2);
[No1,Name1,VarOOA1,VarOOB1,VarOOC1,VarOOD1,VarOOE1,VarOOF1,VarOOG1,VarOOH1,VarOOI1,VarOOJ1,VarOOK1,VarOOL1,VarOOM1,VarOON1,VarOOO1,VarOOP1,VarOOQ1,VarOOR1,VarOOS1,VarOOT1,VarOOU1,VarOOV1,VarOOW1,VarOOX1,VarOOY1,VarOOZ1,VarOOa1,VarOOb1,VarOOc1,VarOOd1,VarOOe1,VarOOf1,VarOOg1,VarOOh1,VarOOi1,VarOOj1,VarOOk1,VarOOl1,VarOOm1,VarOOn1,VarOOo1,VarOOp1,VarOOq1,VarOOr1,VarOOs1,VarOOt1,VarOOu1,VarOOv1,VarOOw1,VarOOx1,VarOOy1,VarOOz1] = ImportQuestions ('questions.csv', 2);
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
    Q1A = VarOOA1(itr) + 1i*VarOOB1(itr);
    Q1B = VarOOC1(itr) + 1i*VarOOD1(itr);
    Q1C = VarOOE1(itr) + 1i*VarOOF1(itr);
    fprintf(AnsFile,',%s',num2str(Q1A^3));
    fprintf(AnsFile,',%s',num2str(Q1A^2*Q1B/Q1C));
    fprintf(AnsFile,',%s',num2str(Q1A/Q1B+Q1C));
    fprintf(AnsFile,',%s',num2str(Q1A/(Q1B/Q1C+8)));
%     Second question
    Q2R = VarOOG1(itr)*VarOOH1(itr);
    fprintf(AnsFile,',%s',num2str(Q2R*(5/6)));
%     Fourth question
%     Figure 3
    Q4Omega = 2*pi*60;
    Q4R = VarOOH1(itr)*10;
    Q4XL = 1i*Q4Omega*VarOOI1(itr)/10;
    Q4XC = 1/(1i*Q4Omega*VarOOJ1(itr)*1e-5);
    Q4V = VarOOK1(itr)*10;
    Q4I = Q4V/(Q4R + Q4XL + Q4XC);
    Q4V_R = Q4I*Q4R;
    Q4V_XL = Q4I*Q4XL;
    Q4V_XC = Q4I*Q4XC;
    Q4P_R = abs(Q4V_R*Q4I);
    Q4P_XL = abs(Q4V_XL*Q4I);
    Q4P_XC = -abs(Q4V_XC*Q4I);    
%     Q4P_R = Q4I*Q4V_R;
%     Q4P_XL = Q4I*Q4V_XL;
%     Q4P_XC = Q4I*Q4V_XC;
    fprintf(AnsFile,',%s',num2str(Q4I));
    fprintf(AnsFile,',%s',num2str(Q4V_R));
    fprintf(AnsFile,',%s',num2str(Q4V_XL));
    fprintf(AnsFile,',%s',num2str(Q4V_XC));
    fprintf(AnsFile,',%s',num2str(Q4P_R));
    fprintf(AnsFile,',%s',num2str(Q4P_XL));
    fprintf(AnsFile,',%s',num2str(Q4P_XC));
%     Figure 4
    Q4Z1 = 1/(1/Q4R + 1/Q4XL + 1/Q4XC);
    Q4Z = Q4R + Q4Z1;
    Q4I = Q4V/Q4Z;
    Q4V_R1 = Q4I*Q4R;
    Q4V_R2 = Q4I*Q4Z1;
    Q4I_R2 = Q4V_R2/Q4R;
    Q4I_XL = Q4V_R2/Q4XL;
    Q4I_XC = Q4V_R2/Q4XC;
    Q4P_R1 = abs(Q4I*Q4V_R1);
    Q4P_R2 = abs(Q4I_R2*Q4V_R2);
    Q4P_XL = abs(Q4I_XL*Q4V_R2);
    Q4P_XC = -abs(Q4I_XC*Q4V_R2);
    fprintf(AnsFile,',%s',num2str(Q4V_R1));
    fprintf(AnsFile,',%s',num2str(Q4V_R2));
    fprintf(AnsFile,',%s',num2str(Q4I));
    fprintf(AnsFile,',%s',num2str(Q4I_R2));
    fprintf(AnsFile,',%s',num2str(Q4I_XC));
    fprintf(AnsFile,',%s',num2str(Q4I_XL));
    fprintf(AnsFile,',%s',num2str(Q4P_R1));
    fprintf(AnsFile,',%s',num2str(Q4P_R2));
    fprintf(AnsFile,',%s',num2str(Q4P_XL));
    fprintf(AnsFile,',%s',num2str(Q4P_XC));
    

%     Q1A = Qtns(itr,1) + 1i*Qtns(itr,2);
%     Q1B = Qtns(itr,3) + 1i*Qtns(itr,4);
%     Q1C = Qtns(itr,5) + 1i*Qtns(itr,6);
%     Q1AnsA = Q1A^3;
%     Q1AnsB = Q1A^2*Q1B/(Q1C);
%     Q1AnsC = Q1A/Q1B + Q1C;
%     Q1AnsD = Q1A/(Q1B/Q1C+Qtns(itr,2));
%     
%     Ans(itr,1) = real(Q1AnsA);
%     Ans(itr,2) = imag(Q1AnsA);
%     Ans(itr,3) = real(Q1AnsB);
%     Ans(itr,4) = imag(Q1AnsB);
%     Ans(itr,5) = real(Q1AnsC);
%     Ans(itr,6) = imag(Q1AnsC);
%     Ans(itr,7) = real(Q1AnsD);
%     Ans(itr,8) = imag(Q1AnsD);
%     
%     Q2R = Qtns(itr,7)*Qtns(itr,8);
%     Ans(itr,9) = Q2R*(5/6);
%     
%     Q4Omega = 2*pi*60;
%     Q4R = Qtns(itr,8)*10;
%     Q4XL = 1i*Q4Omega*Qtns(itr,9)/10;
%     Q4XC = 1/(1i*Q4Omega*Qtns(itr,10)*1e-6);
%     Q4V = Qtns(itr,10)*10;
%     Ans(itr,8) = (Q1AnsD);
    for itr2 = 1:(52-21)
        fprintf(AnsFile,',');
    end
    fprintf(AnsFile,'\n');
end

fclose(AnsFile);
