within ConvectionPackage;

model FinalCooling
  //Wall wall(Cp = 1.2, T0 = 293.15);
  //Amb amb(Tamb = 313.15);
  //ThermConv conv(h=1.5, A=200);
  Wall wall(Cp = 1.2, T0 = 283.15) annotation(
    Placement(transformation(origin = {-89, 3}, extent = {{-29, -29}, {29, 29}})));
  Amb amb(Tamb = 303.15) annotation(
    Placement(transformation(origin = {54, 2}, extent = {{-20, -20}, {20, 20}})));
  ThermConv conv(h=1.5, A=100) annotation(
    Placement(transformation(origin = {-24, 0}, extent = {{-26, -26}, {26, 26}})));
equation
//connect(wall.node, conv.node_a);
//connect(conv.node_b, amb.node);
  connect(wall.node, conv.node_a) annotation(
    Line(points = {{-80, 4}, {-46, 4}, {-46, 2}}));
  connect(conv.node_b, amb.node) annotation(
    Line(points = {{-2, 2}, {40, 2}}));
  annotation(
    experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end FinalCooling;
