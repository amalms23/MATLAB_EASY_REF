syms x epsilon k L P; % Define symbolic variables

% Your equation (rearranged to solve for P)
P = (2*k*L*x) / (epsilon + x);

% Find vertical asymptotes (where the denominator is zero)
vertical_asymptote = solve(denom(P) == 0, x); % denom extracts the denominator

% Find horizontal asymptotes (limit as x approaches infinity)
horizontal_asymptote = limit(P, x, inf);

% Display the results
disp(['Vertical Asymptote(s): x = ' char(vertical_asymptote)]);
disp(['Horizontal Asymptote: P = ' char(horizontal_asymptote)]);

%Substitute the values of the variables
epsilon_val = 0.1;
k_val = 50;
L_val = 5;

vertical_asymptote_val = subs(vertical_asymptote,{epsilon,k,L},{epsilon_val,k_val,L_val});
horizontal_asymptote_val = subs(horizontal_asymptote,{epsilon,k,L},{epsilon_val,k_val,L_val});

disp(['Vertical Asymptote(s): x = ' char(vertical_asymptote_val)]);
disp(['Horizontal Asymptote: P = ' char(horizontal_asymptote_val)]);
