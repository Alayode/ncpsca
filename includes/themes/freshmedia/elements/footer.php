<?php  defined('C5_EXECUTE') or die(_("Access Denied.")); ?>
		
	<!-- footer starts here -->	
	<div id="footer-wrap"><div id="footer-content">
	
		<div class="col float-left space-sep">
			<?php 
			$a = new Area('Footer Column 1');
			$a->display($c);
			?>	
		</div>
		
		<div class="col float-left">
			<?php 
			$a = new Area('Footer Column 2');
			$a->display($c);
			?>	
		</div>		
	
		<div class="col2 float-right">
			<?php 
			$a = new Area('Footer Column 3');
			$a->display($c);
			?>
			<p>
			&copy; copyright <?php echo date('Y')?> <strong><?php echo SITE?></strong><br /> 
			<?php echo t('Theme by')?> <a href="http://www.styleshout.com"><?php echo t('styleshout')?></a> <?php echo t('and')?> <a href="http://www.c5mix.com" title="Concrete5 Themes"><?php echo t('c5mix')?></a></p>
		
			<p>						
				<a href="<?php echo DIR_REL?>/"><?php echo t('Home')?></a> |
				<a href="<?php echo $this->url('/login')?>"><?php echo t('Sign In to Edit this Site')?></a>								
			</p>	
			
		</div>		
			
	</div></div>
	<div class="clearer"></div>
	<!-- footer ends here -->

<!-- wrap ends here -->
</div></div>

<?php  Loader::element('footer_required'); ?>

</body>
</html>