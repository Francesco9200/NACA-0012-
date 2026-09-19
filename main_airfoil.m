%%Data for symmetrical profile NACA 0012
t = 0.12;
n_points = 100;
[x, y] = naca4_generator(t, n_points);
figure;
hold on;
title("NACA 0012");
plot(x, y, 'b-')
plot(x, -y, 'b-')
grid on;
axis equal;
hold off;
alpha_deg= -5:1:15;
alpha_rad= deg2rad(alpha_deg);
Cl = 2*pi*alpha_rad;
figure;
plot(alpha_deg, Cl, 'ro-', 'LineWidth', 2);
xlabel("Angle of attack (°)")
ylabel("Coefficient of lift")
title("Graph of Cl in function of the angle of attack")
grid on;
hold off;
Cd0 = 0.006;
k=0.01;
Cd = Cd0 + k*Cl.^2;
figure;
plot(Cd, Cl, 'm-','LineWidth', 2);
xlabel("Coefficient of drag")
ylabel("Coefficient of lift")
title("Drag polar")
grid on;
hold off;
E = Cl ./ Cd;
figure;
plot(alpha_deg, E, 'r-', 'LineWidth', 2);
xlabel("Angle of attack (°)")
ylabel("Efficiency")
title("Graph of efficiency in function of the angle of attack")
grid on;
hold off;
[E_max, i] = max(E);
optimal_alpha = alpha_deg(i);
fprintf('The maximum efficiency is given for AOA = %.5f° that gives a value of maximum efficiency of: %.3f',optimal_alpha, E_max);

