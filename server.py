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

okay = True
acceptFlag = True

"""
while acceptFlag:
  s2,s2info = s1.accept()
  while okay:
    try:
      operands = json.loads(s2.recv(1024))
      ave = average(operands[0],operands[1])
      s2.sendall(json.dumps(ave))
    except:
      okay = False
      s2.close()
  acceptFlag = args.multiConn
"""

s2,s2info = s1.accept()
arr = np.array([5.5,10.10,15.15,20.20,7.07],dtype='double')
s2.sendall(arr.tostring())
s2.recv(1024)

s1.close()
s2.close()
os.unlink('rpcSocket')
