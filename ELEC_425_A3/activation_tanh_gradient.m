function tanh_gradient = activation_tanh_gradient(output_val)
    tanh_gradient = 1 - output_val.^2;
end