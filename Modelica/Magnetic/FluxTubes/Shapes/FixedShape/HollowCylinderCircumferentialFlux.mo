within Modelica.Magnetic.FluxTubes.Shapes.FixedShape;
model HollowCylinderCircumferentialFlux
  "Hollow cylinder with circumferential flux; fixed shape; linear or non-linear material characteristics"

  extends BaseClasses.FixedShape;
  extends Modelica.Magnetic.FluxTubes.Icons.HollowCylinderCircumferentialFlux;
  import Modelica.Constants.pi;
  parameter SI.Length l=0.02 "Width (orthogonal to flux direction)"
    annotation (Dialog(group=
          "Fixed geometry", groupImage=
          "modelica://Modelica/Resources/Images/Magnetic/FluxTubes/Shapes/Circumferential.png"));
  parameter SI.Radius r_i=0.01 "Inner radius of hollow cylinder"
    annotation (Dialog(group="Fixed geometry"));
  parameter SI.Radius r_o=0.02 "Outer radius of hollow cylinder"
    annotation (Dialog(group="Fixed geometry"));
  parameter SI.Angle alfa=pi/2 "Angle of cylinder section"
    annotation (Dialog(group="Fixed geometry"));
equation
  A = l*(r_o - r_i) "Area at arithmetic mean radius for calculation of average flux density";
  // Area at arithmetic mean radius for calculation of average flux density
  G_m = mu_0*mu_r*A/((r_o + r_i)/2*alfa);

  annotation (defaultComponentName="cylinder", Documentation(info="<html>
<p>
Please refer to the enclosing sub-package <a href=\"modelica://Modelica.Magnetic.FluxTubes.Shapes.FixedShape\">FixedShape</a> for a description of all elements of this package and to <a href=\"modelica://Modelica.Magnetic.FluxTubes.UsersGuide.Literature\">[Ro41]</a> for derivation and/or coefficients of the equation for permeance G_m.
</p>

<p>
For hollow cylindric flux tubes with a circumferential magnetic flux, the flux density is a function of the radius. 
For that reason, the characteristic mu_r(B) is evaluated for the flux density at the flux tube's mean radius.
</p>

<p>
For those flux tube sections of a magnetic device that have a nonlinear material characteristic mu_r(B) and a large aspect ratio of outer to inner radius r_o/r_i, the section can be split up in a series connection of several hollow cylindric flux tubes with radial flux. This allows for more realistic modelling of the dependence of flux density on the radius compared to modelling with just one flux tube element.
</p>
</html>"));
end HollowCylinderCircumferentialFlux;
