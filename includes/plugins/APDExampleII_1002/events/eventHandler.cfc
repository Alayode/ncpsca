<cfcomponent extends="mura.plugin.pluginGenericEventHandler">
	<cffunction name="onApplicationLoad">
		<cfargument name="$">
		
		<cfset variables.pluginConfig.addEventHandler(this)>
	</cffunction>
	
	<cffunction name="onSiteRequestStart">
		<cfargument name="$">
	</cffunction>

	<cffunction name="onSiteRequestInit" output="false" returntype="void">
		<cfargument name="$">
		<cfreturn>
		<!---<cfset var beanFactory	= pluginConfig.getApplication().getValue('beanFactory') />--->
	</cffunction>
</cfcomponent>