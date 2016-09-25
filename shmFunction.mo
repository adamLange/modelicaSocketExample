class ShmConnection

  extends ExternalObject;

  function constructor
    input String keyFile = "";
    output ShmConnection connection;
    external "C" connection = initShmConnection(keyFile);
  end constructor;

  function destructor "close connection"
    input ShmConnection connection;
    external "C" closeShmConnection(connection);
  end destructor;

end ShmConnection;
