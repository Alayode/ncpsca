<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="home">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	
		
	<cfinclude template="inc/footer_b.cfm" />
</div>
</body>
</html>
</cfoutput>