<cfcomponent extends="framework" output="false">
	<cfset request.tcCount = getTickCount() />
	<cfinclude template="../../config/applicationSettings.cfm">
	<cfinclude template="../../config/mappings.cfm">
	<cfinclude template="../mappings.cfm">
	<cfinclude template="frameworkConfig.cfm">
	
	<cffunction name="isAdminRequest">
		<cfreturn variables.pluginConfig.getSetting("pluginMode") eq true/>
	</cffunction>
	
	<cffunction name="secureRequest" output="false">
		<cfif isAdminRequest() and not isUserInRole('S2')>
			<cfif not structKeyExists(session,"siteID") or not application.permUtility.getModulePerm(getBeanFactory("pluginConfig").getValue('moduleID'),session.siteid)>
				<cflocation url="#$.globalConfig().getContext()#/admin/" addtoken="false">
			</cfif>
		</cfif>
	</cffunction>
	
	<cffunction name="setupRequest" output="false">
		<cfif not isDefined("variables.$") and structKeyExists(session,"siteID")>
			<cfset variables.$=application.serviceFactory.getBean("MuraScope")>
			<cfset sInitArgs = StructNew()>
			<cfset sInitArgs.siteID = session.siteID>
			<cfset variables.$.init(sInitArgs)>
		</cfif>
		<cfset secureRequest()>
	</cffunction>

	<cffunction name="setupApplication" output="false">
		<!---
		<cfset var beanFactory				= "" />
		<cfset var coldspringXml			= "" />
		<cfset var coldspringXmlPath		= "" />
		<cfset var displayPath				= "" />
		<cfset var defaultProperties		= StructNew()>
		--->

		<!--- ensure that we have PluginConfig in the variables scope --->
		<cfif not structKeyExists(variables,"pluginConfig")>
			<cfinclude template="plugin/config.cfm" />
		</cfif>

		<cfif not structKeyExists(variables,"$")>
			<cfinclude template="plugin/config.cfm" />
		</cfif>

		<!--- set the pluginConfig for our plugin into the fw1 application scope --->
		<cfset setPluginConfig( variables.pluginConfig )>

		<!---
		<cfset coldspringXmlPath	= "#expandPath('/plugins')#/#variables.pluginConfig.getDirectory()#/coldspring/coldspring.xml.cfm" />

		<cfif fileExists( coldspringXmlPath )>
			<!--- read in coldspringXml --->
			<cffile action="read" file="#coldspringXmlPath#" variable="coldspringXml" />
	
			<!--- parse the coldspringXml and replace all [plugin] with the plugin mapping path, and |plugin| with the physical path --->
			<cfset coldspringXml = replaceNoCase( coldspringXml, "[plugin]", "plugins.#variables.pluginConfig.getDirectory()#.", "ALL") />
			<cfset coldspringXml = replaceNoCase( coldspringXml, "|plugin|", "plugins/#variables.pluginConfig.getDirectory()#/", "ALL") />
	
			<!--- set the default values --->
			<cfset defaultProperties.dsn				= variables.pluginConfig.getSetting( "dsn" )>
			<cfset defaultProperties.dsnusername		= variables.pluginConfig.getSetting( "dsnusername" )>
			<cfset defaultProperties.dsnpassword		= variables.pluginConfig.getSetting( "dsnpassword" )>
			<cfset defaultProperties.dsnprefix			= variables.pluginConfig.getSetting( "dsnprefix" )>
			<cfset defaultProperties.dsntype			= variables.pluginConfig.getSetting( "dsntype" )>
	
			<!--- build CS factory --->
			<cfset beanFactory=createObject("component","coldspring.beans.DefaultXmlBeanFactory").init( defaultProperties=defaultProperties ) />
	
			<!--- load beans --->
			<cfset beanFactory.loadBeansFromXmlRaw( coldspringXml ) />
	
			<!--- set the FW/1 bean factory as our new ColdSpring bean factory --->
			<cfset setBeanFactory( beanFactory ) />
	
			<!--- push the ColdSpring factory into plugin application scope --->
			<cfset variables.pluginConfig.getApplication().setValue( "beanFactory", beanFactory ) />
		</cfif>
		
		--->
	
		<cfset loadSubSystems() />
	</cffunction>

	<cffunction name="setupSubsystem" output="false">
		<cfargument name="subsystem" type="string" required="true" />
		<!---
		<cfset var beanFactory				= "" />
		<cfset var coldspringXml			= "" />
		<cfset var coldspringXmlPath		= "" />
		<cfset var defaultProperties		= StructNew()>
	
		<cfif not structKeyExists(variables,"pluginConfig")>
			<cfinclude template="plugin/config.cfm" />
		</cfif>

		<cfset coldspringXmlPath = "#displayPath#/coldspring/coldspring.xml.cfm" />

		<!--- if the subApplication has it's own bean factory, read in coldspringXml --->
		<cfif fileExists( coldspringXmlPath )>
			<cffile action="read" file="#coldspringXmlPath#" variable="coldspringXml" />
	
		<!--- parse the coldspringXml and replace all [plugin] with the plugin mapping path, and |plugin| with the physical path --->
			<cfset coldspringXml = replaceNoCase( coldspringXml, "[plugin]", "plugins.#variables.pluginConfig.getDirectory()#.#arguments.subsystem#.", "ALL") />
			<cfset coldspringXml = replaceNoCase( coldspringXml, "|plugin|", "plugins/#variables.pluginConfig.getDirectory()#/#arguments.subsystem#/", "ALL") />
	
			<!--- set the default values --->
			<cfset defaultProperties.dsn				= variables.pluginConfig.getSetting( "dsn" )>
			<cfset defaultProperties.dsnusername		= variables.pluginConfig.getSetting( "dsnusername" )>
			<cfset defaultProperties.dsnpassword		= variables.pluginConfig.getSetting( "dsnpassword" )>
			<cfset defaultProperties.dsnprefix			= variables.pluginConfig.getSetting( "dsnprefix" )>
			<cfset defaultProperties.dsntype			= variables.pluginConfig.getSetting( "dsntype" )>
	
			<!--- build CS factory --->
			<cfset beanFactory=createObject("component","coldspring.beans.DefaultXmlBeanFactory").init( defaultProperties=defaultProperties ) />
			<!--- load beans --->
			<cfset beanFactory.loadBeansFromXmlRaw( coldspringXml ) />
			<!--- set the main FW/1 bean factory as the parent factory --->
			<cfset beanFactory.setParent( variables.pluginConfig.getApplication().getValue("beanFactory") ) />
			<cfset setSubsystemBeanFactory( subsystem, beanFactory )>
		</cfif>
		--->
	</cffunction>

	<cffunction name="loadSubsystems" output="false">
		<cfset setupSubSystem( "MyDisplay" ) />
	</cffunction>

	<cffunction name="setPluginConfig" output="false">
		<cfargument name="pluginConfig" type="any" required="true">
		<cfset application[ variables.framework.applicationKey ].pluginConfig = arguments.pluginConfig>
	</cffunction>

	<cffunction name="getPluginConfig" output="false">
		<cfreturn application[ variables.framework.applicationKey ].pluginConfig>
	</cffunction>

	<cffunction name="onRequestEnd" output="false">
	</cffunction>
</cfcomponent>