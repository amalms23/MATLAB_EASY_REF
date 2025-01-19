function new_vector = remove_element(vector, element_to_remove)
% Removes all occurrences of a specific element from a vector.
%
% Args:
%   vector: The input vector.
%   element_to_remove: The element to remove.
%
% Returns:
%   new_vector: The vector with all occurrences of the element removed.
%               Returns the original vector if the element is not found.

    if ~isvector(vector)
        error('Input must be a vector.');
    end

    % Use logical indexing to find and remove the element
    indices_to_remove = vector == element_to_remove;

    if any(indices_to_remove) % Check if any indices were found
        new_vector = vector(~indices_to_remove); % Keep only the elements where the condition is false
    else
        new_vector = vector; % Return original vector if element not found
        fprintf('Element %g not found in the vector.\n', element_to_remove);
    end
end

% Example usage:
v = [10 20 30 20 40 50 20];
element = 20;
new_v = remove_element(v, element);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing ' num2str(element) ': ' num2str(new_v)]);

v = [1 2 3 4 5];
element = 6;
new_v = remove_element(v, element);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing ' num2str(element) ': ' num2str(new_v)]);

v = [1 2 3 4 5];
element = 3;
new_v = remove_element(v, element);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing ' num2str(element) ': ' num2str(new_v)]);

%Example with character array
char_array = ['a','b','c','d','a'];
char_to_remove = 'a';
new_char_array = remove_element(char_array, char_to_remove);
disp(['Original vector: ' char(char_array)]);
disp(['Vector after removing ' char_to_remove ': ' char(new_char_array)]);
