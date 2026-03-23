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
import math
#import numpy as np

'''
def round3(x):
    if isinstance(x, complex):
        return complex(round(x.real, 3), round(x.imag, 3))
    return round(x, 3)
'''

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
    answers['VarOOG'] = ((V/R)*(15/27));
    answers['VarOOH'] = (V/(R*9));

    # finding answer for the second question.
    R = questions['VarOOI'];
    V = questions['VarOOJ'];
    answers['VarOOI'] = ((12*R)/15);
    answers['VarOOJ'] = ((V**2)/(40*R));

    # finding answer for the third question.
    R = questions['VarOOK'];
    V = questions['VarOOL'];
    answers['VarOOK'] = (V*2.96);

    # finding answer for the fourth question.
    V = questions['VarOOM'];
    R = questions['VarOON'];
    V1 = cmath.rect(1, 120*cmath.pi/180);
    V2 = cmath.rect(1, -120*cmath.pi/180);
    Vo = V*(1/4+V1/2+V2)/(1/4+1/2+1+1+11/4);
    answers['VarOOL'] = (4*R/11);
    answers['VarOOM'] = ((abs(Vo))**2/(4*R/11));

    # finding answer for the fifth question.
    C = questions['VarOOO'];
    V = questions['VarOOP'];
    VbyC = V/C;
    answers['VarOON'] = (VbyC*(1+1j));
    answers['VarOOO'] = ((answers['VarOON']*V).real);
    answers['VarOOP'] = (-(VbyC*V*(-15/13+16j/13)).real);

    # finding answer for the sixth question.
    V = questions['VarOOQ'];
    R = questions['VarOOR'];
    I = (V/R)*(cmath.sqrt(3)/(1+2j));
    answers['VarOOQ'] = (I);
    S = 3*V*I.conjugate();
    answers['VarOOR'] = (S.real);
    answers['VarOOS'] = (S.imag);
    answers['VarOOT'] = (abs(S));

    # finding answer for the seventh question.
    C = questions['VarOOS'];
    V = questions['VarOOT'];
    Vph = V/cmath.sqrt(3);
    I = (V/C)*(1/cmath.sqrt(3))*(1/(2-1j));
    answers['VarOOU'] = (I);
    S= 3*Vph*I.conjugate();
    answers['VarOOV'] = (S.real);
    answers['VarOOW'] = (-S.imag);
    answers['VarOOX'] = (abs(S));

    # finding answer for the eighth question.
    X = questions['VarOOU'];
    Y = questions['VarOOV'];
    answers['VarOOY'] = ( (Y + cmath.sqrt(Y**2 + 4*X*Y)).real/2 );

    # finding answer for the ninth question.
    F = questions['VarOOW'];
    R = questions['VarOOX'];
    Q = questions['VarOOY'];
    omega = 2*cmath.pi*F;
    C = (1/(omega*Q*R));
    L = (R*Q/omega);
    answers['VarOOZ'] = C;
    answers['VarOOa'] = L;
    d = math.sqrt((C*R)**2+4*L*C)/(2*L*C)/(2*cmath.pi); # discriminate
    b = C*R/(2*L*C)/(2*cmath.pi);
    answers['VarOOb'] = d - b;
    answers['VarOOc'] = d + b;

    # finding answer for the tenth question.
    R = questions['VarOOZ'];
    L = questions['VarOOa'];
    C = questions['VarOOc'];
    f1 = questions['VarOOd'];
    f2 = questions['VarOOe'];
    omega0 = 1/math.sqrt(L*C);
    answers['VarOOd'] = omega0/(2*cmath.pi);
    omega1 = 2*cmath.pi*f1;
    omega2 = 2*cmath.pi*f2;
    XL1 = omega1*L;
    XL2 = omega2*L;
    XC1 = 1/(omega1*C);
    XC2 = 1/(omega2*C);
    Z1 = complex(R, XL1 - XC1);
    Z2 = complex(R, XL2 - XC2);
    answers['VarOOe'] = 127/Z1;
    answers['VarOOf'] = math.cos(cmath.phase(Z1));
    answers['VarOOg'] = 127/Z2;
    answers['VarOOh'] = math.cos(cmath.phase(Z2));


    
    
    # return the computed answers as a Series
    return pd.Series(answers)





import pandas as pd
import math

def to_engineering_latex(x, precision=3):
    """
    Converts numbers to LaTeX engineering notation.
    - Exponents are multiples of 3.
    - Complex numbers share an exponent: (real + jimag) * 10^exp.
    - Rounds to 'precision' decimal places.
    - Removes trailing zeros.
    """
    if pd.isna(x):
        return x

    def format_num(n):
        # Round to the specific number of decimals first
        rounded = f"{n:.{precision}f}"
        # Strip trailing zeros and then the trailing dot if it exists
        cleaned = rounded.rstrip('0').rstrip('.')
        # Catch cases where -0.000 might result from rounding
        if cleaned == "" or cleaned == "-0":
            return "0"
        return cleaned

    if isinstance(x, complex):
        mag = abs(x)
        if mag == 0:
            return "$0$"
            
        exponent = math.floor(math.log10(mag))
        eng_exponent = int((exponent // 3) * 3)
        scale = 10 ** -eng_exponent
        
        r_str = format_num(x.real * scale)
        i_val = x.imag * scale
        i_str = format_num(abs(i_val))
        
        sign = "+" if i_val >= 0 else "-"
        base_str = f"({r_str}{sign}j{i_str})"
        
        if eng_exponent == 0:
            return f"${base_str}$"
        else:
            return f"${base_str} \\times 10^{{{eng_exponent}}}$"

    elif isinstance(x, (int, float)):
        if x == 0:
            return "$0$"
            
        mag = abs(x)
        exponent = math.floor(math.log10(mag))
        eng_exponent = int((exponent // 3) * 3)
        scale = 10 ** -eng_exponent
        
        val_str = format_num(x * scale)
        
        if eng_exponent == 0:
            return f"${val_str}$"
        else:
            return f"${val_str} \\times 10^{{{eng_exponent}}}$"
            
    return x


# Assuming `data` and `compute_answers` are defined earlier in your script:
# Apply the computation to each row
answers_data = data.apply(compute_answers, axis=1)

# Combine the No and Name columns with the computed answers
output_data = pd.concat([data[['No', 'Name']], answers_data], axis=1)

# Copy the dataframe to apply the LaTeX formatting
output_data_latex = output_data.copy()

# Apply the formatting function to all columns except 'No' and 'Name'
for col in output_data_latex.columns:
    if col not in output_data_latex.columns[:8]:
        output_data_latex[col] = output_data_latex[col].apply(to_engineering_latex)

# Save the answers to the output CSV file
output_file = 'db-a.csv'
output_data_latex.to_csv(output_file, index=False)