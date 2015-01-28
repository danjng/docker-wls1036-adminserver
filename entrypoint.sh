#!/bin/bash
#entrypoint.sh <server> <password>
source /u02/app/oracle/product/fmw/wlserver_10.3/server/bin/setWLSEnv.sh

/u02/app/oracle/product/fmw/change_weblogic_password.sh $2 $1

#/u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/startWebLogic.sh 
#-Dssl.debug=true -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.SSL.enforceConstraints=off

(export JAVA_OPTIONS="$JAVA_OPTIONS -Dssl.debug=true -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.SSL.enforceConstraints=off" && /u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/startWebLogic.sh) 

#/u02/app/oracle/product/fmw/wlserver_10.3/server/bin/startNodeManager.sh
#-Dssl.debug=true -Dweblogic.nodemanager.sslHostNameVerificationEnabled=false -Dweblogic.security.SSL.enforceConstraints=off

#(export JAVA_OPTIONS="$JAVA_OPTIONS -Dssl.debug=true -Dweblogic.security.SSL.ignoreHostnameVerification=true -Dweblogic.security.SSL.enforceConstraints=off" && /u02/app/oracle/product/fmw/wlserver_10.3/server/bin/startNodeManager.sh)

#/bin/bash 