within IPCExample;
package ConnectionObjects

  class SocketConnection

    extends ExternalObject;

    function constructor
      input String keyFile = "";
      output SocketConnection connection;
      external "C" connection = initSocketConnection(keyFile);
    end constructor;

    function destructor "close connection"
      input SocketConnection connection;
      external "C" closeSocketConnection(connection);
    end destructor;

  end SocketConnection;

end ConnectionObjects;
