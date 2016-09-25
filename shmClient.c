typedef struct {
  int semid;
  sembuf sb;
} ShmConnection;

ShmConnection initShmConnection(ShmConnection con,){

  con.semid = 
    if ((con.semid = initsem(key, 1)) == -1) {
        perror("initsem");
        exit(1);
    }
  return conn
}

closeShmConnection(){
}

double callRemoteProceedure(ShmConnection connection,double a,double b){
  //set a and b in shared memory
  //release the semaphore
  //grab the semaphore
  //return the result
}

