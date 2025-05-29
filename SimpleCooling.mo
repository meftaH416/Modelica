model SimpleCooling
  Buildings.Fluid.MixingVolumes.MixingVolume vol(redeclare package Medium = Buildings.Media.Air "Moist air", energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, mSenFac = 3, m_flow_nominal = 180*1.2*6/3600, V = 180, use_C_flow = false)  annotation(
    Placement(transformation(origin = {73, 14}, extent = {{-11, -10}, {11, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor theCon1(G = 10000/30)  annotation(
    Placement(transformation(origin = {6, 14}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow prehea(Q_flow = 1000)  annotation(
    Placement(transformation(origin = {4, 62}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TOut(T = 263.15)  annotation(
    Placement(transformation(origin = {-56, 14}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(TOut.port, theCon1.port_a) annotation(
    Line(points = {{-46, 14}, {-4, 14}}, color = {191, 0, 0}));
  connect(prehea.port, vol.heatPort) annotation(
    Line(points = {{14, 62}, {36, 62}, {36, 14}, {62, 14}}, color = {191, 0, 0}));
  connect(theCon1.port_b, vol.heatPort) annotation(
    Line(points = {{16, 14}, {62, 14}}, color = {191, 0, 0}));
  annotation(
    uses(Buildings(version = "12.0.0"), Modelica(version = "4.0.0")),
    experiment(StartTime = 0, StopTime = 10800, Tolerance = 1e-06, Interval = 216));
end SimpleCooling;
