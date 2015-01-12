#!/bin/bash
#entrypoint.sh <server> <password>
source /u01/app/oracle/middleware/wlserver_10.3/server/bin/setWLSEnv.sh

/u01/app/oracle/middleware/change_weblogic_password.sh $2 $1

/u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain/startWebLogic.sh

