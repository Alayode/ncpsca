<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="home">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
		<div id="content" class="clearfix">
		<article>
			

			
			#$.dspBody(body=$.content('body'),pageTitle="",crumbList=0,showMetaImage=0)#
			
		</article>
		<!-----
		<aside id="right">
			#$.dspObjects(2)#
		</aside>
		---->
		<div id="home-right">
			#$.dspObjects(2)#
	</div>
	<div >
		</div>
		<br/>
<br/>
<br/>
<br/>
<cfinclude template="inc/footer_b.cfm" />
		</div>
</body>
</html>
</cfoutput>


<!-----Dump------>


<!-----
<cfdump var="#event.getALLVALUES#"  />
------->