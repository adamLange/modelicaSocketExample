This is a simple example of using IPC with a modelic function.

To run the example, first run the script init.sh:

    $./init.sh

Running init.sh will substitute hard coded paths in where necessary
and compile socketClient.c into a shared library that will be linked
to the modelica model.

Next, start the python server.  The server waits on a unix socket 
to recieve two double values.  It then averages them and sends back
the result.  Super exciting ehay?  Start there server with this
command:

    modelicaIPCExamples$python server.py -m;rm rpcSocket

Start the Open Modelica Editor and load the package IPCExample by
navigating to modelicaIPCExamples/IPCExample/package.mo.  Open
the model remoteAveragingExample and run it.  (You can also do this 
if you make a mos file)
