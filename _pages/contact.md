---
title: "Contact"
layout: archive
permalink: /contact/
---
<hr>
<script type="text/javascript">var submitted=false;</script>
<script type="text/javascript">
var checkExist = setInterval(function() {
	if ($('#gform').length) { //Check for Content to Load
		if(submitted==true){
				$('#gform').fadeOut(2000);
				setTimeout(function(){
					$('#submitted').prepend('Thanks for contacting me! I\'ll get back to you soon :)');
				}, 2000);
				
	    	submitted=false;
	    }
   }
}, 2000);


</script>

<script src='https://www.google.com/recaptcha/api.js'></script>


<div id="submitted"></div>
<form name="gform" id="gform" enctype="text/plain" target="hidden_iframe" action="https://docs.google.com/forms/d/e/1FAIpQLSexijxBZwH0GUh3rDTTTH6DuP_4J_9TGXsdowQM_vPImvjuDA/formResponse?" onsubmit="submitted=true;">
  <label for="entry.17070818">Your Name: <div id="required"> *</div></label><br>
  <input type="text" name="entry.17070818" required placeholder="Enter your name..."><br>
  <label for="entry.1519113853">Your Email: <div id="required"> *</div></label><br>
  <input type="email" name="entry.1519113853" required placeholder="Enter your email address...">
  <label for="entry.32938475">Your Message: <div id="required"> *</div></label><br>
  <textarea name="entry.32938475" required placeholder="Enter your message here..." autocomplete="off" rows="4"></textarea>
  <div id="required">* Required</div>
<!--  <input class="g-recaptcha" data-sitekey="6Ldl4ygUAAAAACkkpWtnruLxXkGNXxdJmPYg8gKl" data-callback="YourOnSubmitFn" type="submit" value="Submit">-->
  <input class="g-recaptcha" type="submit" value="Submit">
</form>
<iframe name="hidden_iframe" id="hidden_iframe" style="display:none;" onload="if(submitted) {}"></iframe>
