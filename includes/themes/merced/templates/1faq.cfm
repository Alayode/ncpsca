<cfoutput>
<cfinclude template="inc/html_head.cfm" />
<body id="#$.getTopID()#" class="home">
<div id="container" class="#$.createCSSid($.content('menuTitle'))#">
	<cfinclude template="inc/header.cfm" />
		<div id="content" class="clearfix">
		<article>
			<div id="home-left">
	<div id="adoptme">
		<p><a href="/adoption.cfm">Click here</a> to search for more loveable and adoptable pets, all waiting for new homes and families.</p>
	</div>
</div>

			<!----
			#$.dspBody(body=$.content('body'),pageTitle="",crumbList=0,showMetaImage=0)#
			----->
		</article>
		<!-----
		<aside id="right">
			#$.dspObjects(2)#
		</aside>
		---->
		
		
		<!------ Get Iterator -------->
		<!-----
		<!---cfset feed=$.getBean("feed").loadBy(name="From Our Blog",siteID=$.event("siteid"))>
                                                <cfset iterator=feed.getIterator()>
                                                <cfif iterator.hasNext()>
                                                
                                                <!--- Add your markup and the items you?d like to output using the Mura Scope --->
                                                <cfoutput>
                                                                <div class="svSyndLocal svFeed svIndex clearfix" id="index-feature">
                                                                <h3>#HTMLEditFormat(feed.getName())#</h3>
                                                                                <cfloop condition="iterator.hasNext()">
                                                                                                <cfset item=iterator.next()>
                                                                                                <dl>
                                                                                                                <dd class="image">
                                                                                                                                <a href="#item.getURL()#" title="#item.getTitle()#"><img src="#$.createHREFForImage(item.getSiteID(),item.getFileID(),item.getFileEXT(),'medium')#" alt="#item.getTitle()#"></a>
                
------>
		----->
		<div id="home-right">
	
			<cfset feed=$.getBean("feed").loadBy(name="Featured Animals",siteID=$.event("siteid"))>
                                                <cfset iterator=feed.getIterator()>
                                                <cfif iterator.hasNext()>
                                                
                                                <!--- Add your markup and the items you like to output using the Mura Scope --->
                                            
                                                                <div class="svSyndLocal svFeed svIndex clearfix" id="index-feature">
                                                                <h3>#HTMLEditFormat(feed.getName())#</h3>
                                                                                <cfloop condition="iterator.hasNext()">
                                                                                                <cfset item=iterator.next()>
                                                                                                <dl>
                                                                                                                <dd class="image">
      		                   <a href="#item.getURL()#" title="#item.getTitle()#"><img src="#$.createHREFForImage(item.getSiteID(),item.getFileID(),item.getFileEXT(),'medium')#" alt="#item.getTitle()#"></a>
               
			 </cfloop>
			 
				<!-----
					<cfdump var = "#$.getbean('feed').loadby(name='Featured Animals').getIterator()#">----->
			<!----- Get Dump ------>
				<!------
	#$.dspObjects(2)#
			------>
			
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