%Ritvik Verma
%ECE 202 Fall 2021
%M8 exercise 
%computing partial fraction expansion using matrices and designing a check

clear 
clf

%-------------Calculation---------------

A = [1 1 1 ; -5 -4 -3 ; 6 3 2];
B = [4; 5; 6];
c = inv(A)*B

%-----------------Check------------------
N = input('Enter number of points: ');  %number of points on the graph
x = linspace(-4,4,N);

D1 = x-1;
D2 = x-2;
D3 = x-3;

R = (B(1)*x.^2 + B(2)*x + B(3))./ (D1.*D2.*D3);
R1 = c(1)./D1;
R2 = c(2)./D2;
R3 = c(3)./D3;

check = sum(abs(R-(R1+R2+R3)))

%When there are 5 points on the graph this means that there are 5 evenly
%distributed values along -4 and 4 on the x axis. For the case of 5 points
%the values along x-axis are -4,-2,0,2,4. Notice one of the values is 2
%which is also a root of the denominator of R(x). This would mean that the
%denominator becomes zero and the solution of R(x) thus does not exist.
%This is the reason why for 5 intervals the difference is NaN. Whenever the
%interval contains roots of the denominator, in this case which is 1,2 or
%3 solution for R(x) will not exist. Thus we will not get a proper check 
% for this value

%When N = 6, the values on the x-axis are -4, -2.4, -0.8, 0, 0.8, 2.4, 4
%none of these values are roots of the denominator of the main function
%which is why the function computes the values successfuly, and thats why
%the check works. For any N value where there are no roots on the x-axis
%this check works and produces a really small value indicating that there
%is very little deviation between the actual expression and the partial
%fraction expression. This means that the check is succesful because of
%really small deviation when N = 6. At the values 1, 2, 3 in the array the
%check will fail because the denominator becomes undefined, else the check
%remains working.