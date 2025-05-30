model RoomCooling2
  Buildings.Fluid.MixingVolumes.MixingVolume room(redeclare package Medium = Buildings.Media.Air "Moist air", energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, mSenFac = 3, m_flow_nominal = 180*1.2*6/3600, V = 180, nPorts = 2)  annotation(
    Placement(transformation(origin = {88, 52}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow heatGain(Q_flow = 1000)  annotation(
    Placement(transformation(origin = {10, 86}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Components.ThermalConductor theCond(G = 10000/30)  annotation(
    Placement(transformation(origin = {2, 52}, extent = {{-10, -10}, {10, 10}})));
  Buildings.BoundaryConditions.WeatherData.ReaderTMY3 weaDat(filNam = "C:/Users/Jayedi Aman/Downloads/Buildings 12.0.0/Resources/weatherdata/USA_IL_Chicago-OHare.Intl.AP.725300_TMY3.mos", pAtmSou = Buildings.BoundaryConditions.Types.DataSource.Input, pAtm = 101325)  annotation(
    Placement(transformation(origin = {-90, 88}, extent = {{-10, -10}, {10, 10}})));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature Tout annotation(
    Placement(transformation(origin = {-40, 52}, extent = {{-10, -10}, {10, 10}})));
  Buildings.BoundaryConditions.WeatherData.Bus weaBus annotation(
    Placement(transformation(origin = {-68, 88}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-56, 52}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Movers.FlowControlled_m_flow mov(redeclare package Medium = Buildings.Media.Air "Moist air", energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nominalValuesDefineDefaultPressureCurve = true)  annotation(
    Placement(transformation(origin = {64, -12}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.HeatExchangers.ConstantEffectiveness hex(redeclare package Medium1 = Buildings.Media.Air "Moist air", redeclare package Medium2 = Buildings.Media.Water "Water", dp1_nominal = 200, dp2_nominal = 200, eps = 0.8)  annotation(
    Placement(transformation(origin = {-50, -12}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.HeatExchangers.WetCoilEffectivenessNTU hexWetNtu(redeclare package Medium1 = Buildings.Media.Water "Water", redeclare package Medium2 = Buildings.Media.Air "Moist air", show_T = true, dp1_nominal = 6000, dp2_nominal = 200, use_Q_flow_nominal = true, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial)  annotation(
    Placement(transformation(origin = {6, -12}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Sources.Outside out(redeclare package Medium = Buildings.Media.Air "Moist air", nPorts = 2)  annotation(
    Placement(transformation(origin = {-84, -16}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = Buildings.Media.Water "Water", use_m_flow_in = true, nPorts = 1, T = 273.162)  annotation(
    Placement(transformation(origin = {6, -82}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Sources.Boundary_pT bou(redeclare package Medium = Buildings.Media.Water "Water", nPorts = 1)  annotation(
    Placement(transformation(origin = {-84, -56}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con annotation(
    Placement(transformation(origin = {34, 24}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Controls.OBC.CDL.Reals.Sources.Constant con1 annotation(
    Placement(transformation(origin = {-38, -82}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem(redeclare package Medium = Buildings.Media.Air "Moist air")  annotation(
    Placement(transformation(origin = {-22, -12}, extent = {{-10, -10}, {10, 10}})));
  Buildings.Fluid.Sensors.TemperatureTwoPort senTem1(redeclare package Medium = Buildings.Media.Air "Moist air")  annotation(
    Placement(transformation(origin = {32, -14}, extent = {{-10, -10}, {10, 10}})));
equation
  connect(heatGain.port, room.heatPort) annotation(
    Line(points = {{20, 86}, {38, 86}, {38, 52}, {78, 52}}, color = {191, 0, 0}));
  connect(theCond.port_b, room.heatPort) annotation(
    Line(points = {{12, 52}, {78, 52}}, color = {191, 0, 0}));
  connect(weaDat.weaBus, weaBus) annotation(
    Line(points = {{-80, 88}, {-68, 88}}, color = {255, 204, 51}, thickness = 0.5));
  connect(Tout.port, theCond.port_a) annotation(
    Line(points = {{-30, 52}, {-8, 52}}, color = {191, 0, 0}));
  connect(weaBus.TDryBul, Tout.T) annotation(
    Line(points = {{-68, 88}, {-52, 88}, {-52, 52}}, color = {0, 0, 127}));
  connect(weaBus, out.weaBus) annotation(
    Line(points = {{-68, 88}, {-68, 45.5}, {-86, 45.5}, {-86, 45}, {-94, 45}, {-94, -16}}, thickness = 0.5));
  connect(out.ports[1], hex.port_a1) annotation(
    Line(points = {{-74, -16}, {-69, -16}, {-69, -6}, {-60, -6}}, color = {0, 127, 255}));
  connect(hex.port_b1, senTem.port_a) annotation(
    Line(points = {{-40, -6}, {-36, -6}, {-36, -12}, {-32, -12}}, color = {0, 127, 255}));
  connect(senTem.port_b, hexWetNtu.port_a1) annotation(
    Line(points = {{-12, -12}, {-4, -12}, {-4, -6}}, color = {0, 127, 255}));
  connect(out.ports[2], hex.port_b2) annotation(
    Line(points = {{-74, -16}, {-67, -16}, {-67, -18}, {-60, -18}}, color = {0, 127, 255}));
  connect(hexWetNtu.port_b1, senTem1.port_a) annotation(
    Line(points = {{16, -6}, {22, -6}, {22, -14}}, color = {0, 127, 255}));
  connect(senTem1.port_b, mov.port_a) annotation(
    Line(points = {{42, -14}, {54, -14}, {54, -12}}, color = {0, 127, 255}));
  connect(con.y, mov.m_flow_in) annotation(
    Line(points = {{46, 24}, {64, 24}, {64, 0}}, color = {0, 0, 127}));
  connect(mov.port_b, room.ports[1]) annotation(
    Line(points = {{74, -12}, {88, -12}, {88, 42}}, color = {0, 127, 255}));
  connect(boundary.ports[1], hexWetNtu.port_a2) annotation(
    Line(points = {{16, -82}, {16, -18}}, color = {0, 127, 255}));
  connect(con1.y, boundary.m_flow_in) annotation(
    Line(points = {{-26, -82}, {-6, -82}, {-6, -74}}, color = {0, 0, 127}));
  connect(hex.port_a2, room.ports[2]) annotation(
    Line(points = {{-40, -18}, {-40, -36}, {88, -36}, {88, 42}}, color = {0, 127, 255}));
  connect(bou.ports[1], hexWetNtu.port_b2) annotation(
    Line(points = {{-74, -56}, {-4, -56}, {-4, -18}}, color = {0, 127, 255}));
  annotation(
    uses(Buildings(version = "12.0.0"), Modelica(version = "4.0.0")),
  experiment(StartTime = 120, StopTime = 125, Tolerance = 1e-06, Interval = 60));
end RoomCooling2;
