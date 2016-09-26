within IPCExample;

package Models
block RemoteAverager
  IPCExample.ConnectionObjects.SocketConnection con = IPCExample.ConnectionObjects.SocketConnection("_projectDir_/rpcSocket"); annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u annotation(Placement(visible = true, transformation(origin = {-190, 52}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y annotation(Placement(visible = true, transformation(origin = {194, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {106, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u1 annotation(Placement(visible = true, transformation(origin = {-176, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-100, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  y = IPCExample.Functions.getAverage(con, u, u1);
  annotation(__OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"), uses(Modelica(version = "3.2.2")), Icon(graphics = {Text(origin = {4, -1}, extent = {{-62, 73}, {62, -73}}, textString = "remote\naverage", fontName = "DejaVu Sans Mono")}));
end RemoteAverager;

  model remoteAveragingExample
  Modelica.Blocks.Sources.Sine sine1(amplitude = 1, freqHz = 1, phase(displayUnit = "rad")) annotation(Placement(visible = true, transformation(origin = {-104, 74}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(Placement(visible = true, transformation(origin = {-36, 26}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const annotation(Placement(visible = true, transformation(origin = {-102, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  RemoteAverager remoteAverager1 annotation(Placement(visible = true, transformation(origin = {12, 54}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  equation
    connect(add1.y, remoteAverager1.u1) annotation(Line(points = {{-24, 26}, {-12, 26}, {-12, 50}, {2, 50}, {2, 50}}, color = {0, 0, 127}));
    connect(sine1.y, remoteAverager1.u) annotation(Line(points = {{-92, 74}, {-24, 74}, {-24, 58}, {2, 58}, {2, 58}}, color = {0, 0, 127}));
    connect(sine1.y, add1.u1) annotation(Line(points = {{-93, 74}, {-61, 74}, {-61, 32}, {-48, 32}}, color = {0, 0, 127}));
    connect(const.y, add1.u2) annotation(Line(points = {{-91, 20}, {-48, 20}}, color = {0, 0, 127}));
    annotation(uses(Modelica(version = "3.2.2")));
  end remoteAveragingExample;
end Models;
