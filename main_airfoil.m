%%Preliminary analysis of a symmetrical profile NACA 0012
t = 0.12; %%maximum thickness as fraction of chord of the NACA 0012 airfoil
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
%%Using theoretical model we calculate Cl
alpha_deg= -5:1:15;
alpha_rad= deg2rad(alpha_deg);
Cl = 2*pi*alpha_rad;
Re = 5.97 * 10^6; %%Reynolds number of the experimental data
alpha_exp = [-4.05, -2, 0.05, 1.98, 4.18, 6.20, 8.22, 10.18, 11.08, 12.25, 13.10, 14.28, 15.20, 16.18, 16.90, 17.35, 17.65, 18.65];
Cl_exp = [-0.4280, -0.2150, 0.0040, 0.2080, 0.4520, 0.6630, 0.8800, 1.0880, 1.1800, 1.2920, 1.3680, 1.4580, 1.5280, 1.5900, 1.6180, 1.6600, 1.6450, 1.0050];
alpha_exp_rad=deg2rad(alpha_exp);
a_exp = diff(Cl_exp(1:9)) ./ diff(alpha_exp_rad(1:9));
a_exp_av = mean(a_exp);
[Cl_exp_max, i3] = max(Cl_exp);
alpha_exp_Clmax = alpha_exp(i3);
fprintf('The maximum value of CL, in experimental data, is %.4f, and is given for AOA = %.4f° \n', Cl_exp_max, alpha_exp_Clmax)
fprintf('The slope using the experimental data is: %.3f/rad \n', a_exp_av)
figure;
plot(alpha_deg, Cl, 'r-', 'LineWidth', 2);
hold on;
plot(alpha_exp, Cl_exp, 'go', 'LineWidth', 2)
Cl0 = Cl_exp(2)-a_exp_av*(alpha_exp_rad(2));
Cl_aexp = a_exp_av*alpha_rad + Cl0;
plot(alpha_deg, Cl_aexp, 'm-', 'LineWidth', 2)
legend('Cl = 2\pi\alpha', 'experimental data', 'Cl = a\alpha +Cl\_0')
xlabel("Angle of attack (°)")
ylabel("Coefficient of lift")
title("Graph of Cl in function of the angle of attack")
grid on;
hold off;
%%We now calculate a mathematical model using the experimental data of Cd
Cl_exp2 = [-0.4280, -0.2150, 0.0040, 0.2080, 0.4520, 0.6630, 0.8800, 1.0880, 1.1800, 1.2920, 1.3680, 1.4580, 1.5280, 1.5900, 1.6180, 1.6600];
Cd_exp = [0.007, 0.0065, 0.0065, 0.0068, 0.0076, 0.0068, 0.008, 0.0105, 0.0114, 0.0125, 0.01300, 0.0162, 0.0187, 0.02180, 0.02440, 0.0275];
k_vec = diff(Cd_exp(1:9))./diff(Cl_exp2(1:9).^2);
k = mean (k_vec);
Cd0_vec = Cd_exp(1:9) - k*(Cl_exp2(1:9).^2);
Cd0 = mean(Cd0_vec);
Cd_model = Cd0 + k*(Cl_exp2.^2);
figure;
plot(Cd_exp, Cl_exp2, 'r-','LineWidth', 2);
hold on;
plot(Cd_model, Cl_exp2, 'b-','LineWidth', 2);
legend('Experimental data drag polar', 'Theoretical model drag polar')
xlabel("Coefficient of drag")
ylabel("Coefficient of lift")
title("Drag polar")
grid on;
hold off;
fprintf('The value of the zero lift drag coefficient is: %.4f\n', Cd0)
fprintf('The value of the drag polar coefficient k is: %.4f\n', k)
%%We now obtain the values to compare of efficiency
E = Cl_exp2 ./ Cd_exp;
E_teo = Cl ./ (Cd0 + k*Cl.^2);
figure;
plot(alpha_deg, E_teo, 'b-', 'LineWidth', 2)
hold on;
plot(alpha_exp(1:16), E, 'r-', 'LineWidth', 2);
legend('Theoretical model', 'Experimental data')
xlabel("Angle of attack (°)")
ylabel("Efficiency")
title("Graph of efficiency in function of the angle of attack")
grid on;
hold off;
[E_max_teo, i5] = max(E_teo);
[E_max, i] = max(E);
optimal_alpha = alpha_exp(i);
optimal_alpha_teo = alpha_deg(i5);
fprintf('The maximum efficiency using experimental data is given for AOA = %.5f° that gives a value of maximum efficiency of: %.3f \n',optimal_alpha, E_max);
fprintf('The maximum efficiency using the mathematical model is given for AOA = %.5f° that gives a value of maximum efficiency of: %.3f \n',optimal_alpha_teo, E_max_teo);
