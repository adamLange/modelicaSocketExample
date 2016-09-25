within IPCExample;
package Models
model podInATube
    IPCExample.ConnectionObjects.SocketConnection con annotation(Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
    annotation(__OpenModelica_simulationFlags(jacobian = "coloredNumerical", s = "dassl", lv = "LOG_STATS"));
end podInATube;
end Models;