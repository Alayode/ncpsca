<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="twoColSL depth#arrayLen($.event('crumbdata'))#">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	
<div id="leftcol"><div id="leftcopy">
	
			#$.dspObjects(1)#
		</div>
		
		
		<div id="rightcol"><img src="images/aboutus.jpg" style="float:right;" /><div id="clear"></div>
<div id="rightcopy">
		#$.dspObjects(2)#
		
		</div>
		
		
		<!-----
		<article>
			<nav>#$.dspCrumbListLinks("crumbList","&nbsp;&raquo;&nbsp;")#</nav> 
			#$.dspBody(body=$.content('body'),pageTitle=$.content(''),crumbList=0,showMetaImage=1)#
			
		</article>
		----->
	</div>
	<cfinclude template="inc/footer.cfm" />
</div>
</body>
</html>
</cfoutput>