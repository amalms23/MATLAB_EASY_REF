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

% Example usage:
v = [10 20 30 20 40 50 20 15 25 35];
elements = [20 30 15 60]; % 60 is not in v
new_v = remove_elements(v, elements);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing [20 30 15 60]: ' num2str(new_v)]);

v = 1:10;
elements = 11:15;
new_v = remove_elements(v, elements);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing [11 12 13 14 15]: ' num2str(new_v)]);

v = [1 2 3 4 5];
elements = [2 4];
new_v = remove_elements(v, elements);
disp(['Original vector: ' num2str(v)]);
disp(['Vector after removing [2 4]: ' num2str(new_v)]);

%Example with character array
char_array = ['a','b','c','d','a','b','e'];
chars_to_remove = ['a','c','f'];
new_char_array = remove_elements(char_array, chars_to_remove);
disp(['Original vector: ' char(char_array)]);
disp(['Vector after removing [a c f]: ' char(new_char_array)]);

%Example with row vectors
v_row = [1,2,3,4,5];
elements_row = [2,4];
new_v_row = remove_elements(v_row,elements_row);
disp(['Original vector: ' num2str(v_row)]);
disp(['Vector after removing [2 4]: ' num2str(new_v_row)]);
