function [vec_x, vec_y] = naca4_generator(t, n_points) %%t = thickness
vec_x = linspace(0,1,n_points);
vec_y = 5 * t * (0.2969*sqrt(vec_x)- 0.1260*vec_x-0.3516*vec_x.^2+0.2843*vec_x.^3-0.1015*vec_x.^4);
end


