# Preliminary analysis of NACA 0012 airfoil using MATLAB

## Objective


This preliminary aerodynamic analysis aims to compare experimental data with mathematical models to investigate the basic aerodynamic performance of a 2D NACA 0012 airfoil.
The NACA 0012 is a symmetrical airfoil, as shown in the figure.



<img width="668,25" height="436,5" alt="image" src="https://github.com/user-attachments/assets/35e9c934-68c0-440b-aa72-75e7ecc276ee" />

## Experimental data

The data were taken from a NASA report made by Charles L. Ladson (1988), at a Reynolds number of  $Re = 5.97 \times 10^6$.



<img width="296" height="359" alt="Screenshot 2026-09-21 155811" src="https://github.com/user-attachments/assets/190c76f2-d07f-4e7e-851c-24ab510669e9" />

## Assumptions

The analysis assumes a subsonic flight regime, with a Mach number $M \leq 0.3$, allowing the incompressible flow approximation to be used.
The analysis considers a 2D airfoil under the assumptions of thin-airfoil theory. The lift coefficient is therefore approximated as:

$$
C_L = 2\pi\alpha
$$

where $\alpha$ is the angle of attack expressed in radians.

## Methodology

The $C_L = 2\pi\alpha$ approximation is considered over the range $-5^\circ \leq \alpha \leq 15^\circ$. The experimental data show an approximately linear region before stall, extending up to about $10^\circ\sim11^\circ$.

The slope of the experimental lift curve is estimated in this linear region using finite differences. For the purposes of this preliminary analysis, this method provides an acceptable approximation. The resulting linear model is:

$$
C_L = a\alpha + C_{L0}
$$

The same approach is used to obtain a parabolic model of the drag polar from the experimental drag coefficient data:

$$
C_D = C_{D0} + kC_L^2
$$

where $C_{D0}$ and $k$ are estimated from the experimental data.

Finally, the aerodynamic efficiency is calculated as:

$$
E = \frac{C_L}{C_D}
$$

The experimental and modelled efficiency are compared to determine the angle of attack corresponding to the maximum aerodynamic efficiency in both analysis.

## Numerical results

### Lift coefficient


The maximum coefficient of lift is $C_{Lmax} = 1.6600$ at  $\alpha = 17.35^\circ$.


The experimental lift-curve slope is $a = 6.070\ \mathrm{rad}^{-1}$, compared with the theoretical value $2\pi \approx 6.283\ \mathrm{rad}^{-1}$.

The resulting experimental lift-curve equation is

$$
C_L = 6.070\alpha - 0.0031
$$



<img width="947" height="591" alt="image" src="https://github.com/user-attachments/assets/3c0028ba-8253-4d81-8b6f-91e908fa7903" />


### Drag polar

The value of the zero lift drag coefficient is: $C_{D0} = 0.0063$.

The value of the drag polar coefficient is: $k = 0.0033$.

The resulting parabolic drag-polar model, obtained from the experimental data, is:

$$
C_D = 0.0063 + 0.0033C_L^2
$$



<img width="970" height="586" alt="image" src="https://github.com/user-attachments/assets/d938492f-3f50-4e85-ba30-06ea424b2ebd" />

###Aerodynamic efficiency

The aerodynamic efficiency is evaluated as the lift-drag ratio:

$$
E = \frac{C_L}{C_D}
$$

The maximum efficiency obtained from the experimental data is $E_{\max} = 110.000$, occurring at an angle of attack of $\alpha = 8.22^\circ$.

Using the mathematical models, the maximum efficiency is $E_{\max} = 109.702$, occurring at $\alpha = 13^\circ$.

The experimental data and the mathematical model are compared in the figure below.



<img width="931" height="593" alt="image" src="https://github.com/user-attachments/assets/5076069a-c23b-4feb-8456-6e9888012acf" />

## Discussion

### Lift coefficient

The difference between the two curves is due to the idealized assumption of the thin-airfoil theory. The experimental data include also the effects of aerodynamic phenomena and measurament uncertainty.

Therefore, as we can see from the graph, the pre-stall approximation is acceptable for small angles of attack and becomes more relevant as it approaches stall configuration.

### Drag polar

The differences between the experimental drag polar and the mathematical model are partly due to the limited range of experimental data used to estimate the model parameters. As for the lift-curve analysis, only the approximately linear pre-stall region, up to about $10^\circ \sim 11^\circ$, was considered when estimating $C_{D0}$ and $k$.

Therefore, the parabolic model provides a better approximation within this range, while the deviation from the experimental data becomes more significant at higher angles of attack. This behaviour is also related to the same real aerodynamic phenomena and experimental effects discussed for the lift coefficient, which become increasingly relevant as the airfoil approaches and enters the stall regime.

### Aerodynamic efficiency

The aerodynamic efficiency shows a good agreement between the experimental data and the mathematical model. The two curves are very similar over the considered range and the model follows the experimental trend quite well.

The maximum efficiency obtained from the two approaches is also very similar: $E_{\max} = 110.000$ from the experimental data and $E_{\max} = 109.702$ from the mathematical model.

This shows that, despite the approximations made in the lift and drag models, the resulting model provides a good approximation of the aerodynamic efficiency of the airfoil.


