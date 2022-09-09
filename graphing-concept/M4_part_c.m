%Ritvik Verma
%ECE 202 Fall 2021
%M4 exercise 

clear 
clf

% ----- set up arrays for x and P -----
x = linspace(0, 10, 400);
P = exp((-1*(x-5).^2)/4)/(2*pi^0.5);

% ----- plotting the figure -----
plot(x, P,':','LineWidth', 3)

% ----- setting title, axes titles, and axis limits and fontsize-----
ax = gca; ax.FontSize = 16; 
xlabel('x (m)', 'FontSize', 20)
ylabel('Probability Density (m^{-1})', 'FontSize', 20)
title('ECE	202, Exercise M4, part(c), Normalized Gaussian',... 
'FontSize', 24)
grid on
