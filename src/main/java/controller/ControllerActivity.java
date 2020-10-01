package controller;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.AmministratoreServiceInt;
import service.AttivitaDisponibiliServiceInt;
import service.AttivitaSvolteServiceInt;
import service.ImpiegatoServiceInt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

@Controller
public class ControllerActivity {

	//dependency injection dei Services
	@Autowired
	ImpiegatoServiceInt impiegatoServiceInt;
	AttivitaSvolteServiceInt attivitaSvolteServiceInt;
	AttivitaDisponibiliServiceInt attivitaDisponibiliServiceInt;
	AmministratoreServiceInt amministratoreServiceInt;
	
	
	private static final Log logger = LogFactory.getLog(ControllerActivity.class);
	
	 @RequestMapping(value = {"/","/login"})
	 public String login(Model model) {
	    	logger.info("-> login chiamata");
	    	//model.addAttribute(...);
	        return "";
	    }

}
