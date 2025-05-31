package LearningMod
   
partial connector heatport
    // potential variable
    Modelica.Units.SI.Temperature T "unit k";
    // flow variable
    Modelica.Units.SI.HeatFlowRate Q "unit = Watt";
  end heatport;

  connector heatport_a
    extends heatport;
  end heatport_a;

  connector heatport_b
    extends heatport;
  end heatport_b;

  model Wall
  "It is a thermal capacitance model
  Cp * der(T) = Q"
    Modelica.Units.SI.HeatCapacity Cp "unit = J/k";
    Modelica.Units.SI.Temperature T0 "unit = k";
    heatport_a node;
  initial equation
    node.T = T0;
  equation
    Cp*der(node.T) = node.Q;
  end Wall;

  model Amb
  "It is a model for ambient conditions Tamb = constant"
    Modelica.Units.SI.Temperature Tamb "unit = k";
    heatport_b node;
  equation
    node.T = Tamb;
  end Amb;

model ThermConv
"It is a thermal conection model
h*A*dT = Q"
  Modelica.Units.SI.CoefficientOfHeatTransfer h;
  Modelica.Units.SI.Area A;
  heatport_a node_a;
  heatport_b node_b;
equation
  h*A*der(node_a.T-node_b.T) = node_b.Q;
  node_a.Q = - node_b.Q;
annotation(
      experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end ThermConv;

  model FinalCooling
    Wall wall(Cp = 1.2, T0 = 293.15);
    Amb amb(Tamb = 313.15);
    ThermConv conv(h=1.5, A=200);
  equation
   connect(wall.node, conv.node_a);
     connect(conv.node_b, amb.node);
annotation(
      experiment(StartTime = 0, StopTime = 10, Tolerance = 1e-06, Interval = 0.02));
end FinalCooling;
end LearningMod;
