model RoomCooling2
  Buildings.Fluid.MixingVolumes.MixingVolume room(redeclare package Medium = Buildings.Media.Air "Moist air", energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, mSenFac = 3, m_flow_nominal = 180*1.2*6/3600, V = 180)  annotation(
    Placement(transformation(origin = {80, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow heatGain(Q_flow = 1000)  annotation(
    Placement(transformation(origin = {12, 50}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TOut annotation(
    Placement(transformation(origin = {-46, 16}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor theCond(G = 10000/30)  annotation(
    Placement(transformation(origin = {4, 16}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(heatGain.port, room.heatPort) annotation(
    Line(points = {{22, 50}, {40, 50}, {40, 16}, {70, 16}}, color = {191, 0, 0}));
  connect(theCond.port_b, room.heatPort) annotation(
    Line(points = {{14, 16}, {70, 16}}, color = {191, 0, 0}));
  connect(TOut.port, theCond.port_a) annotation(
    Line(points = {{-36, 16}, {-6, 16}}, color = {191, 0, 0}));

annotation(
    uses(Buildings(version = "12.0.0"), Modelica(version = "4.0.0")));
end RoomCooling2;
