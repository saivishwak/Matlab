%Gauss Jacobian Method for System of Linear Eqations 
clc
% Equations Variables
a_11 = 6;
a_12 = 1;
a_13 = 1;
a_21 = 1;
a_22 = 4;
a_23 = -1;
a_31 = 1;
a_32 = -1;
a_33 = 5;
b_1 = 20;
b_2 = 6;
b_3 = 7;

%Intial gess
x_11 = 0;
x_21 = 0;
x_31 = 0;

% Matries
coefficient_matrix_a = [0,a_12/a_11,a_13/a_11;a_21/a_22,0,a_23/a_22;a_31/a_33,a_32/a_33,0];
coefficient_matrix_b = [b_1/a_11;b_2/a_22;b_3/a_33];
for i=1:10
vaule = coefficient_matrix_b - coefficient_matrix_a*[x_1(i);x_2(i);x_3(i)];
end



