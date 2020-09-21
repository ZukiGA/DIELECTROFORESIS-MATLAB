function placasTrayectoria(axes)

    
    hold(axes,"off")

    %Gráficas de límites de placas
    xline(axes,1,'-','Color','r','LineWidth',1.5);
    xline(axes,1.3,'-','Color','r','LineWidth',1.5);
    xline(axes,3.35,'-','Color','b','LineWidth',1.5);
    xline(axes,3.65,'-','Color','b','LineWidth',1.5);
    xlim(axes,[0 5])
    ylim(axes,[-5 5])
    hold(axes, "on")
    grid(axes, "on")

    %Constantes físicas
    k=8.99e9;
    e0=8.854e-12;
    %Densidad eléctrica de la placa
    o1=4.48e-10;
    o2=o1;
    %Magnitud del campo eléctrico
    E=-((o1/e0)+(o2/e0));

    %Datos de la partícula (carga de prueba)
    q=1.5e-19; %Coulombs
    m=8.3e-17; %Kg
    ang=45; %Ángulo
    x0=2.7; %Posición inicial en x
    y0=5.1; %Posición inicial en y
    v0=1.1; %m/s
    v0x=v0*cos(ang); %Velocidad inicial en la componente x
    v0y=v0*sin(ang); %Velocidad inicial en la componente y

    %Fórmulas físicas
    [x,y]=meshgrid(1.3:0.5:3.1,-5:0.5:5);
    [x1,y1]=meshgrid(1.3:0.7:3.5,-5:0.5:5);
    ef1=x-x+o1./e0;
    ef2=x-x+o2./e0;
    v=0*y;
    u=ef1+ef2;

    V = zeros(size(x)); % Se crea una matriz de ceros con las dimensiones del meshgrid
    % V = qk/r
    % E = -grad(V)
    for i = 1:size(o1) % Se llena la matriz con los valores de potencial eléctrico para cada punto del meshgrid
        V = (o1*k)./x;
    end

    contour(axes,x1,y1,V,25); %Se grafican las líneas equipotenciales
    hold(axes, "on")

    %Se gráfica el campo eléctrico con quiver
    quiver(axes,x,y,u,v,'b');
    hold(axes, "on")

    %Trayectoria de la partícula en un campo eléctrico
    a=(q*E)/m; %Aceleración
    t=0:0.1:7.3; %Tiempo
    %F=qE
    px=x0-((v0x.*t)+((a.*(t.^2))./2));
    py=y0-(v0y.*t);
    plot(axes,px,py,"k",'LineWidth',3)
    hold(axes, "on")

    %Datos de la gráfica
    title(axes,"Trayectoria de una placa en placas infinitas")
    xlabel(axes,"Eje x")
    ylabel(axes,"Eje y")
    clear,clc;
end