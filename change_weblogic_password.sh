#Change admin password script
#change_weblogic_password.sh <newpassword> <server>
source /u01/app/oracle/middleware/wlserver_10.3/server/bin/setWLSEnv.sh
java weblogic.security.utils.AdminAccount weblogic $1 /u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain/security/
echo username=weblogic  >  /u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain/servers/$2/security/boot.properties
echo password=$1        >> /u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain/servers/$2/security/boot.properties
