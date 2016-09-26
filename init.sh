#substitute in some the current directory for some hardcoded paths
projdir=$pwd
sed -i -e 's|_projectDir_|'$(pwd)'|g' socketClient.c IPCExample/ConnectionObjects.mo IPCExample/Models.mo

#compilation of the external library
clang -c -fPIC socketClient.c -o socketClient.o
mkdir -p IPCExample/ExternalLibraries
clang -shared socketClient.o -o IPCExample/ExternalLibraries/libsocketclient.so
rm socketClient.o
