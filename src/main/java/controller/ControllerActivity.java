package controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import domain.Amministratore;
import domain.AttivitaDisponibili;
import domain.AttivitaSvolte;
import domain.Impiegato;
import service.AmministratoreServiceInt;
import service.AttivitaDisponibiliServiceInt;
import service.AttivitaSvolteServiceInt;
import service.ImpiegatoServiceInt;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import javax.mail.internet.MimeMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
  
@Controller
public class ControllerActivity {

	// dependency injection dei Services
	@Autowired
	ImpiegatoServiceInt impiegatoServiceInt;
	@Autowired
	AttivitaSvolteServiceInt attivitaSvolteServiceInt;
	@Autowired
	AttivitaDisponibiliServiceInt attivitaDisponibiliServiceInt;
	@Autowired
	AmministratoreServiceInt amministratoreServiceInt;
	
	@Autowired
	private JavaMailSender mailSenderObj;

	private static final Log logger = LogFactory.getLog(ControllerActivity.class);
	
	private static String recipientMail;
	private static final String senderMail = "activitytraker@yahoo.com";

	
	@RequestMapping(value= {"/", "/inputLogin"})
	public String inputLogin() {
		logger.info("-> inputLogin chiamata");
		return "login";
	} 
 
	@RequestMapping(value="/login")
	public String login(Model model, HttpServletRequest request, HttpSession session) {
		logger.info("-> login chiamata");
		Impiegato i = new Impiegato();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		i = impiegatoServiceInt.checkLoginImpiegato(username, password);
		if (i != null) {
			if (i.getRuolo().equals("impiegato")) {
				model.addAttribute("impiegato", i);
				session.setAttribute("impiegato", i);
				return "menuImpiegato";
			} else {
				Amministratore a = new Amministratore();
				session.setAttribute("aministratore", a);
				model.addAttribute("amministratore", a);
				return "menuAmministratore";
			}
		} else {
			String errore = "Utente non registrato.";
			model.addAttribute("errore", errore);
			model.addAttribute(new Impiegato());
			return "formRegistrazione";
		}
	}
	
	
	@RequestMapping(value = "/formAttivitaSvolte")
	public String login(Model model) {
		logger.info("-> formAttivitaSvolte chiamata");
		List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("att_Disp",att_Disp);
		model.addAttribute(new AttivitaSvolte());
		return "formAttivitaSvolte";
	}
 
	@RequestMapping(value ="/salvaAttivitaSvolte")
	public String salvaAttivitaSvolte(@ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpSession session) {
		logger.info("-> salvaAttivitaSvolte chiamata");
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			//System.out.println("Code:" + fieldError.getCode() + ", field:" + fieldError.getField());
			String errore="Code:" + fieldError.getCode() + ", field:" + fieldError.getField();
			model.addAttribute("errore", errore);
			List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
			model.addAttribute("att_Disp",att_Disp);					
			return "formAttivitaSvolte";
		} else {
				try {
					attivitaSvolte.setImp((Impiegato)session.getAttribute("impiegato"));
					attivitaSvolteServiceInt.salvaAttivitaSvolte(attivitaSvolte);
				} catch (Exception e) {
					String errore = "Non è stato possibile aggiungere la tua attività";
					e.printStackTrace();
					List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
					model.addAttribute("att_Disp",att_Disp);					
					model.addAttribute("errore", errore);
					return "formAttivitaSvolte";
				}
			}
		return "menuImpiegato";
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
				String errore = "Non è stato possibile aggiungere il tuo acccount.";
				model.addAttribute("errore", errore);
				return "formRegistrazione";
			}
		}
		return "index";
	}
	
	@RequestMapping(value= "/visualizzaListaImpiegati")
	public String visualizzaListaImpiegati() {
		logger.info("-> visListaImpiegati chiamata");
		return "visualizzaListaImpiegati";
	}
	
	@RequestMapping(value = "/sendEmail")
	public String sendEmail(@ModelAttribute Impiegato impiegato, Model model,
			HttpServletRequest request) {
		logger.info("-> sendEmail chiamata");

		
		String alph = new String("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789");
		int n = alph.length();

		String newPassword = new String(); 
		SecureRandom r = new SecureRandom();

		for (int i=0; i<10; i++) {
		    newPassword = newPassword + alph.charAt(r.nextInt(n));
		}
		
		final String mailMessage = "La tua nuova password è "+newPassword;
		
		
		recipientMail = request.getParameter("mailTo");
		
		mailSenderObj.send(new MimeMessagePreparator() {
			public void prepare(MimeMessage mimeMessage) throws Exception {

				MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");				
				mimeMsgHelperObj.setTo(recipientMail);
				mimeMsgHelperObj.setFrom(senderMail);				
				mimeMsgHelperObj.setText(mailMessage);
				mimeMsgHelperObj.setSubject("Reset Password");
			}
		});
		
		return "menuAmministratore";
	}
	
	@RequestMapping(value ="/visualizzaAttivitaSvolte")
	public String visuailzzaAttivitaSvolte(Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> visualizzaAttivitaSvolte chiamata");
		List<AttivitaSvolte> attSvolte=attivitaSvolteServiceInt.recuperaAttivitaSvolteDaImpiegato((Impiegato)session.getAttribute("impiegato"));
		//Recupero oggetto AttDisponibili e lo inserisco in AttSvolte
		for(AttivitaSvolte a: attSvolte) { 
			logger.info("-> recupero attDisp");
			String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(a.getId_Trigg());
			AttivitaDisponibili attDispo=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
			//System.out.println(attDispo.getid_Disp()+" "+attDispo.getDescrizione());
			a.setAtt_Disp(attDispo);
		}
		model.addAttribute("attSvolte",attSvolte);
		return "visualizzaAttivitaSvolte";
	}
	
	@RequestMapping(value ="/cancellaAttivitaSvolte")
	public void cancellaAttivitaSvolte(@RequestParam int id,Model model,
			HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		logger.info("-> cancellaAttivitaSvolte chiamata");	
		attivitaSvolteServiceInt.eliminaAttivitaSvolte(id);
		RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaSvolte");
		rd.forward(request, response);
	}

	@RequestMapping(value ="/aggiornaAttivitaSvolte")
	public String aggiornaAttivitaSvolte(@RequestParam int id,@ModelAttribute AttivitaSvolte attivitaSvolte,Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> aggiornaAttivitaSvolte chiamata");
		attivitaSvolte=attivitaSvolteServiceInt.recuperaAttivitaSvolteById(id);
		String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(attivitaSvolte.getId_Trigg());
		AttivitaDisponibili attDispo=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
		attivitaSvolte.setAtt_Disp(attDispo);		
		List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("att_Disp",att_Disp);		
		model.addAttribute("attivitaSvolte",attivitaSvolte);
		return "modificaAttivitaSvolte";
		}
	
	@RequestMapping(value ="/aggiornaSuDBAttivitaSvolte")
	public String aggiornaSuDBAttivitaSvolte(@ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, 
			Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ServletException, IOException  {
		logger.info("-> aggiornaSuDBAttivitaSvolte chiamata");
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			String errore="Code:" + fieldError.getCode() + ", field:" + fieldError.getField();
			model.addAttribute("errore", errore);
			List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
			model.addAttribute("att_Disp",att_Disp);					
			return "modificaAttivitaSvolte";
		} else {
				try {
					attivitaSvolte.setImp((Impiegato)session.getAttribute("impiegato"));
					attivitaSvolteServiceInt.modificaAttivitaSvolte(attivitaSvolte);
				} catch (Exception e) {
					String errore = "Non è stato possibile modificare la tua attività";
					List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
					model.addAttribute("att_Disp",att_Disp);					
					model.addAttribute("errore", errore);
					return "modificaAttivitaSvolte";
				}
			}
		RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaSvolte");
		rd.forward(request, response);
		return "";		
	}	
	
	@RequestMapping(value="/logout")
	public String logout( HttpServletRequest request, HttpSession session) {
		logger.info("-> logout chiamata");
		session.invalidate();
		return "logout";
	} 	
	
}
