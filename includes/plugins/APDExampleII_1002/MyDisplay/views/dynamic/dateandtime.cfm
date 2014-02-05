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
	<cfif $.currentUser().isLoggedIn()>
		#$.currentUser().getFName()#, the time is #lsTimeFormat(now())# on #lsDateFormat(now())#.
	<cfelse>
		Er, you ... the time is #lsTimeFormat(now())# on #lsDateFormat(now())#.
	</cfif>
</div>	
<!--- end content --->
</cfoutput> 