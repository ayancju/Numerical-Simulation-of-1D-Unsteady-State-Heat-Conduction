% 1D Unsteady-State Heat Conduction Solver
% Method: Explicit Finite Difference
clear; clc;

% --- Parameters ---
L = 0.1;              % Length of rod (m)
n = 50;               % Number of spatial nodes
dx = L / (n-1);       % Spatial step size
alpha = 1e-4;         % Thermal diffusivity (m^2/s)
t_final = 60;         % Total simulation time (s)
dt = 0.01;            % Time step size (s) - Must satisfy dt <= dx^2 / (2*alpha)

% Stability Check
if dt > (dx^2 / (2*alpha))
    error('Stability criterion not met.');
end

% --- Initial Conditions ---
T = zeros(n, 1);      % Initialize temperature array (all at 0 deg C)
T_new = T;            % Array for the next time step

% --- Boundary Conditions ---
T(1) = 100;           % Left end held at 100 deg C
T(n) = 20;            % Right end held at 20 deg C

% --- Simulation Loop ---
steps = t_final / dt;
x = linspace(0, L, n);

for k = 1:steps
    for i = 2:n-1
        % Explicit Finite Difference Formula
        T_new(i) = T(i) + alpha * dt / dx^2 * (T(i+1) - 2*T(i) + T(i-1));
    end
    
    % Update boundaries (remain constant)
    T_new(1) = 100;
    T_new(n) = 20;
    
    T = T_new; % Move to next time step
    
    % Optional: Real-time plotting
    if mod(k, 100) == 0
        plot(x, T, 'LineWidth', 2);
        xlabel('Position (m)'); ylabel('Temperature (^\circC)');
        title(['Time = ', num2mstr(k*dt), ' s']);
        grid on; axis([0 L 0 100]);
        drawnow;
    end
end