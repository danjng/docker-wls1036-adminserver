#!/bin/bash
#entrypoint.sh <server> <password>
source /u02/app/oracle/product/fmw/wlserver_10.3/server/bin/setWLSEnv.sh

/u02/app/oracle/product/fmw/change_weblogic_password.sh $2 $1

/u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/startWebLogic.sh

