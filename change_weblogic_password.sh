#Change admin password script
#change_weblogic_password.sh <newpassword> <server>
source /u02/app/oracle/product/fmw/wlserver_10.3/server/bin/setWLSEnv.sh
java weblogic.security.utils.AdminAccount weblogic $1 /u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/security/
echo username=weblogic  >  /u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/servers/$2/security/boot.properties
echo password=$1        >> /u02/app/oracle/product/fmw/user_projects/domains/basicWLSSDomain/servers/$2/security/boot.properties
