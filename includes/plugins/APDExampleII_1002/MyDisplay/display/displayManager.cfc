<cfcomponent name="displayManager" output="false" extends="mura.plugin.pluginGenericEventHandler">

	<cfinclude template="../../frameworkConfig.cfm">
	
	<cffunction name="doEvent">
		<cfargument name="$">
		<cfargument name="action" type="string" required="false" default="" hint="Optional: If not passed it looks into the event for a defined action, else it uses the default"/>
		
		<cfset var result = "" />
		<cfset var savedEvent = "" />
		<cfset var savedAction = "" />
		<cfset var fw1 = createObject("component","#pluginConfig.getPackage()#.Application") />
		<cfset var params = deserializeJSON( $.event().getValue("params") ) />

		<!--- remember to name the subsystem ... less expensive than parsing out on every request --->
		<cfset variables.subsystem = "MyDisplay:" />

		<cfif not isStruct(params)>
			<cfset params = StructNew() />
		</cfif>
			
		<cfset url.$ = $ />

		<cfif StructKeyExists(params,"action")>
			<cfset arguments.action = variables.subsystem & params.action />
		<cfelseif not len( arguments.action )>
			<cfif len(arguments.$.event(variables.framework.action))>
				<cfset arguments.action = variables.subsystem & arguments.$.event(variables.framework.action)>
			<cfelse>
				<cfset arguments.action = variables.subsystem & variables.framework.home>
			</cfif>
		<cfelse>
			<cfset arguments.action = variables.subsystem & arguments.action>
		</cfif>

		<!--- put the action passed into the url scope, saving any pre-existing value --->
		<cfif StructKeyExists(request, variables.framework.action)>
			<cfset savedEvent = request[variables.framework.action] />
		</cfif>
		<cfif StructKeyExists(url,variables.framework.action)>
			<cfset savedAction = url[variables.framework.action] />
		</cfif>
		
		<cfset url[variables.framework.action] = arguments.action />
		
		<!--- call the frameworks onRequestStart --->
		<cfset fw1.onRequestStart(CGI.SCRIPT_NAME) />

		<cfset request.context.params = params />
		
		<!--- call the frameworks onRequest --->
		<!--- we save the results via cfsavecontent so we can display it in mura --->
		<cfsavecontent variable="result">
			<cfset fw1.onRequest(CGI.SCRIPT_NAME) />
		</cfsavecontent>
		
		<!--- restore the url scope --->
		<cfif structKeyExists(url,variables.framework.action)>
			<cfset structDelete(url,variables.framework.action) />
		</cfif>
		<!--- if there was a passed in action via the url then restore it --->
		<cfif Len(savedAction)>
			<cfset url[variables.framework.action] = savedAction />
		</cfif>
		<!--- if there was a passed in request event then restore it --->
		<cfif Len(savedEvent)>
			<cfset request[variables.framework.action] = savedEvent />
		</cfif>

		<!--- remove the content from the request scope --->
		<cfset structDelete( request, "context" )>
		<cfset structDelete( request, "serviceExecutionComplete" )>
		<cfset structDelete( request, "controllerExecutionStarted" )>

		<!--- return the result --->
		<cfreturn result>
	</cffunction>

	<!--- ADD CUSTOMIZATIONS BELOW --->

	<cffunction name="displayOne" output="false" returntype="String" >
		<cfargument name="$">

		<cfreturn doEvent(arguments.$,"main.saymyname")>
	</cffunction>

	<cffunction name="displayTwo" output="false" returntype="String" >
		<cfargument name="$">

		<cfreturn doEvent(arguments.$,"main.saythetime")>
	</cffunction>

	<cffunction name="displayDynamic" output="false" returntype="String" >
		<cfargument name="$">

		<cfreturn doEvent(arguments.$)>
	</cffunction>

	<!--- Mura Content Object dropdown renderer --->
	<cffunction name="displayDynamicOptionsRender" output="false" returntype="any">
		<cfargument name="$">
		<cfargument name="event">
	
		<cfset var str="">
		<cfsavecontent variable="str"><cfoutput>
		<select name="availableObjects" id="availableObjects" class="multiSelect" size="14" style="width: 310px;">
			<option value="plugin~Date~#arguments.event.getValue("ObjectID")#~{'action':'dynamic.date'}">Date</option>
			<option value="plugin~Time~#arguments.event.getValue("ObjectID")#~{'action':'dynamic.time'}">Time</option>
			<option value="plugin~Date and Time~#arguments.event.getValue("ObjectID")#~{'action':'dynamic.dateandtime'}">Date and Time</option>
			<option value="plugin~CGI~#arguments.event.getValue("ObjectID")#~{'action':'dynamic.cgi'}">CGI</option>
		</select>
		</cfoutput></cfsavecontent>
	
		<cfreturn str>
	</cffunction>


</cfcomponent>