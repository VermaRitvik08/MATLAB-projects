%Ritvik Verma
%ECE 202 Fall 2021
%M7 exercise 
%Circuit with a switch, resistor and inductor 

clear
clf

V0 = 10;    %units in Volts
R = 2;      %units in Ohms
L = 50;     %units in mH
tau = L/R;  %units in ms

tmin = 0; %units in ms 
tmax = 10*tau;  %units in ms
N = 400;    %number of intervals 
t = linspace(tmin,tmax,N+1); %units of t are in ms
dt = (tmax-tmin)/(N+1);     %units are in ms

i_f = V0/R;     %units in A
i = i_f * (1-exp(-t/tau));  %units of current are in A
v = V0*exp(-t/tau);     %units of voltage are in V
p = v.*i;       %power absorbed units given in W

% when time is very high in i(t), this means that the expression
% exp(-t/tau)is very small value close to 0, this simplifies the expression
% to V0/R * (1-0) which is V0/R. Since we already have the values of V0 and
% R given we know that current after long time passed is 10/2 = 5 A


w_f = 0.5*L*i_f^2   %units in mJ
w_abs = sum(p)*dt   %units in mJ
dw = w_abs-w_f      %difference in power units in mJ

percentage_error = dw/w_f * 100

%------------Plotting and labeling--------------

ax = gca; 
subplot(3,1,1)
plot(t,i, 'r' ,'LineWidth', 2)
ylabel('Current (A)','FontSize', 18)
str1 = sprintf('i(t) = %u \\cdot (1-e^{-t/%u})',i_f, tau);
text(150, 2, ['$$' str1 '$$'], 'FontSize',...
    18, 'Interpreter', 'latex')
set(gca,'FontSize',16)
grid on

subplot(3,1,2)
plot(t,v, 'b' ,'LineWidth', 2)
ylabel('Voltage (V)','FontSize', 18)
str2 = sprintf('v(t) = %u \\cdot e^{-t/%u}',V0, tau);
text(150, 8, ['$$' str2 '$$'], 'FontSize', 18,...
    'Interpreter', 'latex')
set(gca,'FontSize',16)
grid on

subplot(3,1,3)
plot(t,p, 'g' ,'LineWidth', 2)
ylabel('Power Absorbed(W)','FontSize', 18)
xlabel('Time (ms)','FontSize', 18)
text(150, 12, '$$ p(t) = i(t) \cdot v(t) $$', 'FontSize', 18,...
    'Interpreter', 'latex')
set(gca,'FontSize',16)

s1 = sprintf('for a charging inductor (V_0 = %uV, R = %u\\Omega, L = %umH)',...
    V0, R, L);
sgtitle({'ECE 202, M7: Current, Voltage, and Power absorbed',...
    s1},'FontSize', 24)
grid on
set(gca,'FontSize',16)