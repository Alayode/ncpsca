<?php 
defined('C5_EXECUTE') or die(_("Access Denied."));
$this->inc('elements/header.php'); ?>

	<!-- content-wrap starts -->
	<div id="content-wrap">
				
		<div id="main" class="main-full">
			<?php 
			$a = new Area('Main');
			$a->display($c);
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