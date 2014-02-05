<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="twoColSL depth#arrayLen($.event('crumbdata'))#">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	
<div id="leftcol">
		#$.dspObjects(1)#
</div>
<div id="rightcol">
		#$.dspObjects(3)#
</div>

	<cfinclude template="inc/footer_b.cfm" />
</div>
</body>
</html>
</cfoutput>