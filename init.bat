ECHO Creating machine issuingnode1
docker-machine create issuingnode1 -d virtualbox
docker-machine stop issuingnode1
VBoxManage.exe sharedfolder add issuingnode1 --name "/work" --hostpath "\\?\C:\Work\Git\" --automount
docker-machine start issuingnode1
docker-machine regenerate-certs -f issuingnode1
ECHO Starting the swarm
FOR /f "tokens=*" %%i IN ('docker-machine env issuingnode1') DO @%%i
FOR /f "delims=" %%a in ('docker-machine ip issuingnode1') do @set ip1=%%a
docker swarm init --advertise-addr=%ip1%
FOR /f "delims=" %%a in ('docker swarm join-token -q worker') do @set swarmToken=%%a


ECHO Creating machine issuingnode2
docker-machine create issuingnode2 -d virtualbox
docker-machine stop issuingnode2
VBoxManage.exe sharedfolder add issuingnode2 --name "/work" --hostpath "\\?\C:\Work\Git\" --automount
docker-machine start issuingnode2
docker-machine regenerate-certs -f issuingnode2
ECHO Joining the swarm
FOR /f "tokens=*" %%i IN ('docker-machine env issuingnode2') DO @%%i
FOR /f "delims=" %%a in ('docker-machine ip issuingnode2') do @set ip2=%%a
docker swarm join --token %swarmToken% %ip1%:2377


ECHO Creating machine issuingcompose
docker-machine create issuingcompose -d virtualbox
docker-machine stop issuingcompose
VBoxManage.exe sharedfolder add issuingcompose --name "/work" --hostpath "\\?\C:\Work\Git\" --automount
docker-machine start issuingcompose
docker-machine regenerate-certs -f issuingcompose
FOR /f "tokens=*" %%i IN ('docker-machine env issuingcompose') DO @%%i