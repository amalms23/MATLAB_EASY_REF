# MATLAB_EASY_REF
some most used matlab functions for my personal reference. Others also may use:))

Read through - you will find the details of all the files in this repo.


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
```


# Vector Element Removal in MATLAB

This file contains the code for a MATLAB function named `remove_elements` that removes all occurrences of specified elements from a given vector.

## Functionality

The `remove_elements` function efficiently removes elements from a vector based on a provided list of elements to remove. It works with both numeric vectors and character arrays (which are also vectors in MATLAB).

## How to Use (Without Cloning)

1.  **Create a new MATLAB function file** named `remove_elements.m`.

2.  **Copy the code provided below** into the function file.

3.  **Save the file.**

4.  **Call the function** from your MATLAB scripts or the command window using the following syntax:

    ```matlab
    new_vector = remove_elements(vector, elements_to_remove);
    ```

    *   `vector`: The input vector from which elements will be removed.
    *   `elements_to_remove`: A vector containing the elements to be removed from the `vector`.
    *   `new_vector`: The output vector containing the elements that were not removed.

## Code

```matlab
function new_vector = remove_elements(vector, elements_to_remove)
% Removes all occurrences of a set of elements from a vector.
%
% Args:
%   vector: The input vector.
%   elements_to_remove: A vector containing the elements to remove.
%
% Returns:
%   new_vector: The vector with all occurrences of the specified elements removed.
%               Returns the original vector if none of the elements are found.

    if ~isvector(vector) || ~isvector(elements_to_remove)
        error('Inputs must be vectors.');
    end

    if isrow(vector)
        vector = vector(:); %Force column vector for ismember to work reliably
    end
    if isrow(elements_to_remove)
        elements_to_remove = elements_to_remove(:);
    end

    % Use ismember to find indices of elements to remove
    indices_to_remove = ismember(vector, elements_to_remove);

    if any(indices_to_remove)
        new_vector = vector(~indices_to_remove);
        if isrow(vector)
            new_vector = new_vector';
        end
    else
        new_vector = vector;
        fprintf('None of the specified elements were found in the vector.\n');
    end
end
```
**Examples:**

**Example 1: Removing multiple occurrences of existing elements**

```matlab
v = [10 20 30 20 40 50 20 15 25 35];
elements = [20 30 15 60]; % 60 is not in v
new_v = remove_elements(v, elements);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing [20 30 15 60]: ' num2str(new_v)]);

% Example 1: Removing multiple occurrences of existing elements

v = [10 20 30 20 40 50 20 15 25 35];

elements = [20 30 15 60]; % 60 is not in v

new_v = remove_elements(v, elements);

disp(['Original vector: ' num2str(v)]);

disp(['Vector after removing [20 30 15 60]: ' num2str(new_v)]);
```


** Example 2: Removing elements that are not present**
```matlab
v = 1:10;

elements = 11:15;

new_v = remove_elements(v, elements);

disp(['Original vector: ' num2str(v)]);

disp(['Vector after removing [11 12 13 14 15]: ' num2str(new_v)]);
```


**% Example 3: Removing some elements**
```matlab

v = [1 2 3 4 5];

elements = [2 4];

new_v = remove_elements(v, elements);

disp(['Original vector: ' num2str(v)]);

disp(['Vector after removing [2 4]: ' num2str(new_v)]);
```


**% Example 4: Using with character arrays**
```matlab

char_array = ['a','b','c','d','a','b','e'];

chars_to_remove = ['a','c','f'];

new_char_array = remove_elements(char_array, chars_to_remove);

disp(['Original vector: ' char(char_array)]);

disp(['Vector after removing [a c f]: ' char(new_char_array)]);
```


**% Example 5: Using with row vectors**
```matlab

v_row = [1,2,3,4,5];

elements_row = [2,4];

new_v_row = remove_elements(v_row,elements_row);

disp(['Original vector: ' num2str(v_row)]);

disp(['Vector after removing [2 4]: ' num2str(new_v_row)]);
```
