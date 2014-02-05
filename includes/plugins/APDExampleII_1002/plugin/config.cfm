<cfsilent>
	<cfif not isDefined("pluginConfig")>
		<cfset pluginID=listLast(listGetat(getDirectoryFromPath(getCurrentTemplatePath()),listLen(getDirectoryFromPath(getCurrentTemplatePath()),application.configBean.getFileDelim())-1,application.configBean.getFileDelim()),"_")>
		<cfset variables.pluginConfig=application.pluginManager.getConfig(pluginID)>
	</cfif>
	
	<cfif variables.pluginConfig.getSetting("pluginMode") eq "Admin" and not isUserInRole('S2')>
		<cfif not structKeyExists(session,"siteID") or not application.permUtility.getModulePerm(variables.pluginConfig.getValueq('moduleID'),session.siteid)>
			<cfoutput>You do not have permission to enter this area.</cfoutput>
			<cfabort>
			<!---<cflocation url="#application.configBean.getContext()#/admin/?fuseaction=cLogin.logout" addtoken="false">--->
		</cfif>
	</cfif>
	<cfif not isDefined("variables.$")>
		<cfset $=application.serviceFactory.getBean("MuraScope")>
		<cfset sInitArgs = StructNew()>
		<cfif  structKeyExists(session,"siteID")>
			<cfset sInitArgs.siteID = session.siteID>
		<cfelse>
			<cfset sInitArgs.siteID = "default">
		</cfif>
		<cfset variables.$.init(sInitArgs)>
		<cfset $.event().setValue("smasher",StructNew())>
	</cfif>
</cfsilent>