# MATLAB_EASY_REF
some most used matlab functions for my personal reference. Others also may use:))
# Finding Asymptotes of x vs. P

This code uses MATLAB's Symbolic Math Toolbox to analytically find the vertical and horizontal asymptotes of the relationship between variables *x* and *P*, defined by the equation: x = ε * P / (2kL - P)
where:

*   *x*: Dependent variable.
*   *P*: Independent variable (that we are trying to express in terms of x).
*   *ε* (epsilon): A constant.
*   *k*: A constant.
*   *L*: A constant.

We rearrange the equation to solve for P: P = (2kLx) / (ε + x)
## How to use the code (without cloning):

1.  **Open MATLAB.**

2.  **Create a new MATLAB script** named `find_asymptotes.m`.

3.  **Copy the code provided below** into the script.

4.  **Run the script:**

    ```matlab
    find_asymptotes
    ```

## `find_asymptotes.m`

```matlab
syms x epsilon k L P; % Define symbolic variables

% Your equation (rearranged to solve for P)
P = (2*k*L*x) / (epsilon + x);

% Find vertical asymptotes (where the denominator is zero)
vertical_asymptote = solve(denom(P) == 0, x); % denom extracts the denominator

% Find horizontal asymptotes (limit as x approaches infinity)
horizontal_asymptote = limit(P, x, inf);

% Display the results (symbolic)
disp(['Symbolic Vertical Asymptote(s): x = ' char(vertical_asymptote)]);
disp(['Symbolic Horizontal Asymptote: P = ' char(horizontal_asymptote)]);

% Substitute numerical values for the constants
epsilon_val = 0.1;
k_val = 50;
L_val = 5;

vertical_asymptote_val = subs(vertical_asymptote,{epsilon,k,L},{epsilon_val,k_val,L_val});
horizontal_asymptote_val = subs(horizontal_asymptote,{epsilon,k,L},{epsilon_val,k_val,L_val});

% Display the results (numerical)
disp(['Numerical Vertical Asymptote(s): x = ' char(vertical_asymptote_val)]);
disp(['Numerical Horizontal Asymptote: P = ' char(horizontal_asymptote_val)]);
