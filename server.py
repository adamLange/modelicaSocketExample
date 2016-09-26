import json
import socket
import argparse
import os
import numpy as np

parser = argparse.ArgumentParser()
parser.add_argument("-m", "--multiConn", action="store_true",
                    help="don't quit after first connection closes")

args = parser.parse_args()

def average(a,b):
  return (a+b)/2.0

s1 = socket.socket(socket.AF_UNIX)

s1.bind('rpcSocket')
s1.listen(5)

acceptFlag = True

while acceptFlag:
  s2,s2info = s1.accept()
  okay = True
  while okay:
    try:
      operands = np.frombuffer(s2.recv(1024),dtype="double")
      ave = average(operands[0],operands[1])
      s2.sendall(np.array([ave],dtype="double").tostring())
    except:
      okay = False
      s2.close()
  acceptFlag = args.multiConn


s1.close()
s2.close()
os.unlink('rpcSocket')
