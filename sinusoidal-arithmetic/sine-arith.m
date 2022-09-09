%Ritvik Verma
%M5
%Showing that the product of two sinusoids can also be written as the sum
%of two sinusoids as well
%plotting the functions on the same graph for comparison
%source for equation: http://hyperphysics.phy-astr.gsu.edu/hbase/trid.html
%identity for product to sum is cos(A)cos(B) = (cos(A+B)-cos(A-B))/2

clear 
clf
%------------forming equations------------
tms = linspace(-100, 100, 501); %time given in ms for the plot
t = tms/1000;       %defining time in s, since it is used in all functions
k = 15;           %factor for clarity in equations
A = 80*t + 1.2;     %angle for the first sinusoid
B = 120*t - 1.8;    %angle for the second sinusoid

ft = k*cos(A).*cos(B);

s1 = k/2 * cos(A+B);    %first term of the sum of sinusoids
s2 = k/2 * cos(A-B);    %second term of the sum of sinusoids
%array check to verify that the difference of sum and product is approx. 0
check_ft = (s1 + s2) - ft;

%-------labeling axes and setting font sizes------
plot(tms,ft, tms, s1, tms, s2, tms, check_ft, "LineWidth", 2)
ax = gca; ax.FontSize = 12;
xlabel('Time (ms)', 'FontSize', 15)
ylabel('f(t)', 'FontSize', 15)
legend("f = product","s1 = sinusoid 1", "s2 = sinusoid 2",...
    "checking array = (s1+s2) - ft should be 0", 'FontSize', 15)
ylim([-20 30])
title({'Showing that Product of Two Sinusoids can be written',...
'as the Sum of Two Sinusoids',...
'Difference of sum and product should be 0'},'FontSize', 18)
grid on
ax.GridAlpha = 0.5;
%---------check for all values in the array---------
%checking the difference between the product and sum of sinusoids
%should be a very small value close to 0
check_array = sum(abs(check_ft))

%The abs function makes sure that all the elements in the check array
%are in positive sign, this way when summing no values will cancel out
%This might have happened if only sum function was used
%The current method will give  a values close to zero hence verifying
%the theorem.
