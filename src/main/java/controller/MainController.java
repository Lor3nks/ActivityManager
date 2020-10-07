package controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.util.List;

import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import service.AttivitaDisponibiliServiceInt;
import service.AttivitaSvolteServiceInt;
import service.ImpiegatoServiceInt;
import domain.AttivitaDisponibili;
import domain.AttivitaSvolte;
import domain.Impiegato;


@Controller
public class MainController {
	
	@Autowired
	ImpiegatoServiceInt impiegatoServiceInt;
	@Autowired
	AttivitaSvolteServiceInt attivitaSvolteServiceInt;
	@Autowired
	AttivitaDisponibiliServiceInt attivitaDisponibiliServiceInt;
	@Autowired
    PasswordEncoder passwordEncoder;
	@Autowired
	private JavaMailSender mailSender;

	private static final Log logger = LogFactory.getLog(MainController.class);
	
	private static String recipientMail;
	private static final String senderMail = "activitytraker@yahoo.com";
	
	
/////////////////////////////////////////// ACCESSO /////////////////////////////////////////////////
	
	@RequestMapping(value= {"/", "/inputLogin"})
	public String inputLogin() {
		logger.info("-> inputLogin chiamata");
		return "login";
	}
	
	@RequestMapping(value = "/login")
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, Model model, HttpServletRequest request, HttpSession session) {
		logger.info("-> Login chiamata");
		
		Impiegato i = new Impiegato();
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		i = impiegatoServiceInt.recuperaImpiegatoByUser(username);
		System.out.println(i.getUsername());
//		System.out.println(i.getUsername());		
//		ModelAndView modelAndView = new ModelAndView();
		if (error != null) {
//			modelAndView.addObject("error", "Username o password non validi");
			model.addAttribute("error", "Username o password non validi.");
		}

		if (logout != null) {
//			modelAndView.addObject("msg", "You've been logged out successfully.");
			model.addAttribute("msg", "Hai effettuato il logout.");
		}
		
		
		if (i != null) {
			if (i.getRuolo().equals("impiegato")) {
				model.addAttribute("impiegato", i);
				session.setAttribute("impiegato", i);
//				modelAndView.setViewName("menuImpiegato");
//				return modelAndView;
				return "menuImpiegato";
			} else {
				session.setAttribute("amministratore", i);
				model.addAttribute("amministratore", i);
//				modelAndView.setViewName("menuAmministratore");
//				return modelAndView;
				return "menuAmministratore";
			}

//		return modelAndView;
	}
		return password;
		
	}
	
	
		
	@RequestMapping(value = {"/placeholder", "/formRegistrazione"})
	public String formRegistrazione(Model model) {
		model.addAttribute(new Impiegato());
		return "formRegistrazione";
	}
	
	@RequestMapping(value = "/registrazione")
	public String registrazione(@ModelAttribute Impiegato impiegato, BindingResult bindingResult, Model model,
			HttpServletRequest request) {
		
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
				String encrPwd = passwordEncoder.encode(impiegato.getPassword());
				impiegato.setPassword(encrPwd);	
				impiegatoServiceInt.inserisciImpiegato(impiegato);
			} catch (Exception e) {
				String errore = "Non è stato possibile aggiungere il tuo acccount.";
				model.addAttribute("errore", errore);
				return "formRegistrazione";
			}
		}
		model.addAttribute("title", "Registrazione Riuscita");
		model.addAttribute("message", "Benvenuto, "+impiegato.getUsername()+"!");
		return "menuImpiegato";
	}

	
	@RequestMapping(value="/logout")
	public String logout( HttpServletRequest request, HttpSession session) {
		logger.info("-> logout chiamata");
		session.invalidate();
		return "logout";
	} 	
	
	
	@RequestMapping(value="/cambiaPassword")
	public String cambiaPassword(@ModelAttribute Impiegato impiegato, Model model,
			HttpServletRequest request){
		logger.info("-> cambiaPassword chiamata");
		return "cambiaPassword";
	}
	
	
	

	@RequestMapping(value = "/welcome**", method = RequestMethod.GET)
	public ModelAndView defaultPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "This is default page!");
		model.setViewName("hello");
		return model;

	}

	@RequestMapping(value = "/admin**", method = RequestMethod.GET)
	public ModelAndView adminPage() {

		ModelAndView model = new ModelAndView();
		model.addObject("title", "Spring Security Login Form - Database Authentication");
		model.addObject("message", "Pagina visibile solo all'AMMINISTRATORE");
		model.setViewName("admin");

		return model;

	}

	
	//for 403 access denied page
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public ModelAndView accesssDenied() {

		ModelAndView model = new ModelAndView();
		
		//check if user is login
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (!(auth instanceof AnonymousAuthenticationToken)) {
			UserDetails userDetail = (UserDetails) auth.getPrincipal();
			System.out.println(userDetail);
		
			model.addObject("username", userDetail.getUsername());
			
		}
		
		model.setViewName("403");
		return model;
	}
	
	
////////////////////////////////// ATTIVTA' SVOLTE E DISPONIBILI ////////////////////////////////////////
	
	@RequestMapping(value = "/formAttivitaSvolte")
	public String login(Model model) {
		logger.info("-> formAttivitaSvolte chiamata");
		List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("att_Disp",att_Disp);
		model.addAttribute(new AttivitaSvolte());
		return "formAttivitaSvolte";
	}
 
	@RequestMapping(value ="/salvaAttivitaSvolte")
	public String salvaAttivitaSvolte(@Valid @ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, Model model,
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
	

	@RequestMapping(value ="/visualizzaAttivitaSvolte")
	public String visuailzzaAttivitaSvolte(Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> visualizzaAttivitaSvolteImpiegato chiamata");
		List<AttivitaSvolte> attSvolte=attivitaSvolteServiceInt.recuperaAttivitaSvolte();
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
	
	@RequestMapping(value ="/visualizzaAttivitaDisponibili")
	public String visuailzzaAttivitaDisponibili(Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> visualizzaAttivitaDisponibili chiamata");
		List<AttivitaDisponibili> attDisp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("attDisp", attDisp);
		return "visualizzaAttivitaDisponibili";
	}
	
	
	
	
	
//////////////////////////////////////// IMPIEGATI /////////////////////////////////////
	
	@RequestMapping(value ="/visualizzaAttivitaSvolteImpiegato")
	public String visuailzzaAttivitaSvolteImpiegato(Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> visualizzaAttivitaSvolteImpiegato chiamata");
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
		return "visualizzaAttivitaSvolteImpiegato";
	}
	


	@RequestMapping(value= "/visualizzaListaImpiegati")
	public String visualizzaListaImpiegati(Model model) {
		logger.info("-> visListaImpiegati chiamata");
		List<Impiegato> lista = impiegatoServiceInt.recuperaImpiegati();
		model.addAttribute("listaImpiegati", lista);
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
		
		mailSender.send(new MimeMessagePreparator() {
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
	
	
//	@RequestMapping(value ="/cancellaAttivitaDisponibili")
//	public void cancellaAttivitaDisponibili(@RequestParam String id,Model model,
//			HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
//		logger.info("-> cancellaAttivitaDisponibili chiamata");	
//		attivitaDisponibiliServiceInt.cancellaAttivitaDisponibili(id);
//		RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaDisponibili");
//		rd.forward(request, response);
//	}

	
//////////////////////////////////////////LOGIN VECCHIA	
//	@RequestMapping(value="/login")
//	public String login(Model model, HttpServletRequest request, HttpSession session) {
//		logger.info("-> login chiamata");
//		Impiegato i = new Impiegato();
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		i = impiegatoServiceInt.checkLoginImpiegato(username, password);
//		if (i != null) {
//			if (i.getRuolo().equals("impiegato")) {
//				model.addAttribute("impiegato", i);
//				session.setAttribute("impiegato", i);
//				return "menuImpiegato";
//			} else {
//				session.setAttribute("amministratore", i);
//				model.addAttribute("amministratore", i);
//				return "menuAmministratore";
//			}
//		} else {
//			String errore = "Utente non registrato.";
//			model.addAttribute("errore", errore);
//			model.addAttribute(new Impiegato());
//			return "formRegistrazione";
//		}
//	}
	
	
//	@RequestMapping(value = "/formRegistrazione")
//	public String formRegistrazione(Model model) {
//		logger.info("-> form registrazione chiamata");
//		model.addAttribute(new Impiegato());
//		return "formRegistrazione";
//	}
//
//	@RequestMapping(value = "/registrazione")
//	public String registrazione(@ModelAttribute Impiegato impiegato, BindingResult bindingResult, Model model,
//			HttpServletRequest request) {
//		logger.info("-> registrazione chiamata");
//		if (bindingResult.hasErrors()) {
//			FieldError fieldError = bindingResult.getFieldError();
//			System.out.println("Code:" + fieldError.getCode() + ", field:" + fieldError.getField());
//			return "formRegistrazione";
//		} else if (!impiegato.getPassword().equals(request.getParameter("confermaPassword"))) {
//			String errore = "Le password non coincidono.";
//			model.addAttribute("errore", errore);
//			return "formRegistrazione";
//		} else {
//			try { 
//				impiegatoServiceInt.inserisciImpiegato(impiegato);
//			} catch (Exception e) {
//				String errore = "Non è stato possibile aggiungere il tuo acccount.";
//				model.addAttribute("errore", errore);
//				return "formRegistrazione";
//			}
//		}
//		return "menuImpiegato";
//	}
}