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
	The time is #lsTimeFormat(now())#.
</div>	
<!--- end content --->
</cfoutput> 