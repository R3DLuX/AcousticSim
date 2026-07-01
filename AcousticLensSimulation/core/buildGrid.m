function [kgrid, C] = buildGrid(C)
%==========================================================================
% buildGrid
%
% Build k-Wave computational grid.
%
% Syntax
% ------
% [kgrid, C] = buildGrid(C)
%
% Inputs
% ------
% C : configuration structure
%
% Outputs
% -------
% kgrid : kWaveGrid object
% C     : updated configuration
%
% Compatible with
% ----------------
% k-Wave Toolbox 1.4.1
%
%==========================================================================

%% Material (wave speed used for stability)

cWater = C.water.sound_speed;

%% Wavelength

lambda = cWater / C.source.frequency;

%% Grid spacing

dx = lambda / C.grid.ppw;

dy = dx;
dz = dx;

C.grid.dx = dx;
C.grid.dy = dy;
C.grid.dz = dz;

%% Grid size

Nx = C.grid.Nx;
Ny = C.grid.Ny;
Nz = C.grid.Nz;

%% Create grid

kgrid = kWaveGrid( ...
    Nx, dx, ...
    Ny, dy, ...
    Nz, dz);

%% Time step

cMax = max( ...
    C.water.sound_speed, ...
    C.lens.sound_speed);

kgrid.makeTime(cMax, C.solver.CFL);

%% Simulation time

switch lower(C.source.mode)

    case "pulse"

        tEnd = C.simulation.time;

    case "cw"

        period = 1 / C.source.frequency;

        tEnd = max( ...
            30 * period, ...
            C.simulation.time);

    otherwise

        error("Unknown source mode.");

end

Nt = ceil(tEnd / kgrid.dt);

kgrid.t_array = (0:Nt-1) * kgrid.dt;

%% Store information

C.grid.lambda = lambda;

C.grid.dt = kgrid.dt;

C.grid.Nt = Nt;

C.grid.tEnd = tEnd;

%% Report

fprintf("\n");
fprintf("-------------------------------------------\n");
fprintf("Grid information\n");
fprintf("-------------------------------------------\n");

fprintf("Grid size      : %d x %d x %d\n", ...
    Nx, Ny, Nz);

fprintf("dx             : %.3f um\n", ...
    dx*1e6);

fprintf("Time step      : %.3f ps\n", ...
    kgrid.dt*1e12);

fprintf("Number of step : %d\n", ...
    Nt);

fprintf("Simulation time: %.3f us\n", ...
    tEnd*1e6);

fprintf("PPW            : %.1f\n", ...
    C.grid.ppw);

fprintf("-------------------------------------------\n");

end