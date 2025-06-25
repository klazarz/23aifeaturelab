#!/bin/bash


source $(pwd)/.env


## load variables (scripts, passwords, etc)

## create the compose script folder and files
mkdir -p $(pwd)/composescript/envvar
chmod 777 $(pwd)/composescript/envvar/

mkdir -p $(pwd)/composescript/ords_config
chmod 777 $(pwd)/composescript/ords_config

export vncpwd="$vncpwdlocal"
echo $vncpwd | tee $(pwd)/composescript/envvar/.vncpwd > /dev/null
echo vncpwd=$(cat $(pwd)/composescript/envvar/.vncpwd) > $(pwd)/composescript/envvar/.vncpwd.env

echo "USERNAME=admin" >> $(pwd)/composescript/envvar/.env
echo "DBPASSWORD=${dbpassword}" >> $(pwd)/composescript/envvar/.env
echo "ORACLE_PWD=${dbpassword}" >> $(pwd)/composescript/envvar/.env
echo "DBCONNECTION=${dbconnectionlocal}" >> $(pwd)/composescript/envvar/.env
echo "PUBLIC_IP=${public_ip}" >> $(pwd)/composescript/envvar/.env
echo "dbname=${dbnamelocal}" >> $(pwd)/composescript/envvar/.env
echo "ORDSURL=${ordsurllocal}" >> $(pwd)/composescript/envvar/.env
echo "SERVICE_NAME=${dbname}" >> $(pwd)/composescript/envvar/.env


cp $(pwd)/composescript/envvar/.env $(pwd)/composescript/app/simidemo/.
cp $(pwd)/composescript/envvar/.env $(pwd)/composescript/lab/simidemo/.

cp $(pwd)/composescript/envvar/.env $(pwd)/composescript/app/demoapp/.
cp $(pwd)/composescript/envvar/.env $(pwd)/composescript/lab/demoapp/.

mkdir -p $(pwd)/composescript/envvar/.jupyter

cp -r $(pwd)/composescript/jl_config/* $(pwd)/composescript/envvar/.jupyter/.

mkdir -p $(pwd)/composescript/envvar/.local/share/code-server/User/
cp -r $(pwd)/composescript/vscode-config/* $(pwd)/composescript/envvar/.local/share/code-server/User/. 


podman compose up




#######    E N D      S C R I P T    ######
