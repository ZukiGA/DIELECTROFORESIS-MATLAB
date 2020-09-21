function placasFinitass(AX1, AX2, AX3)
    %Constantes físicas
    ke = 8.99e9; % Constante de coulomb


    %****************************************************************
    %--Plano yz------------------------------------------------------
    %****************************************************************

    point = [0,0; 0,0.5; 0,1; 0,1.5; 0,2; 0, 2.5; 2,0; 2,0.5; 2,1; 2,1.5; 2,2; 2, 2.5]; %Posición de las cargas
    q = [2; 2; 2; 2; 2; 2; -2; -2; -2; -2; -2; -2]; %Valor de las cargas
    [x,y] = meshgrid(-3:0.4:5, -3:0.4:5);
    xl = [-0.1,-0.1]; yl = [-0.2,2.7];
    x2 = [0.1,0.1]; y2 = [-0.2,2.7];
    x3 = [1.9,1.9]; y3 = [-0.2,2.7];
    x4 = [2.1,2.1]; y4 = [-0.2,2.7];

    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + ke * q(i) ./ sqrt((point(i,1)-x).^2+(point(i,2)-y).^2);
    end

    
    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(AX1,x,y,-Ex,-Ey); 
    hold(AX1,"on")

    contour(AX1,x,y,V,75); %Se grafican las líneas equipotenciales
    hold(AX1,"on")
    axis(AX1,"square")

    %Figura que encierra a las cargas
    rectangle(AX1,'Position',[-0.15,-0.2,0.25,2.9],'FaceColor','w','EdgeColor','w')
    rectangle(AX1,'Position',[1.85,-0.2,0.25,2.9],'FaceColor','w','EdgeColor','w')

    %gráficas de las cargas dependiendo de si es negativa o positiva
    plot(AX1,point(1,1),point(1,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(2,1),point(2,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(3,1),point(3,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(4,1),point(4,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(5,1),point(5,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(6,1),point(6,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX1,"on")
    plot(AX1,point(7,1),point(7,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    plot(AX1,point(8,1),point(8,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    plot(AX1,point(9,1),point(9,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    plot(AX1,point(10,1),point(10,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    plot(AX1,point(11,1),point(11,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    plot(AX1,point(12,1),point(12,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX1,"on")
    line(AX1,xl,yl,'Color','k');
    hold(AX1,"on")
    line(AX1,x2,y2,'Color','k');
    hold(AX1,"on")
    line(AX1,x3,y3,'Color','k');
    hold(AX1,"on")
    line(AX1,x4,y4,'Color','k');
    axis(AX1,"square")

    %Límites de vista
    xlim(AX1,[-2 4]);
    ylim(AX1,[-2 4]);

    %Datos de la gráfica
    title(AX1,"Placas finitas plano yz")
    xlabel(AX1,"Eje y")
    ylabel(AX1,"Eje z")


    %****************************************************************
    %--Plano xy------------------------------------------------------
    %****************************************************************

    point2 = [0,0.5; 0,1; 0,1.5; 0,2; 2,0.5; 2,1; 2,1.5; 2,2]; %Posición de las cargas
    q2 = [2; 2; 2; 2; -2; -2; -2; -2]; %Valor de las cargas
    xl = [-0.1,-0.1]; yl = [0.4,2.1];
    x2 = [0.1,0.1]; y2 = [0.4,2.1];
    x3 = [1.9,1.9]; y3 = [0.4,2.1];
    x4 = [2.1,2.1]; y4 = [0.4,2.1];

    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q2) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + ke * q2(i) ./ sqrt((point2(i,1)-x).^2+(point2(i,2)-y).^2);
    end

    
    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(AX2,x,y,-Ex,-Ey); 
    hold(AX2,"on")

    contour(AX2,x,y,V,75); %Se grafican las líneas equipotenciales
    hold(AX2,"on")
    axis(AX2, "square")

    %Figura que encierra a las cargas
    rectangle(AX2,'Position',[-0.15,0.4,0.25,1.8],'FaceColor','w','EdgeColor','w')
    rectangle(AX2,'Position',[1.85,0.4,0.3,1.8],'FaceColor','w','EdgeColor','w')

    %gráficas de las cargas dependiendo de si es negativa o positiva
    plot(AX2,point2(1,1),point2(1,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX2,"on")
    plot(AX2,point2(2,1),point2(2,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX2,"on")
    plot(AX2,point2(3,1),point2(3,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX2,"on")
    plot(AX2,point2(4,1),point2(4,2),'.','MarkerSize',20, 'Color', 'r');
    hold(AX2,"on")
    plot(AX2,point2(5,1),point2(5,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX2,"on")
    plot(AX2,point2(6,1),point2(6,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX2,"on")
    plot(AX2,point2(7,1),point2(7,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX2,"on")
    plot(AX2,point2(8,1),point2(8,2),'.','MarkerSize',20, 'Color', 'b');
    hold(AX2,"on")
    line(AX2,xl,yl,'Color','k');
    hold(AX2,"on")
    line(AX2,x2,y2,'Color','k');
    hold(AX2,"on")
    line(AX2,x3,y3,'Color','k');
    hold(AX2,"on")
    line(AX2,x4,y4,'Color','k');
    axis(AX2, "square")

    %Límites de vista
    xlim(AX2,[-2 4]);
    ylim(AX2,[-2 4]);

    %Datos de la gráfica
    title(AX2,"Placas finitas plano xy")
    xlabel(AX2,"Eje x")
    ylabel(AX2,"Eje y")


    %****************************************************************
    %--Plano xz------------------------------------------------------
    %****************************************************************
    point3 = [0,0; 0,0.5; 0,1; 0,1.5; 0,2; 0, 2.5; 
        0.65,0; 0.65,0.5; 0.65,1; 0.65,1.5; 0.65,2; 0.65, 2.5;
        1.3,0; 1.3,0.5; 1.3,1; 1.3,1.5; 1.3,2; 1.3, 2.5;
        2,0; 2,0.5; 2,1; 2,1.5; 2,2; 2, 2.5]; %Posición de las cargas
    q3 = [2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2; 2]; %Valor de las cargas

    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q3) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + ke * q3(i) ./ sqrt((point3(i,1)-x).^2+(point3(i,2)-y).^2);
    end

    
    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(AX3,x,y,-Ex,-Ey); 
    hold(AX3,"on")

    contour(AX3,x,y,V,75); %Se grafican las líneas equipotenciales
    hold(AX3,"on")
    axis(AX3,"square")

    %Figura que encierra a las cargas
    rectangle(AX3,'Position',[-0.2,-0.2,2.4,2.85],'FaceColor','w','EdgeColor','k')

    %gráficas de las cargas dependiendo de si es negativa o positiva
    for j=1:size(point3)
        plot(AX3,point3(j,1),point3(j,2),'.','MarkerSize',20, 'Color', 'r');
        hold(AX3,"on")
    end

    axis(AX3,"square")

    %Límites de vista
    xlim(AX3,[-2 4]);
    ylim(AX3,[-2 4]);

    %Datos de la gráfica
    title(AX3,"Placas finitas plano xz")
    xlabel(AX3,"Eje x")
    ylabel(AX3,"Eje z")
    clear, clc;
end