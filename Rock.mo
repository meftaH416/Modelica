model Rock
  // Constant parameter
  parameter Real PI = 3.14;
  
  // equational parameters
  parameter Real T_0(unit = "k") = 273.15 + 50 "initial temperature of solid body";
  parameter Real T_a(unit = "k") = 273.15 + 10 "fluid temperature";
  parameter Real rho(unit="kg/m3") = 2230 "density of solid body";
  parameter Real c(unit = "J/(kg.k)") = 880 "heat capacity of solid body";
  parameter Real h(unit = "W/(m2.k)") = 1000 "solid-fluid heat transfer coefficient";
  parameter Real r(unit="m") = 0.1 "radius of solid body";
  parameter Real A(unit = "m2") = 4*PI*r^2 "surface area of solid body";
  parameter Real V(unit="m3") = 4/3*PI*r^3 "volume of solid body";
  Real T(unit="k", start = T_0) "temperature variable";
  
equation
  rho*V*c*der(T) = h*A*(T_a - T);

annotation(
    experiment(StartTime = 0, StopTime = 3600, Tolerance = 1e-06, Interval = 1));
end Rock;
