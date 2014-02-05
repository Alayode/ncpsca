    <cfinclude template="plugin/config.cfm">  
    <cfset local = StructNew() />  
    <cfsavecontent variable="local.newBody">  
    <cfoutput>  
    Mura Scope? #isDefined("$")#<br />  
    Plugin Config? #isDefined("variables.pluginConfig")#<br />  
    Hello from my first plugin: <b>#variables.pluginConfig.getName()#</b>!  
    </cfoutput>  
    </cfsavecontent>  
    <cfoutput>#$.getBean('pluginManager').renderAdminTemplate(body=local.newBody,pageTitle=variables.pluginConfig.getName())#</cfoutput>  