package controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

public class ControllerActivity {

	//@Autowired
	//dependency injection dei Services
	//...ServiceInterface ...ServiceInterface
	
	private static final Log logger = LogFactory.getLog(ControllerActivity.class);
	
	 @RequestMapping(value = {"/","/login"})
	 public String login(Model model) {
	    	logger.info("-> login chiamata");
	    	//model.addAttribute(...);
	        return "";
	    }

	 
}
