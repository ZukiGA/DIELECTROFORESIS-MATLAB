function placaFinita(ax,largo)
    hold(ax, "off")
    largo = largo/2;
    %Constantes físicas
    ke = 8.99e9; % Constante de coulomb
    %Posiciones de las cargas
    [X1,Y1] = meshgrid(0, -2:0.4:2);
    [X2,Y2] = meshgrid(2, -largo:0.4:largo);
    Y = cat(1,Y1,Y2);
    X = cat(1,X1,X2); %concatenación

    q = zeros(size(Y)); 
    %Ciclo para asignar valores de carga al vector q
    for k=1:length(Y1)
        q(k)=2;
    end
    for k=length(Y1)+1:length(Y)
        q(k)=-2;
    end

    [x,y] = meshgrid(-3:0.4:4.5, -3-largo:0.4:largo+3);
    xl = [-0.1,-0.1]; yl = [-2.2,2.2];
    x2 = [0.1,0.1]; y2 = [-2.2,2.2];
    x3 = [1.9,1.9]; y3 = [-0.2-largo,largo+0.2];
    x4 = [2.1,2.1]; y4 = [-0.2-largo,largo+0.2];

    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(q) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = V + ke * q(i) ./ sqrt((X(i)-x).^2+(Y(i)-y).^2);
    end

    [Ex,Ey]=gradient(V); %Se crea el campo gradiente y se grafica con quiver
    quiver(ax,x,y,-Ex,-Ey);
    hold(ax, "on")
    %----------------------------------------------------------------
    %------------------- Placas finitas 2D --------------------------

    contour(ax,x,y,V,75); %Se grafican las líneas equipotenciales
    hold(ax, "on")
    axis(ax, "square")

    %Figura que encierra a las cargas
    rectangle(ax,'Position',[-0.15,-0.2,0.25,1.6],'FaceColor','w','EdgeColor','w')
    rectangle(ax,'Position',[1.85,-0.2,0.25,largo+.4],'FaceColor','w','EdgeColor','w')

    %gráficas de las cargas dependiendo de si es negativa o positiva
    for j=1:length(X)
        if j<=length(X1)
            plot(ax,X(j),Y(j),'.','MarkerSize',20, 'Color', 'r');
        else
            plot(ax,X(j),Y(j),'.','MarkerSize',20, 'Color', 'b');
        end
        hold(ax, "on")
    end

    line(ax,xl,yl,'Color','k');
    hold(ax, "on")
    line(ax,x2,y2,'Color','k');
    hold(ax, "on")
    line(ax,x3,y3,'Color','k');
    hold(ax, "on")
    line(ax,x4,y4,'Color','k');
    axis(ax, "square")

    %datos de la gráfica
    title(ax,"Electrodos")
    xlabel(ax,"Eje x")
    ylabel(ax,"Eje y")
    clear clc;
end