# 1D Unsteady-State Heat Conduction Solver

## Project Overview
This project provides a numerical solution for the one-dimensional unsteady-state heat conduction equation using the **Explicit Finite Difference Method (FDM)**. Developed in **MATLAB**, it simulates the transient temperature distribution across a solid domain, such as a thin rod, under specific boundary conditions.

This project demonstrates the application of computational methods to **Transport Phenomena** and **Numerical Analysis**, core areas of Chemical Engineering.

---

## Mathematical Derivation

The governing equation for 1D heat conduction (heat diffusion) is given by:
$$\frac{\partial T}{\partial t} = \alpha \frac{\partial^2 T}{\partial x^2}$$

Where:
* $T$ is the temperature ($^\circ C$).
* $t$ is time ($s$).
* $\alpha$ is the thermal diffusivity ($m^2/s$).
* $x$ is the spatial coordinate ($m$).



### Step 1: Discretization
To solve this numerically, we discretize the domain into a grid with a spatial step $\Delta x$ and a time step $\Delta t$.

* **Temporal Derivative (Forward Difference):** $$\frac{\partial T}{\partial t} \approx \frac{T_i^{m+1} - T_i^m}{\Delta t}$$
* **Spatial Second Derivative (Central Difference):** $$\frac{\partial^2 T}{\partial x^2} \approx \frac{T_{i+1}^m - 2T_i^m + T_{i-1}^m}{\Delta x^2}$$

### Step 2: Substitution
Substituting these approximations back into the governing equation:
$$\frac{T_i^{m+1} - T_i^m}{\Delta t} = \alpha \left( \frac{T_{i+1}^m - 2T_i^m + T_{i-1}^m}{\Delta x^2} \right)$$

### Step 3: Rearranging for the Future State
We solve for the temperature at the next time step ($T_i^{m+1}$) based on current known values:
$$T_i^{m+1} = T_i^m + \left( \frac{\alpha \Delta t}{\Delta x^2} \right) (T_{i+1}^m - 2T_i^m + T_{i-1}^m)$$

---

## Stability Criterion
For the explicit scheme to remain stable and avoid numerical oscillations, the **Fourier Number ($Fo$)** must satisfy the following condition:
$$Fo = \frac{\alpha \Delta t}{\Delta x^2} \leq 0.5$$
The MATLAB script includes an automated check to ensure this criterion is met before beginning the simulation.

---

## Features
* **Numerical Accuracy:** Uses FDM for high-fidelity transient modeling.
* **Dynamic Visualization:** Generates real-time plots of temperature profiles.
* **Safety Logic:** Built-in error handling for numerical stability.
* **Customizable Parameters:** Easily modify thermal diffusivity, grid density, and boundary temperatures.

## How to Run
1. Clone the repository: `git clone https://github.com/ayancju/HeatDiff1D_FDM.git`.
2. Open `HeatDiff1D_FDM.m` in **MATLAB**.
3. Run the script to view the animated results.
