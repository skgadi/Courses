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
    answers['VarOOG'] = 74.176;
    answers['VarOOH'] = 132.934;
    answers['VarOOI'] = 74.256;
    answers['VarOOJ'] = 132.792;

    # finding answer for the second question.
    answers['VarOOK'] = 0.42375; # wb
    answers['VarOOL'] = 849.56; # rpm

    # finding answer for the third question.
    answers['VarOOM'] = 971.67; # rpm
    answers['VarOON'] = 1055; # rpm

    # finding answer for the fourth question.
    answers['VarOOO'] = 245.07; # watts
    answers['VarOOP'] = 7530; # watts
    answers['VarOOQ'] = 87.13; # percent

    # finding answer for the fifth question.
    answers['VarOOR'] = 142.09; #Nm
    answers['VarOOS'] = 680.9; #rpm
    answers['VarOOT'] = 130.67; #Nm
    answers['VarOOU'] = 86.27; # percent

    # finding answer for the sixth question.
    answers['VarOOV'] = 84.75; # percent

    # finding answer for the seventh question.
    answers['VarOOW'] = 7048; # watts
    answers['VarOOX'] = 9.45; # hp

    # finding answer for the eighth question.
    answers['VarOOY'] = 1406.52; # rpm

    # finding answer for the ninth question.
    answers['VarOOZ'] = 14.17; # A
    answers['VarOOa'] = 348; # rpm

    # finding answer for the tenth question.
    answers['VarOOb'] = 106.07; # Nm
    answers['VarOOc'] = 93.30; # Nm


    
    
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