Colors = linspecer(6); 

%% VARIABLE EDITING
ms_to_s = 1/1000; % converts miliseconds to seconds
qc_to_rad = 2*pi/200000; % converts quadrature counts to radians

%% TRACKING PERFORMANCE PLOT FOR TEST 1
figure('Units', 'pixels', ...
    'Position', [100 100 600 300]);
grid on
hold on

h1PositionReference = plot(Timems*ms_to_s, X1*qc_to_rad*10000);
h1EposPosition = plot(Timems*ms_to_s, EPOSPosition*qc_to_rad);
h1Torque = plot(Timems*ms_to_s, LoadCell/30);

set(h1PositionReference                       , ...
  'LineWidth'       ,    2        , ...
  'LineStyle'       , '-'      , ...
  'color'          , Colors(2,:)     );

set(h1EposPosition                       , ...
  'LineWidth'       ,    2        , ...
  'LineStyle'       , '-'        , ...
  'color'          , Colors(1,:)     );

set(h1Torque                       , ...
  'LineWidth'       ,    2        , ...
  'LineStyle'       , '-'        , ...
  'color'          , Colors(3,:)     );

h1Legend = legend( ...
  [h1PositionReference, h1EposPosition, h1Torque], ...
  '\theta_{Reference}', ...
  '\theta_{Joint}'           , ...
  '\tau_{Step}'           , ...
  'location', 'SouthEast' );

% TrackingTitle  = title ('My Publication-Quality Graphics');
h1YLabel = ylabel('\theta (rad)');
h1XLabel = xlabel('time (s)');


set([h1Legend, gca]             , ...
    'FontSize'   , 13           );

set( gca                       , ...
    'FontSize',         15     , ...
    'FontName'   , 'Helvetica' );

set(gca, ...
  'XMinorTick'  , 'on'      , ...
  'YMinorTick'  , 'on'      , ...
  'YGrid'       , 'off'      , ...
  'LineWidth'   , 1         );

set([h1XLabel, h1YLabel], ...
    'FontName'   , 'AvantGarde');

% axis([57 59 0 2])

saveas(gcf,'delay_test_1_response.png')
% savefig('03_sin_sin_response')
