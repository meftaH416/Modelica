within ConvectionPackage;

model Wall
"It is a thermal capacitance model
Cp * der(T) = Q"
  Modelica.Units.SI.HeatCapacity Cp "unit = J/k";
  Modelica.Units.SI.Temperature T0 "unit = k";
  //heatport_a node;
  
initial equation
  node.T = T0;
equation
  Cp*der(node.T) = node.Q;
annotation(
    Diagram(graphics = {Rectangle(origin = {-2, 0}, fillColor = {85, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-22, 98}, {22, -98}})}),
  Icon(graphics = {Rectangle(origin = {-2, 0}, fillColor = {170, 170, 127}, fillPattern = FillPattern.Cross, extent = {{-22, 98}, {22, -98}})}));
end Wall;
