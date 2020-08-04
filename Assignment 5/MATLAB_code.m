%ROB310 Problem Set 5
%Problem 5.2 Part D
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [1 1];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Plot
figure()
t = (0:N)*h;
subplot(3,1,1);
plot(t,[y_0,y_op]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(3,1,2);
plot(t,[h_0,h_op]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
subplot(3,1,3);
plot(t,ones(N+1)*(pi/4),'g')
hold on
plot(t, (-1)*ones(N+1)*(pi/4),'g')
hold on
plot(t(1:N),w_op)
hold on
%Label
title('The Turn Rate Input to Robot')
xlabel('Time [s]')
ylabel('w [rad]')
grid on


%ROB310 Problem Set 5
%Problem 5.2 Part E
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [500 500];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Plot
figure()
t = (0:N)*h;
subplot(3,1,1);
plot(t,[y_0,y_op]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(3,1,2);
plot(t,[h_0,h_op]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
subplot(3,1,3);
plot(t,ones(N+1)*(pi/4),'g')
hold on
plot(t, (-1)*ones(N+1)*(pi/4),'g')
hold on
plot(t(1:N),w_op)
hold on
%Label
title('The Turn Rate Input to Robot')
xlabel('Time [s]')
ylabel('w [rad]')
grid on


%ROB310 Problem Set 5
%Problem 5.2 Part E
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [500 1];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Plot
figure()
t = (0:N)*h;
subplot(3,1,1);
plot(t,[y_0,y_op]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(3,1,2);
plot(t,[h_0,h_op]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
subplot(3,1,3);
plot(t,ones(N+1)*(pi/4),'g')
hold on
plot(t, (-1)*ones(N+1)*(pi/4),'g')
hold on
plot(t(1:N),w_op)
hold on
%Label
title('The Turn Rate Input to Robot')
xlabel('Time [s]')
ylabel('w [rad]')
grid on


%ROB310 Problem Set 5
%Problem 5.2 Part E
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [1 0.001];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Plot
figure()
t = (0:N)*h;
subplot(3,1,1);
plot(t,[y_0,y_op]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(3,1,2);
plot(t,[h_0,h_op]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
subplot(3,1,3);
plot(t,ones(N+1)*(pi/4),'g')
hold on
plot(t, (-1)*ones(N+1)*(pi/4),'g')
hold on
plot(t(1:N),w_op)
hold on
%Label
title('The Turn Rate Input to Robot')
xlabel('Time [s]')
ylabel('w [rad]')
grid on


%ROB310 Problem Set 5
%Problem 5.2 Part E
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [1 100];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Plot
figure()
t = (0:N)*h;
subplot(3,1,1);
plot(t,[y_0,y_op]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(3,1,2);
plot(t,[h_0,h_op]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
subplot(3,1,3);
plot(t,ones(N+1)*(pi/4),'g')
hold on
plot(t, (-1)*ones(N+1)*(pi/4),'g')
hold on
plot(t(1:N),w_op)
hold on
%Label
title('The Turn Rate Input to Robot')
xlabel('Time [s]')
ylabel('w [rad]')
grid on


%ROB310 Problem Set 5
%Problem 5.2 Part F
close all; clear; clc;
%Definition of Parameters
N = 1000;
h = 0.01;
v = 1;
w_min = -pi/4;
w_max = pi/4;
y_0 = 1.5;
h_0 = 0;
r = 1;
vec = [1 1];
Q = diag(vec);
%Definition of Cost Function
f = zeros(3*N, 1);
H = sparse(diag(ones(N,1)*r));
for i=1:N
 H = blkdiag(H,Q);
end
H = 2*H;
%Definition of Equality Constraint
A_eq_left = zeros(2*N,N);
for i = 1:N
 A_eq_left(2*i, i) = -h;
end
diagonal_1 = sparse([0, repmat([-h*v,0],1,N-1)]);
diagonal_2 = (-1)*ones(2*N-2,1);
A_eq_right = eye(2*N) + diag(diagonal_1,-1) + diag(diagonal_2,-2);
A_eq = [A_eq_left, A_eq_right];
b_eq = [y_0 + h*v*h_0; h_0; zeros(2*N-2,1)];
%Definition of Inequality Constraint
A_front = [sparse(diag((-1)*ones(N,1))); diag(ones(N,1))];
A_neq = [A_front zeros(2*N, 2*N)];
b_neq = [(-1)*ones(N,1)*w_min; ones(N,1)*w_max];
%Solution
[x_min_ed fval] = quadprog(H,f,A_neq,b_neq,A_eq,b_eq);
%Optimal w sequence
w_op = x_min_ed(1:N);
%State sequence wrt Optimal w sequence
op = reshape(x_min_ed(N+1:3*N),[2,N]);
y_op = op(1,:);
h_op = op(2,:);
%Addition of Unknown Disturbance
y = ones(1,N+1);
head = ones(1,N+1);
y(1) = y_0;
head(1) = h_0;
for i=1:N
 y(i+1) = y(i)+h*v*head(i);
 head(i+1) = head(i) + h*w_op(i) + h*(pi/25);
end
%Plot
figure()
t = (0:N)*h;
subplot(2,1,1);
plot(t,[[y_0,y_op];y]);
%Label
title('The Position of Robot Laterally')
xlabel('Time [s]')
ylabel('y [m]')
grid on
subplot(2,1,2);
plot(t,[[h_0,h_op];head]);
%Label
title('The Heading of Robot')
xlabel('Time [s]')
ylabel('h [rad]')
grid on
