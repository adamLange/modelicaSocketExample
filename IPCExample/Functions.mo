within IPCExample;
package Functions

  function getAverage
    input IPCExample.ConnectionObjects.SocketConnection con;
    input Real a;
    input Real b;
    output Real ave;
    external "C" ave = getAverage(con,a,b) annotation(
      Library="socketclient",
      LibraryDirectory="modelica://IPCExample/ExternalLibraries");
  end getAverage;

end Functions;
