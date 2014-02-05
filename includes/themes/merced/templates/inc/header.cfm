<cfoutput>

<body>
<div id="wrapper">
    <div id="header">
    <div id="head-links"><a href="/intro.cfm">Home</a> | <a href="/contact.cfm">Contact</a> | <a href="http://visitor.r20.constantcontact.com/manage/optin/ea?v=001ilHvYJhSOXh7d3xEcz22vg%3D%3D" target="_blank">Newsletter Signup</a></div>
</div>

<!----- Navigation ----->
	<div id = "nav">"
		<cf_CacheOMatic key="dspPrimaryNav#request.contentBean.getcontentID()#">
			#$.dspPrimaryNav(
				viewDepth="5",
				id="nav",
				displayHome="false",
				closePortals="false",
				showCurrentChildrenOnly="false"
				)#</cf_cacheomatic>
		<!--- Optional named arguments for Primary Nav are: displayHome="Always/Never/Conditional", openPortals/closePortals="contentid,contentid" (i.e. show specific sub-content in dropdown nav) --->
		</div>
<!-------
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
			------>


		
			
</cfoutput>