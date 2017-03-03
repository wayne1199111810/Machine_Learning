function drawResult( x, y, w, name)
    I1 = find(y<0.5);
    I2 = find(y>=0.5);
    x1 = linspace(-4,7,100)';
    x2 = (-w(1)*ones(100,1) - w(2)*x1)./w(3);
    figure
    scatter(x(I1,2), x(I1, 3),'ro');
    hold on;
    scatter(x(I2,2), x(I2, 3),'bx');
    plot(x1,x2,'g');
    hold off;
    xlabel('x1');
    ylabel('x2');
    title(name);
end

