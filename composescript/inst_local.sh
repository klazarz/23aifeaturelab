#!/bin/bash


source $(pwd)/.env


## load variables (scripts, passwords, etc)

rm -rf $(pwd)/envvar

## create the compose script folder and files
mkdir -p $(pwd)/envvar
chmod 777 $(pwd)/envvar/

mkdir -p $(pwd)/ords_config
chmod 777 $(pwd)/ords_config

export vncpwd="$vncpwdlocal"
echo $vncpwd | tee $(pwd)/envvar/.vncpwd > /dev/null
echo vncpwd=$(cat $(pwd)/envvar/.vncpwd) > $(pwd)/envvar/.vncpwd.env

echo "USERNAME=admin" >> $(pwd)/envvar/.env
echo "DBPASSWORD=${dbpassword}" >> $(pwd)/envvar/.env
echo "ORACLE_PWD=${dbpassword}" >> $(pwd)/envvar/.env
echo "DBCONNECTION=${dbconnectionlocal}" >> $(pwd)/envvar/.env
echo "PUBLIC_IP=${public_ip}" >> $(pwd)/envvar/.env
echo "dbname=${dbnamelocal}" >> $(pwd)/envvar/.env
echo "ORDSURL=${ordsurllocal}" >> $(pwd)/envvar/.env
echo "SERVICE_NAME=${dbname}" >> $(pwd)/envvar/.env


cp $(pwd)/envvar/.env $(pwd)/app/simidemo/.
cp $(pwd)/envvar/.env $(pwd)/lab/simidemo/.

cp $(pwd)/envvar/.env $(pwd)/app/demoapp/.
cp $(pwd)/envvar/.env $(pwd)/lab/demoapp/.

mkdir -p $(pwd)/envvar/.jupyter

cp -r $(pwd)/jl_config/* $(pwd)/envvar/.jupyter/.

mkdir -p $(pwd)/envvar/.local/share/code-server/User/
cp -r $(pwd)/vscode-config/* $(pwd)/envvar/.local/share/code-server/User/. 


podman compose up




#######    E N D      S C R I P T    ######
