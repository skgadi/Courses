'''
The objective is to generate answers for a set of questions based on student data.
The file `db-q.csv` contains a list of students and numbers associated with the questions.
Each line in `db-q.csv` follows the format:
No,Name,VarOOA,VarOOB,VarOOC, ...,VarOOZ, VarOOa,VarOOb,...,VarOOz
The No, and Name columns are identifiers, while the VarOO* columns contain numerical values.
The task is to read the `db-q.csv` file, process the data, and generate answers for each student based on their associated numbers.

The answers should be stored in a `db-a.csv` file with the following format:
No,Name,VarOOA,VarOOB,VarOOC, ...,VarOOZ, VarOOa,VarOOb,...,VarOOz
The answers for each VarOO* column should be computed as per the specific logic defined for each question.
'''

# Import necessary libraries
import cmath

import pandas as pd
#import numpy as np

def round3(x):
    if isinstance(x, complex):
        return complex(round(x.real, 3), round(x.imag, 3))
    return round(x, 3)

# Read the input CSV file
input_file = 'db-q.csv'
data = pd.read_csv(input_file)
# Function to compute answers based on the input data
def compute_answers(questions):
    answers = {}
    # First 6 shows which questions are asked, So they should be same as the input questions.
    for i in range(6):
        col_name = f'VarOO{chr(65+i)}'
        answers[col_name] = questions[col_name]
    # The answers should contain all the VarOO* columns
    for col in data.columns:
        if col not in answers and col not in ['No', 'Name']:
            answers[col] = ''
    # finding answer for the first question.
    R = questions['VarOOG'];
    V = questions['VarOOH'];
    answers['VarOOG'] = round3((V/R)*(15/27));
    answers['VarOOH'] = round3(V/(R*9));

    # finding answer for the second question.
    R = questions['VarOOI'];
    V = questions['VarOOJ'];
    answers['VarOOI'] = round3((12*R)/15);
    answers['VarOOJ'] = round3((V**2)/(40*R));

    # finding answer for the third question.
    R = questions['VarOOK'];
    V = questions['VarOOL'];
    answers['VarOOK'] = round3(V*2.96);

    # finding answer for the fourth question.
    V = questions['VarOOM'];
    R = questions['VarOON'];
    V1 = cmath.rect(1, 120*cmath.pi/180);
    V2 = cmath.rect(1, -120*cmath.pi/180);
    Vo = V*(1/4+V1/2+V2)/(1/4+1/2+1+1+11/4);
    answers['VarOOL'] = round3(4*R/11);
    answers['VarOOM'] = round3((abs(Vo))**2/(4*R/11));

    # finding answer for the fifth question.
    C = questions['VarOOO'];
    V = questions['VarOOP'];
    VbyC = V/C;
    answers['VarOON'] = round3(VbyC*(1+1j));
    answers['VarOOO'] = round3((answers['VarOON']*V).real);
    answers['VarOOP'] = round3(-(VbyC*V*(-15/13+16j/13)).real);

    # finding answer for the sixth question.
    V = questions['VarOOQ'];
    R = questions['VarOOR'];
    I = (V/R)*(cmath.sqrt(3)/(1+2j));
    answers['VarOOQ'] = round3(I);
    S = 3*V*I.conjugate();
    answers['VarOOR'] = round3(S.real);
    answers['VarOOS'] = round3(S.imag);
    answers['VarOOT'] = round3(abs(S));

    # finding answer for the seventh question.
    C = questions['VarOOS'];
    V = questions['VarOOT'];
    Vph = V/cmath.sqrt(3);
    I = (V/C)*(1/cmath.sqrt(3))*(1/(2-1j));
    answers['VarOOU'] = round3(I);
    S= 3*Vph*I.conjugate();
    answers['VarOOV'] = round3(S.real);
    answers['VarOOW'] = round3(-S.imag);
    answers['VarOOX'] = round3(abs(S));

    # finding answer for the eighth question.
    X = questions['VarOOU'];
    Y = questions['VarOOV'];
    answers['VarOOY'] = round3( (Y + cmath.sqrt(Y**2 + 4*X*Y)).real/2 );

    
    
    # return the computed answers as a Series
    return pd.Series(answers)

# Apply the computation to each row
answers_data = data.apply(compute_answers, axis=1)
# Combine the No and Name columns with the computed answers
output_data = pd.concat([data[['No', 'Name']], answers_data], axis=1)
# Save the answers to the output CSV file
output_file = 'db-a.csv'
output_data.to_csv(output_file, index=False)