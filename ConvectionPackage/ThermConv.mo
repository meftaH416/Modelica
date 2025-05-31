within ConvectionPackage;

model ThermConv
"It is a thermal conection model
h*A*dT = Q"
  Modelica.Units.SI.CoefficientOfHeatTransfer h;
  Modelica.Units.SI.Area A;
  //heatport_a node_a;
  //heatport_b node_b;
  heatport_a node_a annotation(
    Placement(transformation(origin = {-84, 6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-84, 6}, extent = {{-10, -10}, {10, 10}})));
  heatport_b node_b annotation(
    Placement(transformation(origin = {86, 6}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {86, 6}, extent = {{-10, -10}, {10, 10}})));
equation
  h*A*der(node_a.T-node_b.T) = node_b.Q;
  node_a.Q = - node_b.Q;
annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002),
  Diagram(graphics = {Line(origin = {-49.8675, 0.341886}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {-70, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {-9.8675, 0.342}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {-30, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {30.1325, -0.6581}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {10, -50}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {70.1325, 0.3419}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {50, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}})}),
  Icon(graphics = {Line(origin = {-49.8675, 0.341886}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {-70, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {-9.8675, 0.342}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {-30, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {30.1325, -0.6581}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {10, -50}, points = {{10, -29}, {-10, 29}, {-10, 29}}), Line(origin = {70.1325, 0.3419}, points = {{-10.1325, 79.6581}, {-10.1325, -80.3419}, {9.86754, -20.3419}, {9.86754, -20.3419}}), Line(origin = {50, -49}, points = {{10, -29}, {-10, 29}, {-10, 29}})}));
end ThermConv;
