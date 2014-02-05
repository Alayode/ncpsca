	<cfcomponent output="false">

	<cfset variables.config=""/>
	
	<cffunction name="init" returntype="any" access="public" output="false">
		<cfargument name="config"  type="any" default="">
		<cfset variables.config = arguments.config>
	</cffunction>
	
	<cffunction name="install" returntype="void" access="public" output="false">
		<cfset var serviceFactory	= variables.config.getApplication().getValue("serviceFactory")>
		<cfset var dsn				= variables.config.getSetting( "dsn" )>
		<cfset var dsnusername		= variables.config.getSetting( "dsnusername" )>
		<cfset var dsnpassword		= variables.config.getSetting( "dsnpassword" )>
		<cfset var dsnprefix		= variables.config.getSetting( "dsnprefix" )>
		<cfset var dbtype			= variables.config.getSetting( "dbtype" )>
		<cfset var tablename		= "#dsnprefix#mf_settings">
		<cfset var errorType		= "">
		<cfset var msg				= "">
		<cfset var sql				= "">
		<cfset var aSql				= "">
		<cfset var iiX				= "">
		<cfset var error 			= false>

		<cfset application.appInitialized=false />

		<cfif not isUserInRole("s2")>
			<cflocation url="./?ecode=3000" addtoken="false">
		</cfif>
				
		<!--- step one ... ensure that the datasource exists --->
		<cftry>
			<cfquery name="qExists" datasource="#dsn#" username="#dsnusername#"  password="#dsnpassword#" maxrows="1">
				SELECT count(1) as idexists
				FROM	#dsnprefix#mf_settings
				WHERE	settingsID = <cfqueryparam value="00000000-0000-0000-0000000000000002" CFSQLType="cf_sql_varchar" />
			</cfquery>

			<cfif qExists.recordCount>
				<cfreturn>
			</cfif>

			<cfcatch type="database">
				<!--- combine the message and detail so we can check against the both as the CFML engines do not contain similar structures of information --->
				
				<cfset msg = cfcatch.message & cfcatch.detail />
				
				<!--- check to see if the db is there --->
				<cfif FindNoCase( tablename, msg ) or FindNoCase( "00942", msg )>
					<cfset errorType = "database" />
				</cfif>
				
				<!--- check to see if it's a datasource error --->
				<cfif REFindNoCase( "datasource (.*?) doesn't exist", msg )
					OR REFindNoCase( "can't connect to datasource (.*?)", msg )
					OR FindNoCase( "Login failed", msg )
					OR FindNoCase( "Access denied", msg )>
					<cfset errorType = "datasource" />
				</cfif>
				<!--- check to see if it's a broken pipe error --->
				<cfif FindNoCase( "broken pipe", msg )>
					<cfset errorType = "brokenpipe" />
				</cfif>
				
				<!--- if an error is not caught then catch it anyways and log it to a file for review --->
				<cfif not len(errorType)>
					<cfset errorType = "unknown" />
				</cfif>
				<cfif errorType neq "database">
					<cfset error = true>
					<!---<cfset serviceFactory.getBean("ErrorManager").addError(event,cfcatch.message,errorType,cfcatch.errorcode,cfcatch.detail)>--->
				</cfif>
			</cfcatch>
			<cfcatch type="any">
				<!--- if an error is not caught then catch it anyways and log it to a file for review --->
				<cfset errorType = "unknown" />
				<cfset error = true>
				<!---<cfset serviceFactory.getBean("ErrorManager").addError(event,cfcatch.message,cfcatch.type,cfcatch.errorcode,cfcatch.detail)>--->
			</cfcatch>
		</cftry>
		
		<cfif error>
			<cfreturn>
		</cfif>
		
		<!--- get selected DB type --->
		<cffile action="read" file="#expandPath("/plugins")#/#variables.config.getDirectory()#/install/db/#dbtype#.sql" variable="sql" />
		
		<cfset sql = replacenocase(sql,"||PRE||",dsnprefix,"all")>
			
		<cfswitch expression="#dbtype#">
			<cfcase value="mysql">
				<cfset aSql = ListToArray(sql, ';')>
				<!--- loop over items --->
	            <cfloop index="iiX" from="1" to="#arrayLen(aSql) - 1#">
		            <!--- we placed a small check here to skip empty rows --->
		            <cfif len( trim( aSql[iiX] ) )>
		            	<cfquery datasource="#dsn#" username="#dsnusername#" password="#dsnpassword#">
		                    #keepSingleQuotes(aSql[iiX])#
		                </cfquery>
					
		                <!---<cfquery datasource="#dsn#" username="#dsnusername#" password="#dsnpassword#">
		                    #keepSingleQuotes(aSql[iiX])#
		                </cfquery>--->
	                </cfif>
	            </cfloop>
			</cfcase>
			<cfcase value="mssql">
				<cfset aSql = ListToArray(sql, ';')>
				<!--- loop over items --->
	            <cfloop index="iiX" from="1" to="#arrayLen(aSql) - 1#">
		            <!--- we placed a small check here to skip empty rows --->
		            <cfif len( trim( aSql[iiX] ) )>
		            	<cfquery datasource="#dsn#" username="#dsnusername#" password="#dsnpassword#">
		                    #keepSingleQuotes(aSql[iiX])#
		                </cfquery>
					
		                <!---<cfquery datasource="#dsn#" username="#dsnusername#" password="#dsnpassword#">
		                    #keepSingleQuotes(aSql[iiX])#
		                </cfquery>--->
	                </cfif>
	            </cfloop>
			</cfcase>
		</cfswitch>
		
		<cfif error>
			<cfreturn>
		</cfif>
	</cffunction>

	<cffunction name="keepSingleQuotes" returntype="string" output="false">
		<cfargument name="str">
		<cfreturn preserveSingleQuotes(arguments.str)>
	</cffunction>
	
	<cffunction name="update" returntype="void" access="public" output="false">
		<cfset application.appInitialized=false />
		<!---
       	<cfquery datasource="#dsn#" username="#dsnusername#" password="#dsnpassword#">
			ALTER TABLE mf_forum ADD COLUMN `lastPostID` CHAR(35) AFTER `filename`;
		</cfquery>
		--->
	</cffunction>
	
	<cffunction name="delete" returntype="void" access="public" output="false">

	</cffunction>

</cfcomponent>