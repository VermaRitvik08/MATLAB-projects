%Ritvik Verma
%ECE 213 Spring 2022
%Computing C2 exercise 
%Using Laplace to find the impulse response

clear
clf

%----------Defining time array and variables-------------- 

tmin = 0;   %units in ms
tmax = 120; %units in ms
N = 2000;   % intervals

tms = linspace(tmin, tmax, N+1);    % time array in ms
t = tms/1000;       % time array is s

R = input('Enter value for R in ohms: ');
LmH = input('Enter value for L in mH: ');
CuF = input('Enter value for C in uF: ');

L = LmH*(10^-3);  %convert L and C into milli and micro units
C = CuF*(10^-6);
%defining variables that are provided in guiding document
a = R/(2*L);    
w0 = (1/(L*C))^0.5;
s1 = a + sqrt(a^2 - w0^2);  %finding roots of denominator
s2 = a - sqrt(a^2 - w0^2);

  

%------------Deriving equations for all damping cases------------

if a>w0         %overdamped case 
   r = [-s1 -s2];
   M = [1 1; r(1) r(2)];
   rhs = [2*a; 0];
   z = M\rhs;
   h1 = z(1)*exp(r(2)*t);
   h2 = z(2)*exp(r(1)*t);
   h1t = sprintf('h_1(t) = %ge^{%gt}',z(1),r(2));
   h2t = sprintf('h_2(t) = %ge^{%gt}',z(2),r(1));
   fin = 'overdamped function';
elseif a<w0         %underdamped case
    w = (w0^2-a^2)^0.5;
    h1_c = 2*a;
    h2_c = -(2*a^2)/w;
    h1 = h1_c * exp(-a*t).*cos(w*t);
    h2 = h2_c * exp(-a*t).*sin(w*t);
    h1t = sprintf('h_1(t) = %ge^{%gt}\\cos(%gt)',h1_c,-a,w);
    h2t = sprintf(' h_2(t) = %ge^{%gt}\\sin(%gt) ',h2_c,-a,w);
    fin = 'underdamped function';
    
elseif a==w0        %critically damped case
    h1_c = 2*a;
    h2_c = 2*(-a^2);
    h1 = h1_c*exp(-a*t);
    h2 = h2_c*exp(-a*t).*t;
    h1t = sprintf('h_1(t) = %ge^{%gt}',h1_c,-a);
    h2t = sprintf('h_2(t) = %gte^{%gt}',h2_c,-a);
    fin = 'critically damped function';
end
ht = h1+h2;
htt = append('h(t) = h_1(t) + h_2(t)');
%--------------Plotting the graph and formatting---------------
plot(tms,h1,':',tms,h2,':',tms,ht,'-','LineWidth',2);
grid on
set(gca,'XMinorGrid','on');
set(gca,'YMinorGrid','on');
ax = gca; ax.FontSize = 16; 
ax.GridAlpha = 0.4;
ax.MinorGridAlpha = 0.5;

s1 = ['for R = ',num2str(R),'$\Omega$, L = ',num2str(LmH)...
    'mH, C = ',num2str(CuF),'$\mu$F'];

title({'ECE 213, Exercise C2',...
'Using Laplace to find the impulse response of a',fin,...
s1},'FontSize', 22,'interpreter','latex')

legend(['$$' h1t '$$'],['$$' h2t '$$'],['$$' htt '$$'],'Interpreter','latex');
ylabel('Impulse response h(t) (ms^{-1})','FontSize', 18)
xlabel('Time (ms)','FontSize', 18)


