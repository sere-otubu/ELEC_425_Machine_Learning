function gradient = activation_gradient(y)
    gradient = y .* (1 - y);
end