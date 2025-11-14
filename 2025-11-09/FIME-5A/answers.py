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
import numpy as np
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
    R1 = questions['VarOOC']
    R2 = questions['VarOOD']
    R3 = questions['VarOOG']
    R4 = questions['VarOOE']
    V1 = questions['VarOOA']
    V2 = questions['VarOOB']
    V3 = questions['VarOOF']
    # Make resistance matrix
    R = np.array([[R1 + R2, -R1, -R2],[-R1, R1 + R3 + R4, -R4],[-R2, -R4, R2 + R4]]);
    # Make voltage matrix
    V = np.array([-V1-V2, V2, -V3]);
    # Solve for currents
    I = np.linalg.solve(R, V)
    # Current through resistance R4 is I[1]-I[2]
    I_R4 = I[1] - I[2]
    # Power dissipated in R4
    P_R4 = I_R4**2 * R4
    # Round the answer to 3 decimal places
    answers['VarOOA'] = round(P_R4, 3)
    # finding answer for the second question.
    I = questions['VarOOH']  # Current in Amperes
    V_R = questions['VarOOI']  # Voltage across the resistor in Volts
    V_L = questions['VarOOJ']  # Voltage across the inductor in Volts
    V_RL = questions['VarOOK']  # Voltage across the resistor-inductor combination in Volts
    V_C = questions['VarOOL']  # Voltage across the capacitor in Volts
    R = V_R / I  # Resistance in Ohms
    Z_L = V_L / I  # Inductive reactance in Ohms
    Z_RL = V_RL / I  # Impedance of resistor-inductor combination
    X_C = V_C / I  # Capacitive reactance in Ohms
    # calculate value of X_L and R_L
    X_L = (Z_RL**2 - Z_L**2 - R**2) / (2 * R)
    R_L = np.sqrt(Z_L**2 - X_L**2)
    #print(R, R_L, X_L, X_C)
    # Power consumed in the circuit
    P = I**2 * (R + R_L)
    answers['VarOOB'] = round(P, 3)
    # Total impedance of the circuit
    Z_total = np.sqrt((R + R_L)**2 + (X_L - X_C)**2)
    # Applied voltage
    V_applied = I * Z_total
    answers['VarOOC'] = round(V_applied, 3)
    # finding answer for the third question.
    V_applied = questions['VarOOM']  # Applied voltage in Volts
    I_toal = questions['VarOON']  # Total current in Amperes
    P_total = questions['VarOOO']  # Total power in Watts
    I_1 = I_toal / 2  # Current through first branch
    P_1 = P_total / 2  # Power through first branch
    R_1 = P_1 / (I_1**2)  # Resistance of first branch
    answers['VarOOD'] = round(R_1, 3)
    # return the computed answers as a Series
    return pd.Series(answers)

# Apply the computation to each row
answers_data = data.apply(compute_answers, axis=1)
# Combine the No and Name columns with the computed answers
output_data = pd.concat([data[['No', 'Name']], answers_data], axis=1)
# Save the answers to the output CSV file
output_file = 'db-a.csv'
output_data.to_csv(output_file, index=False)