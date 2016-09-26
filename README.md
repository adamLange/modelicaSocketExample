To run the model remoteAveragingExample.mo, you will need to compile
socketClient.c into a shared object library named libsocketclient.so 
and save it in the modelicaIPCExamples/IPCExample/ExternalLibraries

First start the server:

    $python server.py -m; rm rpcSocket

Then run the remoteAveragingExample.

Watch out.  There are some hardcoded paths that could cause you trouble
at this point.
