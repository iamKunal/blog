---
title: "Contact"
layout: archive
permalink: /contact/
---
<hr>
<!--<script src="https://www.google.com/recaptcha/api.js" async defer></script>-->
<script type="text/javascript">var submitted=false;</script>
<script type="text/javascript">
var checkExist = setInterval(function() {
	if ($('#gform').length) { //Check for Content to Load
		$('.contact-submit').onclick=function(){
			$('.contact-submit').attr('disabled','');
		}
		if(submitted==true){
				document.cookie = 'MCPopupClosed' + '=; Path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
				$('.contact-submit').attr('disabled','');
				$('#gform').fadeOut(2000);
				setTimeout(function(){
					$('#submitted').hide();
					$('#submitted').prepend('Thanks for contacting me! I\'ll get back to you soon :)');
					$('#submitted').fadeIn(3000);
				}, 2000);
				
	    	submitted=false;
	    }
   }
}, 2000);
/*function onSubmit(token) {
    $('.contact-submit').click();
  }

  function validate(event) {
      grecaptcha.execute();
  }

  function onload() {
    var element = document.getElementById('submit');
    element.onclick = validate;
  }
  */
</script>




<div id="submitted"></div>
<form name="gform" id="gform" enctype="text/plain" target="hidden_iframe" action="https://docs.google.com/forms/d/e/1FAIpQLSexijxBZwH0GUh3rDTTTH6DuP_4J_9TGXsdowQM_vPImvjuDA/formResponse?" onsubmit="submitted=true;$('.contact-submit').attr('disabled','');">
  <label for="entry.17070818">Your Name: <div id="required"> *</div></label><br>
  <input type="text" name="entry.17070818" required placeholder="Enter your name..."><br>
  <label for="entry.1519113853">Your Email: <div id="required"> *</div></label><br>
  <input type="email" name="entry.1519113853" required placeholder="Enter your email address...">
  <label for="entry.32938475">Your Message: <div id="required"> *</div></label><br>
  <textarea name="entry.32938475" required placeholder="Enter your message here..." autocomplete="off" rows="4"></textarea>
  <div id="required">* Required</div>
<!--  <input class="g-recaptcha" id="submit" data-sitekey="6Ldl4ygUAAAAACkkpWtnruLxXkGNXxdJmPYg8gKl" data-callback="onSubmit" type="submit" value="Submit" data-size="invisible">-->
  <input class="contact-submit" type="submit" value="Submit">
</form>
<!--<script>onload();</script>-->
<iframe name="hidden_iframe" id="hidden_iframe" style="display:none;" onload="if(submitted) {}"></iframe>
