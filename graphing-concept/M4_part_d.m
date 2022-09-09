%Ritvik Verma
%ECE 202 Fall 2021
%M4 exercise 

clear 
clf

% ----- set up arrays for t and t2 -----     
%given in s
tms = linspace(0, 40, 400);  t = tms/1000;   
%tms is given in ms         %converting the array from ms to s units

v1 = 16*exp(-800*t) - 4*exp(-200*t);
v2 = exp(-500*t).*(12 - 6000*t);
v3 = exp(-120*t).*(12*cos(450*t) - 5*sin(450*t));

% ----- plotting the figure -----
plot(tms, v1,'r',tms, v2,'g',tms, v3,'b','LineWidth', 3) 
%plotting so that x axis is in ms

legend('overdamped','critically damped','underdamped','FontSize',15) 
%adding description of every plot line


% ----- setting title, axes titles, and axis limits and fontsize-----
ylim([-10 15])      %suitable y limits so that the plots are visible 
ax = gca; ax.FontSize = 12; 
xlabel('time (ms)', 'FontSize', 15)
ylabel('Voltage (V)', 'FontSize', 15)
title('ECE	202, Exercise M4, part(d), Three dampings for parallel RLC',...
'FontSize', 18)
grid on