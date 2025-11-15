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
import pandas as pd
#import numpy as np

# Read the input CSV file
input_file = 'db-q.csv'
data = pd.read_csv(input_file)
# Function to compute answers based on the input data
def compute_answers(questions):
    answers = {}
    # The answers should contain all the VarOO* columns
    for col in data.columns:
        if col not in answers and col not in ['No', 'Name']:
            answers[col] = ''
    # finding answer for the first question.
    p1 = questions['VarOOA'] + questions['VarOOC']
    p2 = questions['VarOOC'] * questions['VarOOB']
    p3 = questions['VarOOB'] + questions['VarOOA']*questions['VarOOD']
    answers['VarOOA'] = round(p1,3);
    answers['VarOOB'] = round(p2,3);
    answers['VarOOC'] = round(p3,3);
    answers['VarOOD'] = round(p2/p3, 3);
    answers['VarOOE'] = round(p1/p3 - p2/(p3*p3), 3);
    answers['VarOOF'] = round(p2/(p3*p3), 3);
    answers['VarOOG'] = round(p1/p3, 3);

    # finding answer for the second question.
    e = questions['VarOOE'];
    f = questions['VarOOF'];
    g = questions['VarOOG'];
    p1=f+g;
    p2=f*g;
    answers['VarOOH'] = round(p1, 3);
    answers['VarOOI'] = round(p2, 3);
    answers['VarOOJ'] = round(e, 3);
    answers['VarOOK'] = round(p1*p2/e, 3);
    
    # return the computed answers as a Series
    return pd.Series(answers)

# Apply the computation to each row
answers_data = data.apply(compute_answers, axis=1)
# Combine the No and Name columns with the computed answers
output_data = pd.concat([data[['No', 'Name']], answers_data], axis=1)
# Save the answers to the output CSV file
output_file = 'db-a.csv'
output_data.to_csv(output_file, index=False)