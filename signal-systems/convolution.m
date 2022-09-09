%Ritvik Verma
%ECE 213 Spring 2022
%Computing C1 exercise ECE 213

clear
clf

R = 10; %resistance in ohms
C = 2;  %capacitance in mF
V0 = 12;    %voltage in V
N = 8000;   %number of intervals
tau = R*C;  %tau in ms units
t0 = 0;
td = 2*tau;
tm = 8*tau;
t = linspace(t0,tm,N+1);
dr = (tm-td)/N;
dr2 = (td-t0)/N;

h = 1/tau * exp(-t/tau);

%----------analytical solutions-----------
%the piecewise analytical functions
y1 = V0*(1-exp(-t/tau));    
y2 = V0*(1-exp(-2))*(exp(-(t-2*tau)/tau));

%-----------numerical solution------------
% for i=1:N       %making a piecewise function for the numerical sol.
%     if t(i) <= (2*tau)     
%         n_s2(i) = V0-V0*exp(-t(i)/tau);
%     else     
%         n_s2(i) = V0*exp(2)*exp(-t(i)/tau) - V0*exp(-t(i)/tau);
%     end
%     
%     if n_s2(i) == max(n_s2)   %finding the time when the solution is max
%         t_n = t(i);
%     end
% end
n_s = zeros(1,N+1);
mid = (2*tau)/(8*tau) * N;
for i = 1:N
    for k=1:N
        if k>= mid - N/130
            n_s(k) = n_s(k) + h(k)*V0*dr;
%         else
%             n_s(k) = n_s(k) + h(k)*V0*dr2;
        end

    end 
end

%--------check for analytical solution-----
   
% all checks based on spec 4 in the pdf
check_1 = y1(mid)-y2(mid)      %should be close to 0
check_2 = max(n_s) - y1(mid)     %should be 0
%check_3 = t_n                      %should be equal to 2*tau i.e 40 ms


%--------plotting graphs and setting labels/title------
plot(t,n_s,'k','LineWidth',3)
hold on
plot(t,y1,':g',t,y2,':','LineWidth',2)
hold off
grid on

ax = gca; ax.FontSize = 16; 
ax.GridAlpha = 0.4;
ax.MinorGridAlpha = 0.5;
set(gca,'XMinorGrid','on');
set(gca,'YMinorGrid','on');

title({'ECE 213, Exercise C1',...
'Understanding Convolution'},'FontSize', 22)

legend('Numerical Solution','Analytical Solution till 2\tau',...
    'Analytical Solution from 2\tau')

ylabel('Voltage y(t) (V)','FontSize', 18)
xlabel('Time (ms)','FontSize', 18)

ylim([0 V0+2])
xlim([0 8*tau])
