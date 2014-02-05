<cfoutput>
		<plugin>
			
			<name> My First Plugin</name>
			<!----- packagename has to be unique----->
			<package> Myfirstplugin</package>
			<directoryformat>packageOnly</directoryformat>
			<loadpriority>5</loadpriority>
			<version>0</version>
			<provider>Chris Samuel</provider>
			<providerURL>aspca.chris.com</providerURL>
			<category>Application</category>
			<settings>
			</settings>
			<eventHandlers>
			</eventHandlers>
		<displayObjects location ="global">
			</displayObjects>
		</plugin>
		
</cfoutput>

<!---- 
The first part of this file connects us to the Mura Scope, the core tool in accessing the Mura API
 and a wealth of helper functions. If you are unfamiliar with the Mura Scope, you might want to read through the Programmer's 
Guide to completely familiarize yourself with it.--->
    <cfsilent>  
        <cfif not isDefined("$")>  
            <cfset $=application.serviceFactory.getBean('muraScope').init('default')>  
        </cfif>  
        <cfif not isDefined("variables.pluginConfig")>  
            <cfset variables.pluginConfig=$.getBean('pluginManager').getConfig('MyFirstPlugin')>  
        </cfif>  
    </cfsilent>  