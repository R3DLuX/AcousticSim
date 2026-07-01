function material = materialDatabase(name)
%==========================================================================
% materialDatabase
%
% Material property database used by AcousticLensSimulation.
%
% Syntax
% ------
% material = materialDatabase(name)
%
% Input
% -----
% name : string or char
%
% Available Materials
% -------------------
% Water
% FusedSilica
% Quartz
% PMMA
% Sapphire
% Silicon
% Aluminum
% Epoxy
%
% Output
% ------
% material.name
% material.sound_speed
% material.density
% material.alphaCoeff
% material.alphaPower
% material.impedance
% material.heatCapacity
% material.thermalConductivity
%
%==========================================================================

arguments
    name {mustBeTextScalar}
end

name = string(name);

switch lower(name)

    case "water"

        material.name = "Water";
        material.sound_speed = 1500;
        material.density = 1000;
        material.alphaCoeff = 0.0022;
        material.alphaPower = 2.0;
        material.heatCapacity = 4182;
        material.thermalConductivity = 0.60;

    case {"fusedsilica","silica","fused_silica"}

        material.name = "FusedSilica";
        material.sound_speed = 5100;
        material.density = 2230;
        material.alphaCoeff = 1.30;
        material.alphaPower = 1.0;
        material.heatCapacity = 740;
        material.thermalConductivity = 1.38;

    case "quartz"

        material.name = "Quartz";
        material.sound_speed = 5760;
        material.density = 2650;
        material.alphaCoeff = 0.80;
        material.alphaPower = 1.0;
        material.heatCapacity = 730;
        material.thermalConductivity = 7.6;

    case "pmma"

        material.name = "PMMA";
        material.sound_speed = 2730;
        material.density = 1180;
        material.alphaCoeff = 6.0;
        material.alphaPower = 1.1;
        material.heatCapacity = 1470;
        material.thermalConductivity = 0.19;

    case "silicon"

        material.name = "Silicon";
        material.sound_speed = 8430;
        material.density = 2330;
        material.alphaCoeff = 0.40;
        material.alphaPower = 1.0;
        material.heatCapacity = 700;
        material.thermalConductivity = 149;

    case "sapphire"

        material.name = "Sapphire";
        material.sound_speed = 11000;
        material.density = 3980;
        material.alphaCoeff = 0.20;
        material.alphaPower = 1.0;
        material.heatCapacity = 760;
        material.thermalConductivity = 35;

    case "aluminum"

        material.name = "Aluminum";
        material.sound_speed = 6320;
        material.density = 2700;
        material.alphaCoeff = 0.12;
        material.alphaPower = 1.0;
        material.heatCapacity = 900;
        material.thermalConductivity = 205;

    case "epoxy"

        material.name = "Epoxy";
        material.sound_speed = 2500;
        material.density = 1180;
        material.alphaCoeff = 8.0;
        material.alphaPower = 1.2;
        material.heatCapacity = 1250;
        material.thermalConductivity = 0.21;

    otherwise

        error("Unknown material : %s",name);

end

material.impedance = ...
    material.sound_speed .* material.density;

end