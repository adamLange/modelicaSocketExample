#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>

#define SOCK_PATH "/home/adam/projects/modelicaIPCExamples/rpcSocket"

typedef struct {
  struct sockaddr_un* address;
  int id;
} SocketConnection;

void* initSocketConnection(const char* socketName)
{

  FILE *fid;
  if ((fid = fopen("/home/adam/projects/modelicaIPCExamples/log","a")) <= 0){
    perror("open log file");
    exit(1);
  }


  fprintf(fid,"initializing SocketConnection... \n");
  
  SocketConnection *con = malloc(sizeof(SocketConnection));
  con->address = malloc(sizeof(struct sockaddr_un));
  int len;


  if ( (con->id = socket(AF_UNIX, SOCK_STREAM, 0)) == -1) {
    perror("socket");
    exit(1);
  }

  fprintf(fid,"opened socket id %i\n",con->id);
  fclose(fid);

  con->address->sun_family = AF_UNIX;
  strcpy(con->address->sun_path, SOCK_PATH);
  len = strlen(con->address->sun_path) + sizeof(con->address->sun_family);
  if (connect(con->id,(struct sockaddr *)con->address, len) == -1) {
    perror("connect");
    exit(1);
  }

  return (void*) con;

}

void closeSocketConnection(void* object){
  SocketConnection *con = (SocketConnection*) object;
  close(con->id);
  free(con->address);
  free(con);
};

double getAverage(void* object,double a,double b){
  SocketConnection *con = (SocketConnection*) object;
  double arr[2];
  arr[0] = a;
  arr[1] = b;
  double ave;
  int n;
  FILE *fid;

  if ((fid = fopen("/home/adam/projects/modelicaIPCExamples/log","a")) <= 0){
    perror("open log file");
    exit(1);
  }
  fprintf(fid,"sending to socket id: %i\n",con->id);
  fclose(fid);

  if(send(con->id,arr,sizeof(double)*2,0) < 0){
    perror("sending with con.id = %i\n");
    exit(1);
  }
  if((n = recv(con->id,(void *)&ave,sizeof(double),0)) <= 0){
    if (n < 0) perror("recv");
    else printf("Server closed connection\n");
    exit(1);
  }
  return ave;
}
