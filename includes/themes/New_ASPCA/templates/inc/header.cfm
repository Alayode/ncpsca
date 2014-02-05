<cfinclude template="html_head.cfm"/>

<cfoutput>






<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>NCSPCA</title>
<link href="css/style.css" rel="stylesheet" type="text/css" />
<!--[if IE 7]>
<link href="css/ie7.css" rel="stylesheet" type="text/css" />
<![endif]-->

	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3/jquery.min.js">
</script>

<script type="text/javascript" src="js/jquery.simplyscroll-1.0.4.min.js"></script>


</head>



<!---
<cf_CacheOMatic key="dspPrimaryNav#request.contentBean.getcontentID()#">
			#$.dspPrimaryNav(
				viewDepth="1",
				id="nav",
				displayHome="Always",
				closePortals="false",
				showCurrentChildrenOnly="false"
				)#</cf_cacheomatic>
				---->
</cfoutput>















<!---
    <div id="nav">
        <ul>
        <li><a href="/about.cfm">About Us</a></li>
        <li>|</li>
        <li><a href="/law-enforcement.cfm">Law Enforcement</a></li>
        <li>|</li>
        <li><a href="/adoption.cfm">Adoption</a></li>
        <li>|</li>
        <li><a href="/pet-care.cfm">Pet Care</a></li>
        <li>|</li>
        <li><a href="/get-involved.cfm">Get Involved</a></li>
        <li>|</li>
        <li><a href="/links-calendar.cfm">Links/Calendar</a></li>
        <li>|</li>
        <li><a href="/faq.cfm">FAQ</a></li>
        <li>|</li>
        <li><a href="/donate.cfm">Donate</a></li>
        </ul>
    </div>
--->










<!----
<cfoutput>
	<header class="clearfix">
		<hgroup>
		<h1><a href="#$.createHREF(filename='')#">#HTMLEditFormat($.siteConfig('site'))#</a></h1>
		<cfif len($.siteConfig('tagline'))><h2 class="tagline">#$.siteConfig('tagline')#</h2></cfif>
		</hgroup>
		
		<nav>
		<ul class="navUtility">
			<li><a href="#$.createHREF(filename='about-us')#">Home</a></li>
			<li class="last"><a href="#$.createHREF(filename='contact')#">Contact</a></li>
			<li class="first"><a href="#$.createHREF(filename='Signup')#"> Newsletter Signup</a></li>
		</ul>
		</nav>
		<!--
		<form action="" id="searchForm">
			<fieldset>
				<input type="text" name="Keywords" id="txtKeywords" class="text" value="Search" onfocus="this.value=(this.value=='Search') ? '' : this.value;" onblur="this.value=(this.value=='') ? 'Search' : this.value;" />
				<input type="hidden" name="display" value="search" />
				<input type="hidden" name="newSearch" value="true" />
				<input type="hidden" name="noCache" value="1" />
				<input type="submit" class="submit" value="Go" />
			</fieldset>
		</form>
	</header>
</cfoutput>
		---->
		
