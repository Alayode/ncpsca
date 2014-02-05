<cfsilent>
	<cfset local.rc = rc />
</cfsilent>
<cfoutput>
	<cfif local.rc.errorBean.hasErrors("notice")>
	<div class="notice">
		#local.rc.errorBean.hasErrors.displayErrorsHTML("notice")#
	</div>
	</cfif>
	<cfif local.rc.errorBean.hasErrors("custom")>
	<div class="error">
		#local.rc.errorBean.displayErrorsHTML("custom")#
	</div>
	</cfif>
</cfoutput>