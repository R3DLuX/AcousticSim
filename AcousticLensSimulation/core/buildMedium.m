function [medium,C] = buildMedium(kgrid,C)
%==========================================================================
% buildMedium
%
% Construct heterogeneous acoustic medium.
%
% Workflow
% --------
% 1. Generate analytic lens geometry
% 2. Validate geometry
% 3. Compute subvoxel fill fraction
% 4. Create interpolated material map
%
%==========================================================================

%% Generate lens geometry

geometry = generatePlanoConcaveLens( ...
    kgrid,...
    C);

%% Validate geometry

validateLensGeometry( ...
    geometry,...
    C);

%% Compute subvoxel fill fraction

fillFraction = computeFillFraction( ...
    geometry,...
    kgrid,...
    C);

%% Create medium

medium = createMedium( ...
    fillFraction,...
    C);

end