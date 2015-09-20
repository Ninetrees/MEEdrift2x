% MEEdrift_annotate_DMPA_BPP_plots

set (gca, 'Fontname', 'Times')

axisLimitRight = OCS_BPP_axisOriginX + OCS_BPP_axisRange;
axisLimitLeft  = OCS_BPP_axisOriginX - OCS_BPP_axisRange;

text (...
	'Position', [axisLimitRight+1.0, axisLimitLeft-1.0, 0],...
	'HorizontalAlignment', 'left', 'VerticalAlignment', 'top',...
	'Fontname', 'Times', 'FontSize', 9,...
	'string', sprintf ('GyroPeriod %8.6f ms', abs (gyroPeriod*1000)) );

if strcmp (PlotView, '2D')
	strCoordSys = 'BPP';
	xlabel ('BPPx (m)', 'Position', [  0.00           (axisLimitLeft-0.50)  axisLimitRight ]); % 2D X-Y display
	ylabel ('BPPy (m)', 'Position', [ (axisLimitLeft-0.50)  0.00            axisLimitRight ]);
	zlabel ('BPPz (m)', 'Position', [ (axisLimitRight+0.50) axisLimitLeft        -0.25 ], 'Rotation', 0);
	text (...
		'Position', [axisLimitRight+1.0, (axisLimitLeft-1.0), 0],...
		'HorizontalAlignment', 'left', 'VerticalAlignment', 'top',...
		'Fontname', 'Times', 'FontSize', 9,...
		'string', sprintf ('GyroPeriod %8.6f s', abs (gyroPeriod)) );
else
	strCoordSys = 'DMPA';
	xlabel ('DMPAx (m)', 'Position', [ 0.0             (axisLimitRight+0.50) (axisLimitLeft-0.50)    ]); % 3D display
	ylabel ('DMPAy (m)', 'Position', [ (axisLimitRight+0.50) -0.25           (axisLimitLeft-0.50)    ]);
	zlabel ('DMPAz (m)', 'Position', [ (axisLimitRight+0.50) (axisLimitLeft-0.50) -0.25 ], 'Rotation', 0);
	text (...
		'Position', [ -2.0, axisLimitRight+4.0, axisLimitLeft ],...
		'HorizontalAlignment', 'left', 'VerticalAlignment', 'top',...
		'Fontname', 'Times', 'FontSize', 9,...
		'string', sprintf ('GyroPeriod %8.6f s', abs (gyroPeriod)) );
end

strBeamTime = char(spdfencodett2000(centerBeam_t2k));
strBeamTime = strBeamTime (1:23);
title_ = ( { [ strCoordSys, ' coordinate system, B = [',...
						  num2str(round (centerBeamB (1))),',',...
						  num2str(round (centerBeamB (2))),',',...
						  num2str(round (centerBeamB (3))), '] nT' ]; ...
						 [ 'MMS', obsID, ' ', strBeamTime ]; ...
						 ['EDI beam times within � ', num2str(beamsWindow), ' records of center beam']; ...
						 ['MEEdrift ', dotVersion, '   ', datestr(now, 'yyyy-mm-dd HH:MM:SS') ]; ...
						 [] } );
title (title_, 'Fontname', 'Times');

% if length (p) == 9
if ~PlotBeamConvergence
	legend (hDMPA__BPP_legendAxes, p, ... % hDMPA_plotElements, ...
		'GDU plane', 'BPP plane', 'GDU1', 'GDU2', 'Beams', 'EDI B (unit)', 'EDI E (unit)', 'EDI S*', 'EDP E (unit)', 'E dot B S*', 'Location', 'EastOutside');
		%p1,          p2           p3      p4      p5       p6              p7              p8        p9           , p10 ...
else
	legend (hDMPA__BPP_legendAxes, p, ... % hDMPA_plotElements, ...
		'GDU plane', 'BPP plane', 'GDU1', 'GDU2', 'Beams', 'EDI B (unit)', 'EDI E (unit)', 'EDI S*', 'EDP E (unit)', 'E dot B S*', 'BC S*', 'Location', 'EastOutside');
		%p1,          p2           p3      p4      p5       p6              p7              p8        p9           , p10         , p11
end

% if length (p) == 7
% 	legend    p1,          p2      p3      p4                       p5                   p6              p7      , ...
% 	legend (p, 'GDU plane', 'GDU1', 'GDU2', 'Beams, solid & dashed', 'EDP 3D DMPA (unit)', 'ExB Drift S*', 'Calc Perp S*', ...
% 					'Location', 'NorthEastOutside');
% end
% if length (p) == 9
% 	legend    p1,          p2      p3      p4                       p5  sq               p6  ci          p7 tri          p8   sqsol        ,  p9 cisol    ...
% 	legend (p, 'GDU plane', 'GDU1', 'GDU2', 'Beams, solid & dashed', 'EDP 3D BPP (norm)', 'ExB Drift S*', 'Calc Perp S*', 'MP EDI E3D BPP, �', 'MP EDI S*', ...
% 					'Location', 'NorthEastOutside');
% end
% if length (p) == 12
% 	legend    p1,          p2      p3      p4                       p5  sq               p6  ci          p7 tri          p8   sqsol        ,  p9 cisol    ...
% 	          p10                 p11         P12
% 	legend (p, 'GDU plane', 'GDU1', 'GDU2', 'Beams, solid & dashed', 'EDP 3D DMPA (unit)', 'ExB Drift S*', 'Calc Perp S*', 'MP EDI E3D BPP, �', 'MP EDI S*', ...
% 						 'Proxy E3D BPP, �', 'Proxy S*', 'Proxy Perp S*', ...
% 						 'Location', 'NorthEastOutside');
% end

legend ('boxoff');

if PlotHoldOff
	hold off
end
