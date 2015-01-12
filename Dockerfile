# Version: 0.0.7 Weblogic 10.3.6 Basic Domain and Admin Server
# Username: weblogic
# Password: weblogic1 but set a runtime
# http://<IP>:7001/console/
# docker run -d -p <IP>:7001:7001 unbc/weblogic1036adminserver <newpassword>

FROM unbc/weblogic1036
MAINTAINER Trevor Fuson "trevor.fuson@unbc.ca"

ADD basicWLSDomain_AdminServer.py /u01/app/oracle/middleware/wlserver_10.3/common/templates/scripts/wlst/

RUN /bin/bash -c "source /u01/app/oracle/middleware/wlserver_10.3/server/bin/setWLSEnv.sh" \
    && /u01/app/oracle/middleware/wlserver_10.3/common/bin/wlst.sh /u01/app/oracle/middleware/wlserver_10.3/common/templates/scripts/wlst/basicWLSDomain_AdminServer.py

ADD change_weblogic_password.sh /u01/app/oracle/middleware/

ADD entrypoint.sh /u01/app/oracle/middleware/

RUN [ "chmod", "a+x", "/u01/app/oracle/middleware/change_weblogic_password.sh", "/u01/app/oracle/middleware/entrypoint.sh" ]

ENTRYPOINT [ "/u01/app/oracle/middleware/entrypoint.sh", "AdminServer" ]

EXPOSE 7001