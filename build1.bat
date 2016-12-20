ECHO Building web for node 1
cd \Work\Git\prototypes\IssuingService
FOR /f "tokens=*" %%i IN ('docker-machine env issuingnode1') DO @%%i
build.bat