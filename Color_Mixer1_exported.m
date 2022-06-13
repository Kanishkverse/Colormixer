classdef Color_Mixer1_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                  matlab.ui.Figure
        BlueColorValueEditField   matlab.ui.control.NumericEditField
        GreenColorValueEditField  matlab.ui.control.NumericEditField
        RedColorValueEditField    matlab.ui.control.NumericEditField
        ColorMixerLabel  matlab.ui.control.Label
        BlueChannelKnob           matlab.ui.control.Knob
        BlueChannelKnobLabel      matlab.ui.control.Label
        GreenChannelKnob          matlab.ui.control.Knob
        GreenChannelKnobLabel     matlab.ui.control.Label
        RedChannelKnob            matlab.ui.control.Knob
        RedChannelKnobLabel       matlab.ui.control.Label
        ColorMixerLamp            matlab.ui.control.Lamp
        ColorMixerLampLabel       matlab.ui.control.Label
    end

    % Callbacks that handle component events
    methods (Access = private)

        % Callback function: RedChannelKnob, RedColorValueEditField
        function RedChannelKnobValueChanging(app, event)
            changingValue = event.Value;
            app.RedColorValueEditField.Value = changingValue;
            intensity_r = changingValue/256;
            app.ColorMixerLamp.Color = [intensity_r,(app.GreenChannelKnob.Value/256),(app.BlueChannelKnob.Value/256)];

        
            %app.ColorMixerLamp.Color = [app.RedColorValueEditField::];
        end

        % Value changing function: BlueChannelKnob
        function BlueChannelKnobValueChanging(app, event)
            changingValue = event.Value;
            app.BlueColorValueEditField.Value = changingValue;
            intensity_b = changingValue/256;
            app.ColorMixerLamp.Color = [(app.RedChannelKnob.Value/256),(app.GreenChannelKnob.Value/256),intensity_b];
        end

        % Value changing function: GreenChannelKnob
        function GreenChannelKnobValueChanging(app, event)
            changingValue = event.Value;
            app.GreenColorValueEditField.Value =changingValue;
            intensity_g = changingValue/256;
            app.ColorMixerLamp.Color = [(app.RedChannelKnob.Value/256),intensity_g,(app.BlueChannelKnob.Value/256)];
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 604 547];
            app.UIFigure.Name = 'MATLAB App';

            % Create ColorMixerLampLabel
            app.ColorMixerLampLabel = uilabel(app.UIFigure);
            app.ColorMixerLampLabel.HorizontalAlignment = 'right';
            app.ColorMixerLampLabel.Position = [269 296 68 22];
            app.ColorMixerLampLabel.Text = 'Color Mixer';

            % Create ColorMixerLamp
            app.ColorMixerLamp = uilamp(app.UIFigure);
            app.ColorMixerLamp.Position = [229 325 147 147];
            app.ColorMixerLamp.Color = [0 0 0];

            % Create RedChannelKnobLabel
            app.RedChannelKnobLabel = uilabel(app.UIFigure);
            app.RedChannelKnobLabel.BackgroundColor = [1 1 1];
            app.RedChannelKnobLabel.HorizontalAlignment = 'center';
            app.RedChannelKnobLabel.FontWeight = 'bold';
            app.RedChannelKnobLabel.FontColor = [1 0 0];
            app.RedChannelKnobLabel.Position = [62 195 97 22];
            app.RedChannelKnobLabel.Text = 'Red Channel';

            % Create RedChannelKnob
            app.RedChannelKnob = uiknob(app.UIFigure, 'continuous');
            app.RedChannelKnob.Limits = [0 255];
            app.RedChannelKnob.ValueChangingFcn = createCallbackFcn(app, @RedChannelKnobValueChanging, true);
            app.RedChannelKnob.FontWeight = 'bold';
            app.RedChannelKnob.FontColor = [1 0 0];
            app.RedChannelKnob.Position = [50 238 122 122];

            % Create GreenChannelKnobLabel
            app.GreenChannelKnobLabel = uilabel(app.UIFigure);
            app.GreenChannelKnobLabel.BackgroundColor = [1 1 1];
            app.GreenChannelKnobLabel.HorizontalAlignment = 'center';
            app.GreenChannelKnobLabel.FontWeight = 'bold';
            app.GreenChannelKnobLabel.FontColor = [0.0275 0.5098 0.0275];
            app.GreenChannelKnobLabel.Position = [252 43 97 22];
            app.GreenChannelKnobLabel.Text = 'Green Channel';

            % Create GreenChannelKnob
            app.GreenChannelKnob = uiknob(app.UIFigure, 'continuous');
            app.GreenChannelKnob.Limits = [0 255];
            app.GreenChannelKnob.ValueChangingFcn = createCallbackFcn(app, @GreenChannelKnobValueChanging, true);
            app.GreenChannelKnob.FontWeight = 'bold';
            app.GreenChannelKnob.FontColor = [0.0157 0.4118 0.0157];
            app.GreenChannelKnob.Position = [240 86 122 122];

            % Create BlueChannelKnobLabel
            app.BlueChannelKnobLabel = uilabel(app.UIFigure);
            app.BlueChannelKnobLabel.BackgroundColor = [1 1 1];
            app.BlueChannelKnobLabel.HorizontalAlignment = 'center';
            app.BlueChannelKnobLabel.FontWeight = 'bold';
            app.BlueChannelKnobLabel.FontColor = [0 0.4471 0.7412];
            app.BlueChannelKnobLabel.Position = [440 188 97 22];
            app.BlueChannelKnobLabel.Text = 'Blue Channel';

            % Create BlueChannelKnob
            app.BlueChannelKnob = uiknob(app.UIFigure, 'continuous');
            app.BlueChannelKnob.Limits = [0 255];
            app.BlueChannelKnob.ValueChangingFcn = createCallbackFcn(app, @BlueChannelKnobValueChanging, true);
            app.BlueChannelKnob.FontWeight = 'bold';
            app.BlueChannelKnob.FontColor = [0 0.4471 0.7412];
            app.BlueChannelKnob.Position = [428 231 122 122];

            % Create ColorMixerLabel
            app.ColorMixerLabel = uilabel(app.UIFigure);
            app.ColorMixerLabel.BackgroundColor = [1 1 1];
            app.ColorMixerLabel.HorizontalAlignment = 'center';
            app.ColorMixerLabel.FontWeight = 'bold';
            app.ColorMixerLabel.Position = [183 482 246 55];
            app.ColorMixerLabel.Text = {'Color Mixer - '};

            % Create RedColorValueEditField
            app.RedColorValueEditField = uieditfield(app.UIFigure, 'numeric');
            app.RedColorValueEditField.ValueChangedFcn = createCallbackFcn(app, @RedChannelKnobValueChanging, true);
            app.RedColorValueEditField.FontWeight = 'bold';
            app.RedColorValueEditField.FontColor = [1 0 0];
            app.RedColorValueEditField.Position = [63 174 100 22];

            % Create GreenColorValueEditField
            app.GreenColorValueEditField = uieditfield(app.UIFigure, 'numeric');
            app.GreenColorValueEditField.FontWeight = 'bold';
            app.GreenColorValueEditField.FontColor = [0.4667 0.6745 0.1882];
            app.GreenColorValueEditField.Position = [249 22 100 22];

            % Create BlueColorValueEditField
            app.BlueColorValueEditField = uieditfield(app.UIFigure, 'numeric');
            app.BlueColorValueEditField.FontWeight = 'bold';
            app.BlueColorValueEditField.FontColor = [0 0.4471 0.7412];
            app.BlueColorValueEditField.Position = [437 167 100 22];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = Color_Mixer1_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end