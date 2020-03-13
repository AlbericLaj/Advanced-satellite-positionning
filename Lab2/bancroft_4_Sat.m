function [r, b] = bancroft_4_Sat(r_k, P_k)

% define matrces
B = [r_k, P_k];
e = [1, 1, 1, 1];

a1 = 0.5*lorentz_product( [r_k(1, :), P_k(1)], [r_k(1, :), P_k(1)] );
a2 = 0.5*lorentz_product( [r_k(2, :), P_k(2)], [r_k(2, :), P_k(2)] );
a3 = 0.5*lorentz_product( [r_k(3, :), P_k(3)], [r_k(3, :), P_k(3)] );
a4 = 0.5*lorentz_product( [r_k(4, :), P_k(4)], [r_k(4, :), P_k(4)] );
alpha = [a1; a2; a3; a4];

% See comment under
%{
% Create temporary variable for speed
temp1 = B\e;
temp2 = B\alpha;

% find coefficient of quadratic equation ax^2 + bx + c = 0
a = lorentz_product(temp1, temp1);
b = 2*( lorentz_product(temp1, temp2) -1);
c = lorentz_product(temp2, temp2);

% Find two possible solution for the quadratic equation
lambda1 = (-b + sqrt(b^2 - 4*a*c))/(2*a);
lambda2 = (-b - sqrt(b^2 - 4*a*c))/(2*a);


% Find solution of bancroft problem
M = eye(4,4);
M(4,4) = -1;

result1 = M*B\(lambda1*e + alpha);
result2 = M*B\(lambda2*e + alpha);

% Keep the solution which is closer to Earth Center (Receiver is on the ground, not in Space)
if norm(result1(1:3)) > norm(result2(1:3))
    
    r = result2(1:3);
    b = result2(4);
    
else
    
    r = result1(1:3);
    b = result1(4);
    
end
%}
% replace with this if it is ok for Albericccc:
[r, b] = solve_equation(B,alpha, e);
end