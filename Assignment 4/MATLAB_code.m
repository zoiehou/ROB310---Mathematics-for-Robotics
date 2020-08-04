%ROB310 Problem Set 4
%Problem 4.3 Part C
close all; clear; clc;
%Diagonal Matrix C
 %Define Variables
 c = 10;
 n = 2;
C = diag(func(1:n));
%Definition of Functions
f_sq = @(x) transpose(x)*C*x;
f_hole = @(x) 1-exp(transpose(x)*C*x);
%Plot and Label the graph of f_sq
figure()
ezsurf(@(x_1,x_2) f_sq([x_1;x_2]), [-1,1,-1,1])
title('f_{sq}(x)')
xlabel('x_1')
ylabel('x_2')
zlabel('f_{sq}')
%Plot and Label the graph of f_hole
figure()
ezsurf(@(x_1,x_2) f_hole([x_1;x_2]), [-1,1,-1,1])
title('f_{hole}(x)')
xlabel('x_1')
ylabel('x_2')
zlabel('f_{hole}')
%Definition of Diagonal Matrix C
function c_func = func(i)
 %Define Variables
 c = 10;
 n = 2;
 c_func = c.^((i-1)/(n-1));
end


%ROB310 Problem Set 4
%Problem 4.3 Part D
close all; clear; clc;
%Definition of Parameters
c = 10;
n = 2;
C = diag(func(1:n));
x_0_sq = [1;1];
x_0_hole = [1;1];
alpha = -0.09;
i = 0;
j = 0;
acc = 10^(-10); %accuracy
Num_max = 500; %max interations
x_prev_sq = x_0_sq + 50;
x_prev_hole = x_0_hole + 50;
%Gradients of Functions
f_sq_g = @(x) 2*C*x;
f_hole_g = @(x) (-2)*exp(transpose(x)*C*x)*C*x;
%Fixed-Step Gradient Descent for f_sq
tic
while (norm(x_prev_sq-x_0_sq)>acc && i<Num_max)
 x_prev_sq = x_0_sq;
 x_0_sq = x_prev_sq + alpha*f_sq_g(x_prev_sq);
 i = i + 1;
end
time_tot_sq = toc;
%Fixed-Step Gradient Descent for f_hole
tic
while (norm(x_prev_hole-x_0_hole)>acc && j<Num_max)
 x_prev_hole = x_0_hole;
 x_0_hole = x_prev_hole + alpha*f_hole_g(x_prev_hole);
 j = j + 1;
end
time_tot_hole = toc;
%Results for f_sq
disp('f_sq Results')
disp('Minimum: ')
disp(x_0_sq)
disp('Number of Iterations: ')
disp(i)
disp('Total Time: ')
disp(time_tot_sq)
disp('Time per Iteration: ')
disp(time_tot_sq/i)
%Results for f_hole
disp('f_hole Results')
disp('Minimum: ')
disp(x_0_hole)
disp('Number of Iterations: ')
disp(j)
disp('Total Time: ')
disp(time_tot_hole)
disp('Time per Iteration: ')
disp(time_tot_hole/j)
%Definition of Diagonal Matrix C
function c_func = func(i)
 %Define Variables
 c = 10;
 n = 2;
 c_func = c.^((i-1)/(n-1));
end


%ROB310 Problem Set 4
%Problem 4.3 Part E
close all; clear; clc;
%Definition of Parameters
c = 10;
n = 2;
C = diag(func(1:n));
x_0_sq = [1;1];
x_0_hole = [1;1];
i = 0;
j = 0;
acc = 10^(-10); %accuracy
Num_max = 500; %max iterations
x_prev_sq = x_0_sq + 50;
x_prev_hole = x_0_hole + 50;
%Gradients of Functions
f_sq_g = @(x) 2*C*x;
f_hole_g = @(x) (-2)*exp(transpose(x)*C*x)*C*x;
%Hessians of Functions
f_sq_h = @(x) 2*C;
f_hole_h = @(x) -exp(transpose(x)*C*x)*(2*C
+4*C*x*transpose(x)*transpose(C));
%f_hole_h = @(x) -exp(transpose(x)*C*x)*C*(eye(2)+2*x*transpose(x)*C);
%Fixed-Step Gradient Descent for f_sq
tic
while (norm(x_prev_sq-x_0_sq)>acc && i<Num_max)
 x_prev_sq = x_0_sq;
 x_0_sq = x_prev_sq - inv(f_sq_h(x_prev_sq))*f_sq_g(x_prev_sq);
 i = i + 1;
end
time_tot_sq = toc;
%Fixed-Step Gradient Descent for f_hole
tic
while (norm(x_prev_hole-x_0_hole)>acc && j<Num_max)
 x_prev_hole = x_0_hole;
 x_0_hole = x_prev_hole -
 inv(f_hole_h(x_prev_hole))*f_hole_g(x_prev_hole);
 j = j + 1;
end
time_tot_hole = toc;
%Results for f_sq
disp('f_sq Results')
disp('Minimum: ')
disp(x_0_sq)
disp('Number of Iterations: ')
disp(i)
disp('Total Time: ')
disp(time_tot_sq)
disp('Time per Iteration: ')
disp(time_tot_sq/i)
%Results for f_hole
disp('f_hole Results')
disp('Minimum: ')
disp(x_0_hole)
disp('Number of Iterations: ')
disp(j)
disp('Total Time: ')
disp(time_tot_hole)
disp('Time per Iteration: ')
disp(time_tot_hole/j)
%Definition of Diagonal Matrix C
function c_func = func(i)
 %Define Variables
 c = 10;
 n = 2;
 c_func = c.^((i-1)/(n-1));
end


%ROB310 Problem Set 4
%Problem 4.3 Part F
close all; clear; clc;
%Definition of Parameters
c = 10;
n = 2;
C = diag(func(1:n));
x_0_sq = [1;1];
x_0_hole = [1;1];
acc = 10^(-10); %accuracy
%Definition of Functions
f_sq = @(x) transpose(x)*C*x;
f_hole = @(x) 1-exp(transpose(x)*C*x);
%Fmincon for f_sq
options.TolX = acc;
tic
[x_sq,fval,exitflag,output_sq] = fmincon(f_sq,x_0_sq,[],[],[],[],[],
[],[],options);
time_tot_sq = toc;
%Fmincon for f_hole
tic
[x_hole,fval,exitflag,output_hole] = fmincon(f_hole,x_0_hole,[],[],[],
[],[],[],[],options);
time_tot_hole = toc;
%Results for f_sq
disp('f_sq Results')
disp('Minimum: ')
disp(x_sq)
disp('Number of Iterations: ')
disp(output_sq.iterations)
disp('Total Time: ')
disp(time_tot_sq)
disp('Time per Iteration: ')
disp(time_tot_sq/output_sq.iterations)
%Results for f_hole
disp('f_hole Results')
disp('Minimum: ')
disp(x_hole)
disp('Number of Iterations: ')
disp(output_hole.iterations)
disp('Total Time: ')
disp(time_tot_hole)
disp('Time per Iteration: ')
disp(time_tot_hole/output_hole.iterations)
%Definition of Diagonal Matrix C
function c_func = func(i)
 %Define Variables
 c = 10;
 n = 2;
 c_func = c.^((i-1)/(n-1));
end
