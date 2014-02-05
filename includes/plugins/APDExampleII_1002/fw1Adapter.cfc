<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	
	<!--- Include FW/1 configuration that is shared between then adapter and the application. --->
	<cfinclude template="frameworkConfig.cfm">
	
	<!--- this is the plugin hook in for mura --->
	<cffunction name="onSiteRequestStart">
        <cfargument name="$">
        
        <!--- put the plugin into the event --->
        <cfset $[variables.framework.applicationKey]= this />
    </cffunction>

	<cffunction name="onApplicationLoad">
		<cfargument name="$">

		<cfset var sArgs	= StructNew() />
		<cfset sArgs.$		= arguments.$>

		<cfset request.pluginConfig=variables.pluginConfig>
		<!--- invoke onApplicationStart in the application.cfc so the framework can do its thing --->
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onApplicationStart" />

		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onGlobalSessionStart">
		<cfargument name="$">

		<!--- invoke onApplicationStart in the application.cfc so the framework can do its thing --->
		<cfinvoke component="#pluginConfig.getPackage()#.Application" method="onSessionStart" />
		
	</cffunction>
</cfcomponent>