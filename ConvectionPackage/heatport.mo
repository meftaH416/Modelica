within ConvectionPackage;

partial connector heatport
    // potential variable
    Modelica.Units.SI.TemperatureDifference T "unit k";
    // flow variable
    Modelica.Units.SI.HeatFlowRate Q "unit = Watt";annotation(
    Diagram(graphics = {Ellipse(origin = {2, 1}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 45}, {50, -45}})}),
  Icon(graphics = {Ellipse(origin = {2, 1}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 45}, {50, -45}})}));
  end heatport;
