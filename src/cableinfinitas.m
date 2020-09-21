function cableinfinitas(ax,ax2,ax3)

    hold(ax, "off")



    %Constantes físicas
    ke = 8.99e9; % Constante de coulomb


    %****************************************************************
    %--Plano yz------------------------------------------------------
    %****************************************************************

    %Posiciones de cargas
    [X, Y, Z] = meshgrid(-40:0.4:40, -1, 1);
    X = [X,X]; %concatenación
    Y = [Y,Z];

    q = zeros(size(Y));
    %Ciclo para asignar valores de carga al vector q
    for k=1:length(Y)/2
        q(k)=2;
    end
    for k=length(Y)/2+1:length(Y)
        q(k)=-2;
    end


    [x,y] = meshgrid(-40:0.4:40, -4:0.4:4);
    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:length(q) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + ke * q(i) ./ sqrt((X(i)-x).^2+(Y(i)-y).^2);
    end


    contour(ax,x,y,V,60); %Se grafican las líneas equipotenciales
    hold(ax, "on")

    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(ax, x,y,-Ex,-Ey);
    hold(ax, "on")

    %Figura que encierra a las cargas
    rectangle(ax,'Position',[-3,-1.2,6,0.35],'FaceColor','w','EdgeColor','w')
    rectangle(ax,'Position',[-3,0.85,6,0.35],'FaceColor','w','EdgeColor','w')

    %Límites de gráficos de figura
    yline(ax,-1.1,'-');
    yline(ax,-0.9,'-');
    yline(ax,0.9,'-');
    yline(ax,1.1,'-');
    xlim(ax,[-3 3]);
    ylim(ax,[-3 3]);
    hold(ax, "on")
    grid(ax, "on")

    %ciclo que grafica las cargas dependiendo de si es negativa o positiva
    for j=1:length(X)
        if j<=length(X)/2
            plot(ax,X(j),Y(j),'.','MarkerSize',20, 'Color', 'r');
        else
            plot(ax, X(j),Y(j),'.','MarkerSize',20, 'Color', 'b');
        end
        hold(ax, "on")
    end
    hold(ax, "on")
    %datos de la gráfica
    title(ax,"Cables infinitos planos yz")
    xlabel(ax,"Eje y")
    ylabel(ax,"Eje z")


    %****************************************************************
    %--Plano xy------------------------------------------------------
    %****************************************************************
    %Posiciones de cargas
    [X, Y, Z] = meshgrid(-40:0.4:40, 0,0);
    X = [X,X]; %concatenación
    Y = [Y,Z];

    q = zeros(size(Y));
    %Ciclo para asignar valores de carga al vector q
    for k=1:length(Y)/2
        q(k)=-2;
    end


    [x,y] = meshgrid(-40:0.4:40, -4:0.4:4);
    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:length(q) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + k * q(i) ./ sqrt((X(i)-x).^2+(Y(i)-y).^2);
    end


    contour(ax2, x,y,V,60); %Se grafican las líneas equipotenciales
    hold(ax2, "on")

    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(ax2, x,y,-Ex,-Ey);
    hold(ax2, "on")

    %Figura que encierra a las cargas
    rectangle(ax2,'Position',[-3,-0.15,6,0.35],'FaceColor','w','EdgeColor','k')

    %Límites de gráficos de figura
    xlim(ax2,[-3 3]);
    ylim(ax2,[-3 3]);
    hold(ax2, "on")
    grid(ax2, "on")

    %ciclo que grafica las cargas dependiendo de si es negativa o positiva
    for j=1:length(X)
        plot(ax2,X(j),Y(j),'.','MarkerSize',20, 'Color', 'b');
        hold(ax2, "on")
    end

    %datos de la gráfica
    title(ax2,"Cables infinitos plano xy")
    xlabel(ax2,"Eje x")
    ylabel(ax2,"Eje y")


    %****************************************************************
    %--Plano xz------------------------------------------------------
    %****************************************************************
    point3 = [0,-1; 0,1]; %Posición de las cargas
    q3 = [2; -2]; %Valor de las cargas
    q4 = [2; 2];
    [x,y] = meshgrid(-4:0.4:4, -4:0.4:4);

    % ------ Cargas puntuales de signos opuestos --------------------------
    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q3) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + k * q3(i) ./ sqrt((point3(i,1)-x).^2+(point3(i,2)-y).^2);
    end


    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(ax3,x,y,-Ex,-Ey);
    hold(ax3, "on")

    contour(ax3,x,y,V,60); %Se grafican las líneas equipotenciales
    hold(ax3, "on")
    axis(ax3, "square")

    %Gráficas de las posiciones de las cargas
    plot(ax3,point3(1,1),point3(1,2),'.','MarkerSize',20, 'Color', 'r');
    hold(ax3, "on")
    plot(ax3,point3(2,1),point3(2,2),'.','MarkerSize',20, 'Color', 'b');
    hold(ax2, "on")

    %Datos de la gráfica
    title(ax3,"Cables plano xz")
    xlabel(ax3,"Eje x")
    ylabel(ax3,"Eje z")
    clear, clc;
end
