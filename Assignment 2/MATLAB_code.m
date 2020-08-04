%ROB310 Problem Set 2
%Problem 2.3 Part A
close all; clear; clc;
%Define Data points
x = [0, 0; 0.05, 0.15; 0.1, 0.3; 0.15, 0.45; 0.2, 0.6];
%Plot graph
plot(x(:,1),x(:,2))
%Label graph
title('Problem 2.3 Part A')
xlabel('x')
ylabel('f(x)')
%Integration with the Trapezoidal Rule Approximation
disp('Integral of part A')
int = Trap_Approx(x)
%Function Defintion for the Trapezoidal Rule Approximation
function y = Trap_Approx(x)
%Initialize Variables
y = 0;
for i = 1:(length(x(:,1))-1)
 y = y + (x(i+1,1)-x(i,1))*((x(i,2)+x(i+1,2))/2);
end
end


%ROB310 Problem Set 2
%Problem 2.3 Part C
close all; clear; clc;
%Define Data points
x = [0, 1; 0.13, 0.5198; 0.37, -0.6207; 0.49, 0.1728; 0.81, 1.259;
 1.06, -0.121; 1.19, 0.6467; 1.61, 0.6537; 1.94, 1.113; 2.06,
 1.835];
%Plot graph
plot(x(:,1),x(:,2))
%Label graph
title('Problem 2.3 Part C')
xlabel('x')
ylabel('f(x)')
%Integration with the Trapezoidal Rule Approximation
disp('Integral of part C')
int = Trap_Approx(x)
%Function Defintion for the Trapezoidal Rule Approximation
function y = Trap_Approx(x)
%Initialize Variables
y = 0;
for i = 1:(length(x(:,1))-1)
 y = y + (x(i+1,1)-x(i,1))*((x(i,2)+x(i+1,2))/2);
end
end
