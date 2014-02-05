<cfoutput>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="description" content="#HTMLEditFormat($.getMetaDesc())#" />
	<meta name="keywords" content="#HTMLEditFormat($.getMetaKeywords())#" />
	<cfif request.contentBean.getCredits() neq ""><meta name="author" content="#HTMLEditFormat($.content('credits'))#" /></cfif>
	<meta name="generator" content="Mura CMS #$.globalConfig('version')#" />
	<!--- <meta name="robots" content="noindex, nofollow" /> ---><!--- use this to discourage search engines from indexing your site. (can be useful if developing on a live server for example) Delete if not needed. --->
	<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" /> <!--- Disables IE Compatibility Mode --->
	<title>#HTMLEditFormat($.content('HTMLTitle'))# - #HTMLEditFormat($.siteConfig('site'))#</title>

	<link rel="icon" href="#$.siteConfig('assetPath')#/images/favicon.ico" type="image/x-icon" />
	<link rel="shortcut icon" href="#$.siteConfig('assetPath')#/images/favicon.ico" type="image/x-icon" />

	<!--- Shared Styles --->	

	<!--- Theme-Specific Styles --->
	<!--- ** Optimized Method of CSS Inclusion ** --->
	<cf_CacheOMatic key="globalheadercss">
	#$.static()
		.include("/css/aspca/")
		.renderIncludes("css")#
	</cf_CacheOMatic>

	<!--- ** HTML5 compatibility code needs to be run before parsing dom. 
		  ** Other JS should be added with in the footer.cfm with $.static()	
	--->
	<!--[if lte IE 8]>
	<script src="#$.siteConfig('themeAssetPath')#/js/ie/lte8/html5.js" type="text/javascript" language="Javascript"></script>
	<![endif]-->

	<cfset rs=$.getBean('feedManager').getFeeds($.event('siteID'),'Local',false,false) />
	<cfloop query="rs">
	<link rel="alternate" type="application/rss+xml" title="#HTMLEditFormat($.siteConfig('site'))# - #HTMLEditFormat(rs.name)#" href="#XMLFormat('http://#listFirst(cgi.http_host,":")##$.globalConfig('context')#/tasks/feed/?feedID=#rs.feedID#')#" />
	</cfloop>

</head>
</cfoutput>




<!---------- One Column ----------->

<!-------<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="oneCol depth#arrayLen($.event('crumbdata'))#">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	<div id="content" class="clearfix">
		<article>
			<nav>#$.dspCrumbListLinks("crumblist","&nbsp;&raquo;&nbsp;")#</nav>
			#$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
			#$.dspObjects(2)#
		</article>
	</div>
	<cfinclude template="inc/footer.cfm" />
</div>
</body>
</html>
</cfoutput>



---------->







<!-----Two Column _SL ---->
  

<!---------
<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="twoColSL depth#arrayLen($.event('crumbdata'))#">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	<div id="content" class="clearfix">
		<aside id="left">
			#$.dspObjects(1)#
			#$.dspObjects(4)#
			#$.dspObjects(2)#
		</aside>
		<article>
			<nav>#$.dspCrumbListLinks("crumblist","&nbsp;&raquo;&nbsp;")#</nav>
			#$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
			#$.dspObjects(2)#<br>
			
		</article>
	</div>
	<cfinclude template="inc/footer.cfm" />
</div>
</body>
</html>
</cfoutput>

<cfdump var="#event.getALLVALUES#"  />
-------->






<!------- Two Column_SR ---------->





<!-----------
<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="twoColSR depth#arrayLen($.event('crumbdata'))#">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
	<div id="content" class="clearfix">
		<article>
			
			
			<nav>#$.dspCrumbListLinks("crumblist","&nbsp;&raquo;&nbsp;")#</nav>
			#$.dspBody(body=$.content('body'),pageTitle=$.content('title'),crumbList=0,showMetaImage=1)#
			#$.dspObjects(2)#
			
		
		</article>
		<aside id="right">
			#$.dspObjects(3)#
		</aside>
	</div>
	<cfinclude template="inc/footer.cfm" />
</div>
</body>
</html>
</cfoutput>

	<cfdump var="#event.getALLVALUES#"  />
---------->



