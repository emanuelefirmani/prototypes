ECHO Building web for node 2
cd \Work\Git\prototypes\IssuingService
FOR /f "tokens=*" %%i IN ('docker-machine env issuingnode2') DO @%%i
build.bat