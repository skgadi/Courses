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
    syms s
    Q1R = VarOOA1(itr)*10;
    Q1L = VarOOB1(itr)*1e-2;
    Q1C = VarOOC1(itr)*1e-6;
    Q1XL = s*Q1L;
    Q1XC = 1/(s*Q1C);
    Q1Z = Q1R + Q1XL + Q1XC;
    Q1V = 1/s;
    Q1I = Q1V/Q1Z;
    Q1i = ilaplace(Q1I);
    Q1VR = ilaplace(Q1I*Q1R);
    Q1VL = ilaplace(Q1I*Q1XL);
    Q1VC = ilaplace(Q1I*Q1XC);
    Q1Str = sprintf('AnsImage%d',itr);
    
    t= 0:0.0001:0.015;
    f = figure;
    a = axes;
    set(a,'TickLabelInterpreter', 'tex');
    plot(t,eval(Q1VR), t,eval(Q1VL), t,eval(Q1VC), 'linewidth', 2)
    xlabel ('Time', 'Interpreter', 'latex')
    ylabel ('Voltage (V)', 'Interpreter', 'latex')
    yyaxis right
    plot(t,eval(Q1i), 'linewidth', 2)
    ylabel ('Current (A)', 'Interpreter', 'latex')
    legend({'$V_R$', '$V_L$', '$V_C$', '$I$'},'Interpreter','latex')
    saveas(f,['../images/answers/', Q1Str],'epsc')
    fprintf(AnsFile,',%s',Q1Str);
    close (f)

%     Question 2
    Q2RFreq = 1/(2*pi*sqrt(Q1L*Q1C));
    fprintf(AnsFile,',%s',num2str(Q2RFreq));
%     Finishing the CSV line
    for itr2 = 1:(52-2)
        fprintf(AnsFile,',');
    end
    fprintf(AnsFile,'\n');
end

fclose(AnsFile);
