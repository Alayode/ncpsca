<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

	<!-- content-wrap starts -->
	<div id="content-wrap">
				
		<div id="main" class="main-full">
			<?php 

			print $innerContent;
			
			?>
		<!-- main ends -->	
		</div>
		
		<!-- sidebar starts -->
		<div id="sidebar">						
		<!-- sidebar ends -->		
		</div>
		
	<!-- content-wrap ends-->	
	</div>
<?php  $this->inc('elements/footer.php'); ?>