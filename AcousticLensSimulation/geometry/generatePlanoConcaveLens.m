function geometry = generatePlanoConcaveLens(kgrid,C)
%==========================================================================
% Generate analytic plano-concave lens geometry
%==========================================================================

[X,Y,Z] = ndgrid( ...
    kgrid.x_vec,...
    kgrid.y_vec,...
    kgrid.z_vec);

geometry.X = X;
geometry.Y = Y;
geometry.Z = Z;

geometry.r = hypot(Y,Z);

Rc = abs(C.lens.radiusCurvature);

geometry.Rc = Rc;

geometry.aperture = C.lens.apertureRadius;

geometry.thickness = C.lens.thickness;

geometry.flatX = C.lens.flatPosition;

geometry.sag = ...
    Rc - sqrt(max(Rc^2-geometry.r.^2,0));

geometry.concaveSurface = ...
    geometry.flatX ...
    - geometry.thickness ...
    + geometry.sag;

geometry.flatSurface = geometry.flatX;

geometry.insideAperture = ...
    geometry.r<=geometry.aperture;

geometry.binaryMask = ...
    geometry.insideAperture & ...
    X>=geometry.concaveSurface & ...
    X<=geometry.flatSurface;

end