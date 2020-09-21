function cargaNegativa(ax)
    hold(ax,"off")
    k = 8.99e9; % Constante de coulomb
    point = [-1,0; 1,0]; %Posición de las cargas
    q2 = [2; 2]; %Valor de las cargas

    [x,y] = meshgrid(-3:0.4:3, -3:0.4:3);

    % ------ Cargas puntuales de signos iguales --------------------------
    V2 = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q2) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V2 = V2 + k * q2(i) ./ sqrt((point(i,1)-x).^2+(point(i,2)-y).^2);
    end

    [Ex2,Ey2]=gradient(V2); %Se crea el campo gradiente y se grafica con quiver
    
    quiver(ax,x,y,-Ex2,-Ey2); 
    hold(ax, "on")
    

    contour(ax,x,y,V2,50); %Se grafican las líneas equipotenciales
    hold(ax, "on")
    axis(ax, "square")

    %Gráficas de las posiciones de las cargas
    plot(ax,point(1,1),point(1,2),'.','MarkerSize',20, 'Color', 'r');
    hold(ax, "on")
    plot(ax,point(2,1),point(2,2),'.','MarkerSize',20, 'Color', 'r');
    hold(ax, "on")

    %Datos de la gráfica
    title(ax,"2 carga puntuales de signos iguales")
    xlabel(ax,"Eje x")
    ylabel(ax,"Eje y")
end
