clc; clear; close all;

% Manipulator Parameters
L1 = 1; % Length of first link
L2 = 0.75; % Length of second link
m1 = 1; % Mass of link 1
m2 = 0.5; % Mass of link 2
I1 = 0.1; % Moment of inertia of link 1
I2 = 0.05; % Moment of inertia of link 2
g = 9.81; % Acceleration due to gravity

% Trajectory Parameters
t = 0:0.01:10; % Time vector
x = cos(t); % X coordinate of the trajectory
y = sin(t); % Y coordinate of the trajectory
vx = -sin(t); % X velocity of the trajectory
vy = cos(t); % Y velocity of the trajectory
ax = -cos(t); % X acceleration of the trajectory
ay = -sin(t); % Y acceleration of the trajectory

% Simulation Parameters
dt = 0.01; % Time step
q0 = [0; pi/4]; % Initial joint angles
q_dot0 = [0; 0]; % Initial joint velocities
q_ddot0 = [0; 0]; % Initial joint accelerations
Kp = 10; % Proportional gain
Kd = 2; % Derivative gain

% Simulation
q = q0;
q_dot = q_dot0;
q_ddot = q_ddot0;
for i = 1:length(t)-1
    % Desired end-effector position, velocity and acceleration
    p_d = [x(i+1); y(i+1)];
    p_dot_d = [vx(i+1); vy(i+1)];
    p_ddot_d = [ax(i+1); ay(i+1)];
    
    % Current end-effector position and Jacobian matrix
    [p, J] = forward_kinematics(q, L1, L2);
    
    % Current joint angle error
    e = p_d - p;
    e_dot = p_dot_d - J*q_dot;
    e_ddot = p_ddot_d - J*q_ddot;
    
    % Joint torques using dynamic equation of motion
    M = mass_matrix(q, L1, L2, m1, m2, I1, I2);
    V = coriolis_matrix(q, q_dot, L1, L2, m1, m2);
    G = gravity_matrix(q, L1, L2, m1, m2, g);
    tau = M*p_ddot_d + V*p_dot_d + G;
    
    % Update joint accelerations, velocities and angles using inverse kinematics
    q_ddot = inv(M)*tau;
    q_dot = q_dot + q_ddot*dt;
    q = q + q_dot*dt;
    
    % Plot the manipulator and trajectory
    plot([0, L1*cos(q(1)), L1*cos(q(1)) + L2*cos(q(1)+q(2))], [0, L1*sin(q(1)), L1*sin(q(1)) + L2*sin(q(1)+q(2))], 'LineWidth', 2);
    hold on;
    plot(x(1:i+1), y(1:i+1), 'r', 'LineWidth', 2);
    axis equal;
    xlim([-2, 2]);
    ylim([-2,2]);
hold off;
title("2-DOF RR manipualator")
pause(0.01);
end

