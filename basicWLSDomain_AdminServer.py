#=======================================================================================
# This is an example of a simple WLST offline configuration script. The script creates
# a simple WebLogic SIP Server domain using the Basic WebLogic SIP Server Domain
# template. The script demonstrates how to open a domain template, create and edit
# configuration objects, and write the domain configuration information to the
# specified directory.
#
# The sample consists of a single server, representing a typical development environment.
# This type of configuration is not recommended for production environments.
#
# Please note that some of the values used in this script are subject to change based on
# your WebLogic installation and the template you are using.
#
# Usage:
#      java weblogic.WLST <WLST_script>
#
# Where:
#      <WLST_script> specifies the full path to the WLST script.
#=======================================================================================

#=======================================================================================
# Open a domain template.
#=======================================================================================

readTemplate("/u01/app/oracle/middleware/wlserver_10.3/common/templates/domains/wls.jar")

#=======================================================================================
# Configure the Administration Server and SSL port.
#
# To enable access by both local and remote processes, you should not set the
# listen address for the server instance (that is, it should be left blank or not set).
# In this case, the server instance will determine the address of the machine and
# listen on it.
#=======================================================================================

cd('Servers/AdminServer')
set('ListenAddress','')
set('ListenPort', 7001)

#create('AdminServer','SSL')
#cd('SSL/AdminServer')
#set('Enabled', 'True')
#set('ListenPort', 7002)

#=======================================================================================
# Define the user password for weblogic.
#=======================================================================================

cd('/')
cmo.setProductionModeEnabled(true)
cmo.setInternalAppsDeployOnDemandEnabled(false)
cd('Security/base_domain/User/weblogic')
# Please set password here before using this script, e.g. cmo.setPassword('value')
cmo.setPassword('weblogic1')

#=======================================================================================
# Write the domain and close the domain template.
#=======================================================================================

setOption('OverwriteDomain', 'true')
writeDomain('/u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain')
closeTemplate()

#=======================================================================================
# Set Admin Server Options
#=======================================================================================
#startServer('AdminServer','basicWLSSDomain','localhost:7001', 'weblogic',' weblogic1','/u01/app/oracle/middleware/user_projects/domains/basicWLSSDomain',' true')
#connect('weblogic', 'weblogic1', 'localhost:7001')
#edit()
#startEdit()
#cmo.setProductionModeEnabled(true)
#cmo.setInternalAppsDeployOnDemandEnabled(false)
#activate()
#disconnect()

#=======================================================================================
# Exit WLST.
#=======================================================================================

exit()
