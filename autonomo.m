% Punto 1
% polyfit: Se utiliza para ajustar un polinomio a un conjunto de datos mediante el método de mínimos cuadrados.
% polyval: Evalúa un polinomio dado en un conjunto de valores.

% Punto 2
%
load census;

% Punto 3
p1 = polyfit(cdate, pop, 1);
p2 = polyfit(cdate, pop, 2);
p3 = polyfit(cdate, pop, 3);

% Punto 4
scatter(cdate, pop); % Gráfico datos originales
hold on;

% Graficar los ajustes polinomiales
xfit = min(cdate):1:max(cdate); % Rango extendido para la línea de ajuste
plot(xfit, polyval(p1, xfit), 'b'); % Ajuste lineal
plot(xfit, polyval(p2, xfit), 'r'); % Ajuste cuadrático
plot(xfit, polyval(p3, xfit), 'g'); % Ajuste cúbico

hold off;
legend('Datos', 'Ajuste lineal', 'Ajuste cuadrático', 'Ajuste cúbico');
xlabel('Año');
ylabel('Población');
title('Ajuste Polinomial');

% Punto 5: Calcular el error cuadrático medio para cada ajuste polinomial
mse_p1 = mean((pop - polyval(p1, cdate)).^2);
mse_p2 = mean((pop - polyval(p2, cdate)).^2);
mse_p3 = mean((pop - polyval(p3, cdate)).^2);

fprintf('Error cuadrático medio para ajuste lineal: %.2f\n', mse_p1);
fprintf('Error cuadrático medio para ajuste cuadrático: %.2f\n', mse_p2);
fprintf('Error cuadrático medio para ajuste cúbico: %.2f\n', mse_p3);

% Conclusión
if mse_p1 < mse_p2 && mse_p1 < mse_p3
    fprintf('Los datos se ajustan mejor a una recta.\n');
elseif mse_p2 < mse_p1 && mse_p2 < mse_p3
    fprintf('Los datos se ajustan mejor a una función cuadrática.\n');
else
    fprintf('Los datos se ajustan mejor a una función cúbica.\n');
end
