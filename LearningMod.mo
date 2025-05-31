package LearningMod
   
partial connector heatport
    // potential variable
    Modelica.Units.SI.TemperatureDifference T "unit k";
    // flow variable
    Modelica.Units.SI.HeatFlowRate Q "unit = watt";
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
  
  end Amb;
end LearningMod;
