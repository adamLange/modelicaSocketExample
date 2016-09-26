within IPCExample;
package ConnectionObjects

  class SocketConnection

    extends ExternalObject;

    function constructor
      input String socName = "_projectDir_/rpcSocket";
      output SocketConnection connection;
      external "C" connection = initSocketConnection(socName)
        annotation(Library="socketclient",
          LibraryDirectory="modelica://IPCExample/ExternalLibraries");
    end constructor;

    function destructor "close connection"
      input SocketConnection connection;
      external "C" closeSocketConnection(connection)
        annotation(Library="socketclient",
          LibraryDirectory="modelica://IPCExample/ExternalLibraries");
    end destructor;

  end SocketConnection;

end ConnectionObjects;
