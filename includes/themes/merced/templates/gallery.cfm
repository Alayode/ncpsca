<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#renderer.gettopid()#" class="oneCol">
<div id="container" class="#renderer.CreateCSSid(request.contentBean.getMenuTitle())#">
	<cfinclude template="inc/header.cfm" />
	<div id="content" class="clearfix">
		<div id="primary" class="content">
			<!---#renderer.dspCrumbListLinks("crumbList","&nbsp;&raquo;&nbsp;")#--->
			<img src="#$.content().getImageURL('medium')#" style="float:right;" id="conferencebanner">
			<div id="galleryLeft">
				#renderer.dspBody(body=request.contentBean.getbody(),pageTitle='',crumbList=0,showMetaImage=0)#
			</div>
			<div id="galleryNavRight">
				#renderer.dspObjects(3)#
			</div>
		</div>
	</div>
	<cfinclude template="inc/footer.cfm" />
</div>
</body>
</html>
</cfoutput>