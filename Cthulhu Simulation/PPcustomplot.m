function  PPcustomplot(x,y,xlim_low,xlim_high,ylim_low,ylim_high,x_tick,y_tick,Title,xaxis,yaxis,style,width)

 ScreenSize = get(0,'ScreenSize');
    %[]Determines the location and dimensions of the current monitor.
    
    Window = figure( ...
        'Color','w', ...                %[]Adjusts the background color of the window.
        'Name',Title, ...   %[]Adjusts the name of the current window.
        'NumberTitle','Off', ...        %[]Turns the number title of the current window off.
        'OuterPosition',ScreenSize);    %[]Adjusts the window's location and dimensions.
    %[]Opens a new window and adjusts its properties.
    
    Axes = axes( ...
        'FontName','Arial', ...     %[]Adjusts the font name for the axes.
        'FontSize',24, ...          %[]Adjusts the font size for the axes.
        'FontWeight','Bold', ...    %[]Adjusts the font weight for the axes.
        'NextPlot','Add', ...       %[]New plots will not erase old ones.
        'Parent',Window, ...        %[]Specifies the window where the axes should be added.
        'XGrid','On', ...           %[]Turns the x-grid on.
        'YGrid','On', ...           %[]Turns the y-grid on.
        'PlotBoxAspectRatioMode','auto',... 
        'XLim',[xlim_low,xlim_high], ...          %[]Adjusts the limits of the x-axis.
        'YLim',[ylim_low,ylim_high], ...        %[]Adjusts the limits of the y-axis.
        'XTick',xlim_low:x_tick:xlim_high, ...       %[]Adjusts the tick mark location for the x-axis.
        'YTick',ylim_low:y_tick:ylim_high);         %[]Adjusts the tick mark location for the y-axis.
    %[]Adds an axes to the specified window and adjusts its properties.
    

        
    plot(x,y, ...
        'Color','k', ...            %[]Adjusts the color of the plot.
        'LineStyle',style, ...     %[]A line will not connect the markers.
        'Parent',Axes,...             %[]Specifies the axes where the plot should be added.
        'LineWidth',width);
       %'Marker','.', ...           %[]Specifies the marker type.
    %[]Adds a plot to the specified axes and adjusts its properties.   
    
    title( ...
        Title, ...   %[]Plot title.
        'FontSize',30, ...                  %[]Adjusts the font size of the title.
        'Parent',Axes);                     %[]Specifies the axes where the title should be added.
    %[]Adds a title to the specified axes and adjusts its properties.
    
    xlabel( ...
        xaxis, ...         %[]Label name.
        'FontSize',26, ...      %[]Adjusts the font size of the title.
        'Parent',Axes);         %[]Specifies the axes where the label should be added.
    %[]Adds a label to the specified x-axis and adjusts its properties.
    
    ylabel( ...'
        yaxis, ... %[]Label name.
        'FontSize',26, ...                  %[]Adjusts the font size of the title.
        'Parent',Axes);                     %[]Specifies the axes where the label should be added.
    %[]Adds a label to the specified y-axis and adjusts its properties.
grid on

end