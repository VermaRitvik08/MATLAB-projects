%Ritvik Verma
%ECE 202 Fall 2021
%M6 exercise 
%Updating excercise M3 to include user inputs

clear

global m


m = input('Enter the masses of the carts as [m_1,m_2,m_3]: ');   
%mass of carts given in grams (g)
%240,60,300 (test mass)

v = input('Enter initial velocities as [v_1,v_2,v_3]: ');    
%velocity of carts given in cm/s
%36,9,-45 (test velocity)
cutoff = input('Enter cutoff: ');

P0 = sum(m.*v);
E0 = sum(0.5 * m .* v.^2);
count = 0;


while v(1) > v(2) || v(2) > v(3)
    
    count = count+1;
    
    if v(1) > v(2)
        next=12;
    end
    
    if v(2) > v(3)
        next=23;
    end
    
    if v(1) > v(2) && v(2) > v(3)
        next = input('Which carts collide first? ');
    end
    
    fprintf('After collision #%u',count)
    
    v = collision(v, next)
    
    p_check = P0 - sum(m.*v);
    E_check = E0 - sum(0.5*m.*v.^2);
    
    if abs(p_check) > cutoff
        p_check
    end
    if abs(E_check) > cutoff
        E_check
    end 
    
end

if count==0
       disp("There are no more collisions")
else
    disp('There are multiple collisions')
end

function vf = collision(vi, next)
    global m;
    
    m12 = m(1)+m(2);
    m23 = m(2)+m(3);
    vf = [0 0 0];
    if next==12
        vf(1) = ((m(1)-m(2))*vi(1) + 2*m(2)*vi(2)) / m12;
        vf(2) = ((m(2)-m(1))*vi(2) + 2*m(1)*vi(1)) / m12;
        vf(3) = vi(3);
    elseif next==23
        vf(1) = vi(1);
        vf(2) = ((m(2)-m(3))*vi(2) + 2*m(3)*vi(3)) / m23;
        vf(3) = ((m(3)-m(2))*vi(3) + 2*m(2)*vi(2)) / m23;    
    end
end

