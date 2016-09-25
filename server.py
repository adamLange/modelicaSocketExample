import SocketServer
import json

class MyTCPHandler(SocketServer.BaseRequestHandler):
    """
    The request handler class for our server.

    It is instantiated once per connection to the server, and must
    override the handle() method to implement communication to the
    client.
    """

    def handle(self):

        # self.request is the TCP socket connected to the client
        self.data = self.request.recv(1024).strip()
        decoded = json.loads(self.data)
        print('recieved {} and {} as arguments'.format(decoded[0],decoded[1]))
        print('averaging...')
        ave = decoded[0]+decoded[1]/2.0

        #print "{} wrote:".format(self.client_address[0])
        # just send back the same data, but upper-cased
        #self.request.sendall(self.data.upper())

        self.request.sendall(json.dumps(ave))

if __name__ == "__main__":
    HOST, PORT = "localhost", 9999

    # Create the server, binding to localhost on port 9999
    server = SocketServer.UnixStreamServer("socketBopIt", MyTCPHandler)

    # Activate the server; this will keep running until you
    # interrupt the program with Ctrl-C
    server.serve_forever()
