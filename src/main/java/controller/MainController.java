package controller;

import java.io.IOException;
import java.security.SecureRandom;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.ArrayList;
import java.util.Collection;
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
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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
	
	@RequestMapping(value = {"/", "/login"})
	public String login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, HttpSession session, Model model) {
		
		if (error != null) {
			model.addAttribute("error", "Username o password errati!");
		}

		if (logout != null) {
			model.addAttribute("msg", "Logout riuscito!");
		}
		return "login";

	}
	
//	@RequestMapping(value = {"/", "/login"})
//	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, HttpSession session) {
//		
//		ModelAndView model = new ModelAndView();
//		
//		if (error != null) {
//			model.addObject("error", "Username o password errati!");
//		}
//
//		if (logout != null) {
//			model.addObject("msg", "Logout riuscito!");
//		}
//		model.setViewName("login");
//
//		return model;
//
//	}
	
	// VECCHIO LOGIN //
//	@RequestMapping(value = "/login")
//	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
//			@RequestParam(value = "logout", required = false) String logout, HttpServletRequest request, HttpSession session) {
//		logger.info("-> Login chiamata");
//		
//		ModelAndView model = new ModelAndView();
//		
//		Impiegato i = new Impiegato();
//		String username = request.getParameter("username");
//		String password = request.getParameter("password");
//		i = impiegatoServiceInt.recuperaImpiegatoByUser(username);
//		System.out.println(i.getUsername());
//		if (error != null) {
//
//			model.addObject("error", "Username o password non validi.");
//		}
//
//		if (logout != null) {
//			model.addObject("msg", "Hai effettuato il logout.");
//		}
//		
//		if (i != null) {
//			if (i.getRuolo().equals("impiegato")) {
//				model.addObject("impiegato", i);
//				session.setAttribute("impiegato", i);
//				model.setViewName("menuImpiegato");
//
//			} else {
//				session.setAttribute("amministratore", i);
//				model.addObject("amministratore", i);
//				model.setViewName("menuAmministratore");
//
//			}
//		}		
//		return model;
//	}
	
	@RequestMapping(value = "/mainMenu")
	public String mainMenu(Model model, HttpServletRequest request, HttpSession session) {		
		// controllo ruolo dell'utente loggato
		Collection<? extends GrantedAuthority> authorities = 
				SecurityContextHolder.getContext().getAuthentication().getAuthorities();
		Object o = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		boolean isAdmin = authorities.contains(new SimpleGrantedAuthority("amministratore"));
		String username = ((UserDetails) o).getUsername();  

		Impiegato i = impiegatoServiceInt.recuperaImpiegatoByUser(username);
		model.addAttribute("impiegato", i);
		session = request.getSession();
		if(isAdmin) {
			session.setAttribute("amministratore", i);
			return "menuAmministratore";
		} else {
			session.setAttribute("impiegato", i);
			i = (Impiegato) session.getAttribute("impiegato");
			return "menuImpiegato";
		}
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
	
	

@RequestMapping(value = "/cambiaPassword")

	public String cambiaPassword(@ModelAttribute Impiegato impiegato, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpServletResponse response, HttpSession session) {
		logger.info("-> cambiaPassword chiamata");
		String password = request.getParameter("password");
		String nuovaPassword = request.getParameter("nuovaPassword");
		String confermaPassword = request.getParameter("confermaPassword");
		Impiegato i = (Impiegato) session.getAttribute("impiegato");
		String passwordDB = i.getPassword();

		
		 if(!password.equals("") && password.equals(passwordDB)){
			 if(!nuovaPassword.equals("") && !nuovaPassword.equals(password)) {	
				 if(!confermaPassword.equals("") && confermaPassword.equals(nuovaPassword)) {
						impiegatoServiceInt.cambiaPwdImpiegato(i.getUsername(), nuovaPassword);		
				 }}}else {
			String errore = "i campi inseriti non sono corretti";
			model.addAttribute("errore", errore);
			return "cambiaPassword";
		
		}
		 
		model.addAttribute("errore", "Password cambiata correttamente");
		return "cambiaPassword";
	}
	
	@RequestMapping(value="/formCambiaPassword")
	public String formCambiaPassword() {
	return "cambiaPassword";
	}
	
	@RequestMapping(value="/tornaIndietro")
	public String tornaIndietro(@ModelAttribute Impiegato impiegato,Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		return "mainMenu";
		
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
	public String login(Model model, HttpSession session, HttpServletRequest request) {
		logger.info("-> formAttivitaSvolte chiamata");
		session = request.getSession();
		Impiegato imp = (Impiegato)session.getAttribute("impiegato");
		System.out.println(imp.getUsername());
		List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("att_Disp",att_Disp);
		model.addAttribute(new AttivitaSvolte());
		return "formAttivitaSvolte";
	}
 
	@RequestMapping(value ="/salvaAttivitaSvolte")
	public String salvaAttivitaSvolte(@Valid @ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, Model model,
			HttpServletRequest request, HttpSession session) {
		logger.info("-> salvaAttivitaSvolte chiamata");
		Impiegato imp = (Impiegato)session.getAttribute("impiegato");
		System.out.println(imp.getUsername());
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
		HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> cancellaAttivitaSvolte chiamata");	
		attivitaSvolteServiceInt.eliminaAttivitaSvolte(id);
		if (session.getAttribute("amministratore") == null) {
			RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaSvolteImpiegato");
			rd.forward(request, response);
			return;
		} else {
			RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaSvolte");
			rd.forward(request, response);
			return;
		}
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
		for(AttivitaSvolte a: attSvolte) { 
			logger.info("-> recupero attDisp");
			String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(a.getId_Trigg());
			String usernameAttDisp = attivitaSvolteServiceInt.getUsernameFromAttSvolte(a.getId_Trigg());
			AttivitaDisponibili attDisponibile=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
			Impiegato i = impiegatoServiceInt.recuperaImpiegatoByUser(usernameAttDisp);
			a.setAtt_Disp(attDisponibile);
			a.setImp(i);
		}
		model.addAttribute("attSvolte",attSvolte);
		return "visualizzaAttivitaSvolte";
	}
	
	
	@RequestMapping(value="/aggiornaListaIntervallo")
	public String aggiornaListaIntervallo(Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		logger.info("-> aggiornaListaIntervallo chiamata");
		String dInizio = request.getParameter("dataInizio");
		String dFine = request.getParameter("dataFine");
		List<AttivitaSvolte> attSvolte = new ArrayList<>();
		
		if (!dInizio.equals("") && !dFine.equals("")) {
			LocalDate dataInizio = null;
			try {
				dataInizio = LocalDate.parse(dInizio);
			} catch (DateTimeParseException e) {
				String error = "Data non valida.";
				model.addAttribute("error", error);
			}
			LocalDate dataFine = null;
			try{
				dataFine = LocalDate.parse(dFine);
			} catch (DateTimeParseException e) {
				String error = "Data non valida.";
				model.addAttribute("error", error);
			}
			
			
			if (dataFine.isAfter(LocalDate.now()) || dataInizio.isAfter(LocalDate.now())) {
				String error = "Inserire una data precedente o uguale a quella odierna.";
				model.addAttribute("error", error);
				attSvolte = attivitaSvolteServiceInt.recuperaAttivitaSvolte();
			} else if (dataInizio.isAfter(dataFine) && dataFine.isBefore(dataInizio)) {
				String error = "Date inserite non valide.";
				model.addAttribute("error", error);
				attSvolte = attivitaSvolteServiceInt.recuperaAttivitaSvolte();
			} else {
				attSvolte = attivitaSvolteServiceInt.recuperaAttivitaSvolteDaA(dataInizio, dataFine);
			}
		} else {
			attSvolte = attivitaSvolteServiceInt.recuperaAttivitaSvolte();
		}
		for(AttivitaSvolte a: attSvolte) { 
			logger.info("-> recupero attDispDaA");
			String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(a.getId_Trigg());
			String usernameAttDisp = attivitaSvolteServiceInt.getUsernameFromAttSvolte(a.getId_Trigg());
			AttivitaDisponibili attDisponibile=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
			Impiegato i = impiegatoServiceInt.recuperaImpiegatoByUser(usernameAttDisp);
			a.setAtt_Disp(attDisponibile);
			a.setImp(i);
		}
		model.addAttribute("attSvolte", attSvolte);
		return "visualizzaAttivitaSvolte";
	}
	
	
	@RequestMapping(value ="/aggiornaSuDBAttivitaSvolte")
	public String aggiornaSuDBAttivitaSvolte(@Valid @ModelAttribute AttivitaSvolte attivitaSvolte, BindingResult bindingResult, 
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
				attivitaSvolteServiceInt.modificaAttivitaSvolte(attivitaSvolte);
			} catch (Exception e) {
				String errore = "Non è stato possibile modificare la tua attività";
				List<AttivitaDisponibili> att_Disp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
				model.addAttribute("att_Disp",att_Disp);					
				model.addAttribute("errore", errore);
				return "modificaAttivitaSvolte";
			}
		}
	
	if (session.getAttribute("amministratore") == null) {
		System.out.println("IMPIEGATO");
		List<AttivitaSvolte> attSvolte=attivitaSvolteServiceInt.recuperaAttivitaSvolteDaImpiegato((Impiegato)session.getAttribute("impiegato"));
		for(AttivitaSvolte a: attSvolte) { 
			logger.info("-> recupero attDisp");
			String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(a.getId_Trigg());
			String usernameAttDisp = attivitaSvolteServiceInt.getUsernameFromAttSvolte(a.getId_Trigg());
			AttivitaDisponibili attDisponibile=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
			Impiegato i = impiegatoServiceInt.recuperaImpiegatoByUser(usernameAttDisp);
			a.setAtt_Disp(attDisponibile);
			a.setImp(i);
		}
			model.addAttribute("attSvolte",attSvolte);
		return "visualizzaAttivitaSvolteImpiegato";
	} else {
		System.out.println("ADMIN");
		List<AttivitaSvolte> attSvolte=attivitaSvolteServiceInt.recuperaAttivitaSvolte();
		for(AttivitaSvolte a: attSvolte) { 
			logger.info("-> recupero attDisp");
			String codAttDisp=attivitaSvolteServiceInt.getAttIdDispFromAttSvolte(a.getId_Trigg());
			String usernameAttDisp = attivitaSvolteServiceInt.getUsernameFromAttSvolte(a.getId_Trigg());
			AttivitaDisponibili attDisponibile=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(codAttDisp);
			Impiegato i = impiegatoServiceInt.recuperaImpiegatoByUser(usernameAttDisp);
			a.setAtt_Disp(attDisponibile);
			a.setImp(i);
		}
			model.addAttribute("attSvolte",attSvolte);
		return "visualizzaAttivitaSvolte";
	}
}

	
	@RequestMapping(value ="/visualizzaAttivitaDisponibili")
	public String visuailzzaAttivitaDisponibili(Model model,HttpServletRequest request, HttpSession session) {
		logger.info("-> visualizzaAttivitaDisponibili chiamata");
		List<AttivitaDisponibili> attDisp=attivitaDisponibiliServiceInt.RecuperaAttivitaDisponibili();
		model.addAttribute("attDisp", attDisp);
		return "visualizzaAttivitaDisponibili";
	}
	
	@RequestMapping(value ="/aggiornaAbilitazioneAttivitaDisponibili")
	public void aggiornaAbilitazioneAttivitaDisponibili(@RequestParam String id,@ModelAttribute AttivitaDisponibili attivitaDisponibili, Model model,HttpServletRequest request, HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> aggiornaAbilitazioneAttivitaDisponibili chiamata");
		AttivitaDisponibili attDisp =attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(id);
		attDisp.getAbilitazione();
		if(attDisp.getAbilitazione()==1) {
			attivitaDisponibiliServiceInt.modificaAbilitazioneAttivitaDisponibili(attDisp, false);
			 
			
		}else {
			attivitaDisponibiliServiceInt.modificaAbilitazioneAttivitaDisponibili(attDisp, true);
		}
		RequestDispatcher rd= request.getRequestDispatcher("visualizzaAttivitaDisponibili");
		rd.forward(request, response);
		}
	
	@RequestMapping(value ="/modificaAttivitaDisponibili1")
	public String modificaAttivitaDisponibili(@RequestParam String id,@ModelAttribute AttivitaDisponibili attivitaDisponibili,Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> modificaAttivitaDisponibili1 chiamata");
		AttivitaDisponibili attDisp=attivitaDisponibiliServiceInt.recuperaAttivitaDisponibiliById(id);
		//attDisp.setDescrizione(request.getParameter("descrizione"));
		model.addAttribute("attDisp",attDisp);
		return "modificaAttivitaDisponibili1";
		}
	
	@RequestMapping(value ="/modificaAttivitaDisponibili2")
	public String modificaAttivitaDisponibili2( @ModelAttribute AttivitaDisponibili attivitaDisponibili,
			Model model,HttpServletRequest request,HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> modificaAttivitaDisponibili1 chiamata");
		attivitaDisponibiliServiceInt.modificaAttivitaDisponibili(attivitaDisponibili);
		RequestDispatcher rd=request.getRequestDispatcher("visualizzaAttivitaDisponibili");
		rd.forward(request, response);
		return "";
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
	public String visualizzaListaImpiegati(Model model, HttpSession session) {
		logger.info("-> visListaImpiegati chiamata");
		Impiegato imp = (Impiegato)session.getAttribute("amministratore");
		System.out.println(imp.getUsername());
		List<Impiegato> lista = impiegatoServiceInt.recuperaImpiegati();
		model.addAttribute("listaImpiegati", lista);
		return "visualizzaListaImpiegati";
	}
	
	@RequestMapping(value= "/modificaAbilitazioneImp")
	public void modificaAbilitazioneImp(@RequestParam String userName,Model model,HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> modificaAbilitazioneImp chiamata");
		boolean impBoolAbil=impiegatoServiceInt.recuperaImpiegatoByUser(userName).isAbilitazione();
		if(impBoolAbil) impiegatoServiceInt.modificaAbilitazioneImpiegato(userName, false);
		else impiegatoServiceInt.modificaAbilitazioneImpiegato(userName, true);
		RequestDispatcher rd=request.getRequestDispatcher("visualizzaListaImpiegati");
		rd.forward(request, response);
	}
	
	@RequestMapping(value= "/modificaDatiImpStep1")
	public String modificaDatiImpStep1(@RequestParam String userName, @ModelAttribute Impiegato impiegato, Model model,HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> modificaDatiImpStep1 chiamata");
		Impiegato imp=impiegatoServiceInt.recuperaImpiegatoByUser(userName);
		List<String> ruoloList=new ArrayList<>();
		ruoloList.add("amministratore");
		ruoloList.add("impiegato");
		model.addAttribute("ruoloList",ruoloList);
		model.addAttribute("impiegato", imp);
		return "modificaImpAmm";
	}

	@RequestMapping(value= "/modificaDatiImpStep2")
	public String modificaDatiImpStep2(@Valid @ModelAttribute Impiegato impiegato,BindingResult bindingResult, Model model,HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws ServletException, IOException {
		logger.info("-> modificaDatiImpStep2 chiamata");
		if (bindingResult.hasErrors()) {
			FieldError fieldError = bindingResult.getFieldError();
			String errore="Code:" + fieldError.getCode() + ", field:" + fieldError.getField();
			List<String> ruoloList=new ArrayList<>();
			ruoloList.add("amministratore");
			ruoloList.add("impiegato");
			model.addAttribute("ruoloList",ruoloList);
			model.addAttribute("errore", errore);
			return "modificaImpAmm";
		} else {
				try {
					//attivitaSvolte.setImp((Impiegato)session.getAttribute("impiegato"));
					//attivitaSvolteServiceInt.modificaAttivitaSvolte(attivitaSvolte);
					impiegatoServiceInt.modificaImpiegato(impiegato);
				} catch (Exception e) {
					String errore = "Non è stato possibile modificare i dati dell'impiegato";
					List<String> ruoloList=new ArrayList<>();
					ruoloList.add("amministratore");
					ruoloList.add("impiegato");
					model.addAttribute("ruoloList",ruoloList);
					model.addAttribute("errore", errore);
					return "modificaImpAmm";
				}
			}		
		RequestDispatcher rd=request.getRequestDispatcher("visualizzaListaImpiegati");
		rd.forward(request, response);		
		return "";
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
		
		String user = request.getParameter("resetTo");
		Impiegato imp = impiegatoServiceInt.recuperaImpiegatoByUser(user);
		
		recipientMail = imp.getEmail();
		
		impiegatoServiceInt.cambiaPwdImpiegato(user, newPassword);
		
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
	
//	
	
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