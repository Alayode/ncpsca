<!--- Do Not Edit --->
<cfif not isDefined('this.name')>
<cfoutput>Access Restricted.</cfoutput>
<cfabort>
</cfif>
<cfset this.mappings["/APDExampleII"] = variables.mapPrefix & variables.BaseDir & "/plugins/APDExampleII_1002">
<cfset this.mappings["/Myfirstplugin"] = variables.mapPrefix & variables.BaseDir & "/plugins/Myfirstplugin">
