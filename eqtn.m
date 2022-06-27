function [f_1, f_2] = eqtn(x, y_1, y_2, E)
    f_1 = E * (1 * y_1 + y_2 / 0.001);
    f_2 = E * (-1 * y_2 / 0.001);
    
end

