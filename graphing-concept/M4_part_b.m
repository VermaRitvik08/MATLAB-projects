%Ritvik Verma
%ECE 202 Fall 2021
%M4 exercise 


clear 
clf 

% ----- set up arrays for x and g -----
x = linspace(-5, 5, 400);
g = 4*cos(3*(x-2));

% ----- plotting the figure -----
plot(x, g, 'r', 'LineWidth', 3)

% ----- setting title, axes titles, and axis limits -----
ax = gca; ax.FontSize = 12;
ylim([-6 6])
xlabel('x (m)', 'FontSize', 15)
ylabel('g(x)', 'FontSize', 15)
title('ECE	202, Exercise M4, part(b), Shifted sinusoid', 'FontSize', 18)
grid on
