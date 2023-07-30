function [theta1_new, theta2_new] = modifiedInverse(x, y, theta1, theta2)
% Define robot arm parameters
L1 = 2; % length of first link
L2 = 2; % length of second link

% Compute current end effector position
p = forward_kinematics(theta1, theta2, L1, L2);

% Compute inverse kinematics
[theta1_all, theta2_all] = inverse_kinematics(p, x, y, L1, L2);

dist = sqrt((theta1_all - theta1).^2 + (theta2_all - theta2).^2);

[~, idx] = min(dist);

% Select the nearest solution
theta1_new = theta1_all(idx);
theta2_new = theta2_all(idx);

% Nested function to compute forward kinematics
    function p = forward_kinematics(theta1, theta2, L1, L2)
        % Compute forward kinematics for a 2-link planar robot arm
        x = L1*cos(theta1) + L2*cos(theta1+theta2);
        y = L1*sin(theta1) + L2*sin(theta1+theta2);
        p = [x, y];
    end

% Nested function to compute inverse kinematics
    function [theta1_all, theta2_all] = inverse_kinematics(p, x, y, L1, L2)
        dist = norm(p - [x,y]);
        % Check if desired position is reachable
        if dist > L1 + L2
            error('Desired position is outside of robot workspace');
        end
        A = acos((L1^2 + L2^2 - dist^2)/(2*L1*L2));
        theta2_all = [A, -A] + atan2(y-L1*sin(theta1), x-L1*cos(theta1));
        theta1_all = atan2(y-L2*sin(theta2_all), x-L2*cos(theta2_all)) - theta2_all;
    end

end