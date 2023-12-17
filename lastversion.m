function lastversion
    % main figure
    figure('Position', [400, 400, 800, 400], 'Name', 'Electrical Force Calculater', 'NumberTitle', 'off');

    %outermost frame panel
    outerPanel = uipanel('Title', 'Button Group', 'Position', [0.05, 0.2, 0.9, 0.7]);

    % first nested frame panel on the left
    innerPanel1 = uipanel('Parent', outerPanel, 'Title', 'First Charge', 'Position', [0.05, 0.15, 0.4, 0.8],'FontWeight', 'bold');
    uicontrol('Parent', innerPanel1,'Style', 'text', 'String', 'Position of Charge', 'Position', [60, 160, 150, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    
    uicontrol('Parent', innerPanel1,'Style', 'text', 'String', 'X :', 'Position', [20, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    x1_edit = uicontrol('Parent', innerPanel1,'Style', 'edit', 'Position', [50, 130, 50, 20]);
    
    uicontrol('Parent', innerPanel1,'Style', 'text', 'String', 'Y :', 'Position', [110, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    y1_edit = uicontrol('Parent', innerPanel1,'Style', 'edit', 'Position', [140, 130, 50, 20]);
    
    uicontrol('Parent', innerPanel1,'Style', 'text', 'String', 'Z :', 'Position', [200, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    z1_edit = uicontrol('Parent', innerPanel1,'Style', 'edit', 'Position', [230, 130, 50, 20]);

    
    uicontrol('Parent', innerPanel1,'Style', 'text', 'String', 'Value of Charge (C) :', 'Position', [20, 20, 70, 60], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    C1_edit = uicontrol('Parent', innerPanel1,'Style', 'edit', 'Position', [100, 20, 80, 60]);



    % second nested frame panel on the right
    innerPanel2 = uipanel('Parent', outerPanel, 'Title', 'Second Charge', 'Position', [0.55, 0.15, 0.4, 0.8],'FontWeight', 'bold');
    uicontrol('Parent', innerPanel2,'Style', 'text', 'String', 'Position of Charge', 'Position', [60, 160, 150, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    
    uicontrol('Parent', innerPanel2,'Style', 'text', 'String', 'X :', 'Position', [20, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    x2_edit = uicontrol('Parent', innerPanel2,'Style', 'edit', 'Position', [50, 130, 50, 20]);
    
    uicontrol('Parent', innerPanel2,'Style', 'text', 'String', 'Y :', 'Position', [110, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    y2_edit = uicontrol('Parent', innerPanel2,'Style', 'edit', 'Position', [140, 130, 50, 20]);
    
    uicontrol('Parent', innerPanel2,'Style', 'text', 'String', 'Z :', 'Position', [200, 130, 30, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    z2_edit = uicontrol('Parent', innerPanel2,'Style', 'edit', 'Position', [230, 130, 50, 20]);
    
    uicontrol('Parent', innerPanel2,'Style', 'text', 'String', 'Value of Charge (C) :', 'Position', [20, 20, 70, 60], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    C2_edit = uicontrol('Parent', innerPanel2,'Style', 'edit', 'Position', [100, 20, 80, 60]);
    
    
    %mesafe
    uicontrol('Parent', outerPanel,'Style', 'text', 'String', 'Distance between Charges:', 'Position', [170, 20, 180, 15], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    m_edit = uicontrol('Parent', outerPanel,'Style', 'edit', 'Position', [350, 20, 100, 15]);
    
    
    
    %button below the outer panel
    uicontrol('Style', 'pushbutton', 'String', 'Calculate', 'Position', [450, 45, 100, 30], 'Callback', @calculateButtonCallback,'BackgroundColor','#FFA500');

    %text areas below the button to display calculation results
    uicontrol('Style', 'text', 'String', 'Result: Yükler birbirini', 'Position', [100, 10, 150, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    resultArea1 = uicontrol('Style', 'edit', 'Enable', 'inactive', 'Position', [250, 10, 150, 20]);

    uicontrol('Style', 'text', 'String', 'N kuvvet ile', 'Position', [400, 10, 90, 20], 'HorizontalAlignment', 'center', 'BackgroundColor','blue','ForegroundColor','white');
    resultArea2 = uicontrol('Style', 'edit', 'Enable', 'inactive', 'Position', [490, 10, 100, 20]);


    function calculateButtonCallback(~, ~)
        m = str2double(get(m_edit, 'String'));
        %fprintf('%f',m) NaN

        % Get user input values
        x1 = str2double(get(x1_edit, 'String'));
        y1 = str2double(get(y1_edit, 'String'));
        z1 = str2double(get(z1_edit, 'String'));
        C1 = str2double(get(C1_edit, 'String'));

        x2 = str2double(get(x2_edit, 'String'));
        y2 = str2double(get(y2_edit, 'String'));
        z2 = str2double(get(z2_edit, 'String'));
        C2 = str2double(get(C2_edit, 'String'));

        % Check if inputs are valid numbers
        if any(isnan([C1,C2]))
            msgbox('Please enter valid numerical values for all fields.', 'Error', 'error');
            return;
        end


        if isnan(m)==false
            r = m;

        else
            if any(isnan([x1,y1,z1,x2,y2,z2]))
                msgbox('Please enter valid numerical values for x,y,z fields.', 'Error', 'error');
                return;
            end

            r = sqrt((x2 - x1)^2 + (y2 - y1)^2 + (z2 - z1)^2);

        end

      

        
        % Coulomb's constant
        k = 8.9875e9; % N m^2/C^2

        % Calculate the force using Coulomb's law
        F = k * C1 * C2 / r^2;

        set(resultArea1, 'String', sprintf('%f', F));
        if F<0
            set(resultArea2, 'String', sprintf('ceker'));
        end
        if F>=0
            set(resultArea2, 'String', sprintf('iter'));
        end

end
end