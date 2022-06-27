
function [Y1, Y2] = DE_runge(y1_0, y2_0, a, b, h, eqtn)
    x = a:h:b;
    Y1(1) = y1_0;
    Y2(1) = y2_0;
    for i = 2:1:length(x)
        [K11(i-1), K21(i-1)] = eqtn(x(i-1), Y1(i-1), Y2(i-1), h);
        [K12(i-1), K22(i-1)] = eqtn(x(i-1) + h/2, Y1(i-1) + K11(i-1) / 2, Y2(i-1) + K21(i-1) / 2, h);
        [K13(i-1), K23(i-1)] = eqtn(x(i-1) + h/2, Y1(i-1) + K12(i-1) / 2, Y2(i-1) + K22(i-1) / 2, h);
        [K14(i-1), K24(i-1)] = eqtn(x(i-1) + h, Y1(i-1) + K13(i-1), Y2(i-1) + K23(i-1), h);
        Y1(i) = Y1(i-1) + (K11(i-1) + 2 * K12(i-1) + 2 * K13(i-1) + K14(i-1)) / 6
        Y2(i) = Y2(i-1) + (K21(i-1) + 2 * K22(i-1) + 2 * K23(i-1) + K24(i-1)) / 6
    end 
            K11(length(x)) = K11(length(x) - 1) + 0.0001
            K12(length(x)) = K12(length(x) - 1) + 0.0001
            K13(length(x)) = K13(length(x) - 1) + 0.0001
            K14(length(x)) = K14(length(x) - 1) + 0.0001
            K21(length(x)) = K21(length(x) - 1) + 0.0001
            K22(length(x)) = K22(length(x) - 1) + 0.0001
            K23(length(x)) = K23(length(x) - 1) + 0.0001
            K24(length(x)) = K24(length(x) - 1) + 0.0001
            
        plt = figure('Name', 'solution')
            plot(x, Y1, '.', x, Y2, '-.')
            xlabel('x')
            ylabel('y(x)')
            ylim([-100 20000])
            xlim([0 5])
            
        pltK1 = figure('Name', 'coefficients')
            plot(x, K11, x, K12, x, K13, x, K14)
            xlabel('x')
            ylabel('K_1i(x)')
            legend('K11', 'K12', 'K13', 'K14')
            ylim([-50 1700])
            xlim([0 5])
        pltK2 = figure('Name', 'coefficients')
            plot(x, K21, x, K22, x, K23, x, K24)
            xlabel('x')
            ylabel('K_2i(x)')
            legend('K21', 'K22', 'K23', 'K24')
            ylim([-50 1700])
            xlim([0 5])
        
end
