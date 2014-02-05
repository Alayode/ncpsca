<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="home">
		<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
		<div id="content" class="clearfix">
		
		<div id="home-left">
		<div id="adoptme">
	<p><a href="/adoption.cfm">Click here</a> to search for more loveable and adoptable pets, all waiting for new homes and families.</p>
	</div>
	</div>
		<div id="home-right">
	<cfdump var = "#$.getbean('feed').loadby(name='Featured Animals').getIterator()#">
						
	</div>
		<div>
		</div>

<cfinclude template="inc/footer_b.cfm" />
</div>
</body>
</html>
</cfoutput>
<!------



------->