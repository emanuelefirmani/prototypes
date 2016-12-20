ECHO Building web for RabbitConsumer
cd \Work\Git\prototypes\RabbitConsumer
FOR /f "tokens=*" %%i IN ('docker-machine env issuingcompose') DO @%%i
build.bat