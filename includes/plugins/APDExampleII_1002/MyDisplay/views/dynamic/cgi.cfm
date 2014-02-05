<cfsilent>
	<!--- use 'local' to keep view-related data in-scope --->
	<cfset local.rc			= rc>
	<!--- headers --->
	<cfoutput>
	</cfoutput>
</cfsilent><cfoutput>
<!--- global menu --->
<!--- begin content --->
<div id="plugin-body">
	<!-- CONTENT HERE -->
	<ul>
	<cfloop collection="#cgi#" item="local.x">
		<li>#local.x#: #cgi[local.x]#</li>
	</cfloop>
	</ul>
	
</div>	
<!--- end content --->
</cfoutput> 