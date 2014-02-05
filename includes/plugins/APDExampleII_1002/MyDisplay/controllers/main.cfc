<cfcomponent extends="controller">

	<cffunction name="default" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

	</cffunction>

	<cffunction name="saymyname" access="public" returntype="void" output="false">
		<cfargument name="rc" type="struct" required="false" default="#StructNew()#">

		<cfif $.currentUser().isLoggedIn()>
			<cfset rc.name = $.currentUser().getFName() & " " & $.currentUser().getLName() />
		<cfelse>
			<cfset rc.name = "" />
		</cfif>

		<cfif len( rc.name )>
			<cfset rc.welcome = "Welcome, #rc.name#, to your world!" />
		<cfelse>
			<cfset rc.welcome = "Sorry, you're a stranger to me." />
		</cfif>
	</cffunction>

</cfcomponent>