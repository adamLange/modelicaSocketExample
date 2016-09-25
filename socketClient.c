#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#define SOCK_PATH "rpcSocket"

typedef struct {
  struct sockaddr_un* address;
  int id;
} SocketConnection;

SocketConnection initSocketConnection(
    SocketConnection con, 
    const char* socketName){

  int len;

  if ( (con.id = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
    perror("socket");
    exit(1);
  }

  con.address->sun_family = AF_UNIX;
  strcpy(con.address->sun_path, SOCK_PATH);
  len = strlen(con.address->sun_path) + sizeof(con.address->sun_family);
  if (connect(con.id,(struct sockaddr *)&con.address, len) == -1) {
    perror("connect");
    exit(1);
  }

  return con;

}

void closeSocketConnection(SocketConnection con){
  close(con.id);
};

/*
double callRemoteProceedure(SocketConnection connection,double a,double b){
  //set a and b in shared memory
  //release the semaphore
  //grab the semaphore
  //return the result
}
*/
