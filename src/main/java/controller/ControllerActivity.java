package controller;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.AttivitaSvolte;
import domain.Impiegato;
import service.AmministratoreServiceInt;
import service.AttivitaDisponibiliServiceInt;
import service.AttivitaSvolteServiceInt;
import service.ImpiegatoServiceInt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
 
@Controller
public class ControllerActivity {

	// dependency injection dei Services
	@Autowired
	ImpiegatoServiceInt impiegatoServiceInt;
	AttivitaSvolteServiceInt attivitaSvolteServiceInt;
	AttivitaDisponibiliServiceInt attivitaDisponibiliServiceInt;
	AmministratoreServiceInt amministratoreServiceInt;

	private static final Log logger = LogFactory.getLog(ControllerActivity.class);

	@RequestMapping(value = "/formAttivitaSvolte")
	public String login(Model model) {
		logger.info("-> formAttivitaSvolte chiamata");
		model.addAttribute(new AttivitaSvolte());
		return "formAttivitaSvolte";
	}

	@RequestMapping(value ="/salvaAttivitaSvolte")
	public String salvaAttivitaSvolte(@ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		logger.info("-> salvaAttivitaSvolte chiamata");
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			System.out.println("Code:" + fieldError.getCode() + ", field:" + fieldError.getField());
			return "formAttivitaSvolte";
		} else {
				try {
					attivitaSvolte.setUsername("Usr01");
					attivitaSvolteServiceInt.salvaAttivitaSvolte(attivitaSvolte);
				} catch (Exception e) {
					String errore = "Non � stato possibile aggiungere la tua attivit�";
					model.addAttribute("errore", errore);
					return "formAttivitaSvolte";
				}
			}
		return "index";
	}
	
	@RequestMapping(value = "/formRegistrazione")
	public String formRegistrazione(Model model) {
		logger.info("-> form registrazione chiamata");
		model.addAttribute(new Impiegato());
		return "formRegistrazione";
	}

	@RequestMapping(value = "/registrazione")
	public String registrazione(@ModelAttribute Impiegato impiegato, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		logger.info("-> registrazione chiamata");
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			System.out.println("Code:" + fieldError.getCode() + ", field:" + fieldError.getField());
			return "formRegistrazione";
		} else if (!impiegato.getPassword().equals(request.getParameter("confermaPassword"))) {
			String errore = "Le password non coincidono.";
			model.addAttribute("errore", errore);
			return "formRegistrazione";
		} else {
			try { 
				impiegatoServiceInt.inserisciImpiegato(impiegato);
			} catch (Exception e) {
				String errore = "Non � stato possibile aggiungere il tuo acccount.";
				model.addAttribute("errore", errore);
				return "formRegistrazione";
			}
		}
		return "index";
	}

}
