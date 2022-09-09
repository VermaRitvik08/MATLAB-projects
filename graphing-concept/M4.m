%Ritvik Verma
%ECE 202 Fall 2021
%M4 exercise 

clear
clf 

% ----- set up arrays for t and f -----
t = linspace(0, 6, 402);   % time, in s
f = 1 + t/2 - (t.^2)/3;    % truncated series

% ----- plotting the figure -----
plot(t, f, 'b', 'LineWidth', 3)   %line width is 3, and the color is blue

%setting the xlabel and ylabel titles and fontsizes
ax = gca; ax.FontSize = 12; 
xlabel('Time (s)', 'FontSize', 15)
ylabel("f(t)", 'FontSize', 15)
title('ECE	202, Exercise M4, part(a), Truncated Power Series',... 
'FontSize', 18)
grid on