within ConvectionPackage;

model Amb
"It is a model for ambient conditions Tamb = constant"
  Modelica.Units.SI.Temperature Tamb "unit = k";
  //heatport_b node;
  heatport_b node annotation(
    Placement(transformation(origin = {-74, 4}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-74, 4}, extent = {{-10, -10}, {10, 10}})));
equation
  node.T = Tamb;
annotation(
    Icon(graphics = {Polygon(fillColor = {170, 170, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{0, 80}, {-60, 40}, {-60, -40}, {0, -80}, {60, -40}, {60, 40}, {60, 40}, {0, 80}})}),
  Diagram(graphics = {Polygon(origin = {-1, 4}, fillColor = {170, 170, 255}, fillPattern = FillPattern.HorizontalCylinder, points = {{0, 80}, {-60, 40}, {-60, -40}, {0, -80}, {60, -40}, {60, 40}, {60, 40}, {0, 80}})}));
end Amb;
