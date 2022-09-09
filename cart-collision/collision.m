%Ritvik Verma
%ECE 202 Fall 2021
%M3 exercise 

clear

%--------given--------

%three carts are travelling in a straight line and collide elastically 
%the carts are labelled starting from the left to right
%the positive sign means positive velocity and vice-versa

m = [240 60 300];
%mass of carts given in grams (g)
vi = [36 9 -45];
%velocity of carts given in cm/s
%--------calculations---------
pi = sum(m .* vi);    %initial momentum of system given in g*cm/s
Ei = sum(0.5 * m .* vi.^2);    %initial energy of system in erg

%adding masses together to form simpler equations later on
m12 = m(1)+m(2);
m23 = m(2)+m(3);

%--------collision between cart 2 and cart 3--------

vA = [vi(1) 0 0];
%since only cart 2 and 3 collide the velocity of cart 1 remains the same

%final velocities of carts after the collision
vA(2) = ((m(2)-m(3))*vi(2) + 2*m(3)*vi(3)) / m23;
vA(3) = ((m(3)-m(2))*vi(3) + 2*m(2)*vi(2)) / m23

%the difference should be 0, so that momentum is conserved
dP_A = sum(m .* vA) - pi       %momentum of system given in g*cm/s
%the difference should be 0, so that energy is conserved
dE_A = sum(0.5 * m .* vA.^2) - Ei    %energy of system in erg

%check if there is another collision in the system
if vA(3) >= vA(2) && vA(1) <= vA(2)
    disp("There are no more collisions")
else
    disp("There's another collision")
end

%--------collision between cart 1 and cart 2--------

vB = [0 0 vA(3)];
%final velocities of carts after the collision
vB(1) = ((m(1)-m(2))*vA(1) + 2*m(2)*vA(2)) / m12;
vB(2) = ((m(2)-m(1))*vA(2) + 2*m(1)*vA(1)) / m12

%the difference should be 0, so that momentum is conserved
dP_B = sum(m .* vB) - pi      %momentum of system given in g*cm/s
%the difference should be 0, so that energy is conserved
dE_B = sum(0.5 * m .* vB.^2) - Ei    %energy of system in erg

%check if there is another collision in the system
if vB(3) >= vB(2) && vB(1) <= vB(2)
    disp("There are no more collisions")
else
    disp("There's another collision")
end

%--------collision between cart 2 and cart 3--------

vC = [vB(1) 0 0];
%final velocities of carts after the collision
vC(2) = ((m(2)-m(3))*vB(2) + 2*m(3)*vB(3)) / m23;
vC(3) = ((m(3)-m(2))*vB(3) + 2*m(2)*vB(2)) / m23

%the difference should be 0, so that momentum is conserved
dP_C = sum(m .* vC) - pi     %momentum of system given in g*cm/s
%the difference should be 0, so that energy is conserved
dE_C = sum(0.5 * m .* vC.^2) - Ei    %energy of system in erg

%check if there is another collision in the system
if vC(3) >= vC(2) && vC(1) <= vC(2)
    disp("There are no more collisions")
else
    disp("There's another collision")
end

%--------collision between cart 1 and cart 2--------

vD = [0 0 vC(3)];
%final velocities of carts after the collision
vD(1) = ((m(1)-m(2))*vC(1) + 2*m(2)*vC(2)) / m12;
vD(2) = ((m(2)-m(1))*vC(2) + 2*m(1)*vC(1)) / m12

%the difference should be 0, so that momentum is conserved
dP_D = sum(m .* vD) - pi     %momentum of system given in g*cm/s
%the difference should be 0, so that energy is conserved
dE_D = sum(0.5 * m .* vD.^2) - Ei    %energy of system in erg

%check if there is another collision in the system
if vD(3) >= vD(2) && vD(1) <= vD(2)
    disp("There are no more collisions")
else
    disp("There's another collision")
end

%--------collision between cart 2 and cart 3--------

vE = [vD(1) 0 0];
%final velocities of carts after the collision
vE(2) = ((m(2)-m(3))*vD(2) + 2*m(3)*vD(3)) / m23;
vE(3) = ((m(3)-m(2))*vD(3) + 2*m(2)*vD(2)) / m23

%the difference should be 0, so that momentum is conserved
dP_E = sum(m .* vE) - pi     %momentum of system given in g*cm/s
%the difference should be 0, so that energy is conserved
dE_E = sum(0.5 * m .* vE.^2) - Ei    %energy of system in erg

%check if there is another collision in the system
if vE(3) >= vE(2) && vE(1) <= vE(2)
    disp("There are no more collisions")
else
    disp("There's another collision")
end

%(a) in total there were 5 collisions
%(c) according to the if/else statement that is used throughout the 
% exercise, if the final velocity of cart 3 is greater than that of cart 2
% and if the final velocity of cart 2 is greater than car 1 then there are
% no more collisions
% to further simplify, if a cart 3 is going towards the right at a greater
% velocity than cart 2, this means that cart 2 won't be able to catch up 
% to cart 3 ever, thus causing no collisions. The same logic applies to 
% cart 1 and cart 2 except, cart 1 needs to have a greater magnitude but
% when travelling towards the left (-ive direction)

