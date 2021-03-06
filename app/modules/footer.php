<?php if(!isset($settings)){header('location: /');exit;}?>	<footer class="footer">
		<div class="container"><?=$product['footer_copyright']?> <a href="<?=$product['url_main']?>" target="_blank"><img src="/assets/products/<?=$product['id']?>/logo_small@2x.png" width="69" alt="" /></a></div>
	</footer>
	<link rel="stylesheet" href="/assets/js/remodal/remodal.css" />
	<link rel="stylesheet" href="/assets/js/remodal/remodal-default-theme.css" />
	<script src="/assets/js/clipboard.min.js" defer></script>
	<script src="/assets/js/remodal/remodal.min.js" defer></script>
	<script src="/assets/js/bootstrap.min.js" defer></script>
	<script src="/assets/js/app_50.js?v=1.0" defer></script>
	<script src="/assets/js/zxcvbn.js" defer></script>
	<script type="text/javascript">
$('document').ready(function(){
	
var clipboard = new Clipboard('.js-copy'),
	copyTimer;
$('.js-copy').on('click touch', function(e) {
	e.preventDefault();
});
clipboard.on('success', function(e) {
    var $span = $(e.trigger).find("span"),
    	oldText = $span.text();
    $span.animate({opacity:0},function(){
	if(document.getElementById('deposit_address_clipboard')){
    	 $span.text("<?=$lng['button_copy_wallet_success']?>").animate({opacity:1});
	}else{
    	 $span.text("<?=$lng['button_copy_success']?>").animate({opacity:1});
	}		 
    })
    if(copyTimer) {
    	clearTimeout(copyTimer);
    }
    copyTimer = setTimeout(function() {
    	 $span.animate({opacity:0},function(){
	    	 $span.text(oldText).animate({opacity:1});  
	    })
    }, 3000)

    return false;
});
	
	var password = document.getElementById('signup-password');
	if(!password) {var password = document.getElementById('current_password');}
	if(!password) {var password = document.getElementById('new_password');}
if(password) {
	var text = document.getElementById('password-strength');
	var strength = {
	  0: "<?=$lng['password_worst']?>",
	  1: "<?=$lng['password_bad']?>",
	  2: "<?=$lng['password_weak']?>",
	  3: "<?=$lng['password_good']?>",
	  4: "<?=$lng['password_strong']?>"
	}
	var strength_class = {
	  0: "worst",
	  1: "bad",
	  2: "weak",
	  3: "good",
	  4: "strong"
	}
	password.addEventListener('input', function() {
		var val = password.value;
		var result = zxcvbn(val);
		if (val !== "") {
			text.innerHTML = "<?=$lng['password_strength']?>: " + strength[result.score] + " <?=$lng['password']?>" ; 
			text.classList = 'password-strength password-strength--' + strength_class[result.score];
		} else {
			text.innerHTML = "<?=$lng['password_strength']?>: <?=$lng['password_weak']?>";
			text.classList = 'password-strength';
		}
	});
}

});
</script>



</body>

</html>