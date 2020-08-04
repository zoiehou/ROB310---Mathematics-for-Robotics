%ROB310 Problem Set 1
%Problem 1.1 Part B
close all; clear; clc;
%Define Variables
m = 1;
b = 0.1;
h = 0.01;
A = -b/m;
B = 1/m;
%Find A_D and B_D
Soln = expm([A, B; 0, 0].*h);
A_D = Soln(1,1)
B_D = Soln(1,2)
%As displayed, A_D = 0.9990 and B_D = 0.0100. The results are the same as
%the ones we have computed by hand from part A of question 1.


%ROB310 Problem Set 1
%Problem 1.1 Part C
close all; clear; clc;
%Define Variables as given or from the previous parts of question 1
u_k = 1;
k = linspace(0, 10000, 10001);
v_o = 0;
v_k = NaN(1, 10001); %initializing an array
v_k(1) = v_o;
A_D = 0.9990;
B_D = 0.0100;
%Creating v_k for k = 1,...,10000
for i = 1:10000
 v_k(i+1) = A_D*v_k(i) + B_D*u_k;
end
%Plot v_k
plot(k(1:10001)*0.01, v_k(1:10001))
%Label the graph
xlabel('Time [s]');
ylabel('Speed [m/s]');
title('Speed vs. Time');


%ROB310 Problem Set 1
%Problem 1.1 Part D
close all; clear; clc;
%Define Variables
m = 1;
b_model = 0.1; %model value of b
b_true = 0.4; %real-world value of b
h = 0.01;
u_k = 1;
k = linspace(0, 10000, 10001);
v_o = 0;
%A and B values for model and real-world values of b
A_model = -b_model/m;
A_true = -b_true/m;
B = 1/m;
%For the model b value
v_k_model = NaN(1, 10001);
v_k_model(1) = v_o;
%For the real-world b value
v_k_true = NaN(1, 10001);
v_k_true(1) = v_o;
%Find A_D and B_D for b = 0.1
Soln_model = expm([A_model, B; 0, 0].*h);
A_D_model = Soln_model(1,1);
B_D_model = Soln_model(1,2);
%Find A_D and B_D for b = 0.4
Soln_true = expm([A_true, B; 0, 0].*h);
A_D_true = Soln_true(1,1);
B_D_true = Soln_true(1,2);
%Creating y_k_model and y_k_true for k = 1,...,10000 to get the
 difference between
%them
for i = 1:10000
 v_k_model(i+1) = A_D_model*v_k_model(i) + B_D_model*u_k;
 v_k_true(i+1) = A_D_true*v_k_true(i) + B_D_true*u_k;
end
%Creating the error, the model value of b, and the real-world value of b graphs
v_k = abs(v_k_model - v_k_true);
plot(k(1:10001)*0.01, v_k(1:10001), 'r')
hold on;
plot(k(1:10001)*0.01, v_k_model(1:10001),'cyan')
hold on;
plot(k(1:10001)*0.01, v_k_true(1:10001), 'b')
hold off;
%Label the graph and add a legend
xlabel('Time [s]');
ylabel('Error');
title('Absolute Error Value between Model and Real-World b values');
legend('Error', 'Model', 'Real-World');


%ROB310 Problem Set 1
%Problem 1.1 Part E
close all; clear; clc;
%Define Variables
u_k = 1;
k = linspace(0, 10000, 10001);
v_o = 0;
v_k = NaN(1, 10001);
v_k(1) = v_o;
theta = 30*pi/180; %30 degrees in radians
m = 1;
g = 10;
%Since the question did not specify which b value one should be using
 to
%solve for this question, so I assumed that I should use b = 0.1
%With b = 0.1, the calculated A_D and B_D are:
A_D = 0.9990;
B_D = 0.0100;
%The affected u_k
added_input = m*g*sin(theta);
u_k_new = u_k + added_input;
%Creating y_k for k = 1,...,10000 after parameters modifications
for i = 1:10000
 v_k(i+1) = A_D*v_k(i) + B_D*(u_k_new);
end
%Plot the new graph
plot(k(1:10001)*0.01, v_k(1:10001))
%Label the graph
xlabel('Time [s]');
ylabel('Speed [m/s]');
title('Speed vs. Time');
