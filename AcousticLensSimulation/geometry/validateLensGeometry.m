function validateLensGeometry(geometry,C)

fprintf("\n");
fprintf("=========== Lens Geometry ===========\n");

fprintf("Material          : %s\n",C.lens.name);

fprintf("Radius            : %.3f mm\n", ...
    geometry.Rc*1e3);

fprintf("Thickness         : %.3f mm\n", ...
    geometry.thickness*1e3);

fprintf("Aperture Radius   : %.3f mm\n", ...
    geometry.aperture*1e3);

assert( ...
    geometry.Rc>geometry.aperture,...
    'Radius of curvature must exceed aperture.');

assert( ...
    geometry.thickness>0,...
    'Thickness must be positive.');

fprintf("Geometry OK\n");

end