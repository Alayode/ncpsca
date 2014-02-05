<cfsilent>
<cfsavecontent variable="local.str"><cfoutput>
<link rel="stylesheet" href="#$.globalConfig().getContext()#/plugins/#local.rc.directory#/#rc.subsystem#/assets/css/base.css" type="text/css" media="screen" />
<script type="text/javascript" src="#$.globalConfig().getContext()#/plugins/#local.rc.directory#/#rc.subsystem#/assets/css/base.js"></script>
</cfoutput>
</cfsavecontent>
<cfset arrayPrepend( rc.headLoader,local.str )>
</cfsilent>