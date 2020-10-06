package domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.util.List;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;

public class Impiegato implements Serializable {
	
	private static final long serialVersionUID = 7611569892498705160L;
	@NotNull
	private String username;
	@NotNull
	private String password;
	@NotNull
	private String email;
	@NotNull
	private String nome;
	@NotNull
	private String cognome;
	@NotNull
	@Past
	private LocalDate dataNascita;
	@NotNull
	private boolean abilitazione;
	@NotNull
	private String ruolo;
	private List<AttivitaDisponibili> attDisp;

	public Impiegato() {
		super();
	}
	
	
 
	public Impiegato(String password, String email, String nome, String cognome, LocalDate dataNascita,
			boolean abilitazione, String ruolo,List<AttivitaDisponibili> attDisp) {
		super();
		this.password = password;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.abilitazione = abilitazione;
		this.ruolo = ruolo;
		this.attDisp=attDisp;
	}



	public Impiegato(String username, String password, String email, String nome, String cognome, LocalDate dataNascita,
			boolean abilitazione, String ruolo,List<AttivitaDisponibili> attDisp) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.abilitazione = abilitazione;
		this.ruolo = ruolo;
		this.attDisp=attDisp;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getCognome() {
		return cognome;
	}

	public void setCognome(String cognome) {
		this.cognome = cognome;
	}

	public LocalDate getDataNascita() {
		return dataNascita;
	}

	public void setDataNascita(LocalDate dataNascita) {
		this.dataNascita = dataNascita;
	}

	public boolean isAbilitazione() {
		return abilitazione;
	}

	public void setAbilitazione(boolean abilitazione) {
		this.abilitazione = abilitazione;
	}

	public String getRuolo() {
		return ruolo;
	}

	public void setRuolo(String ruolo) {
		this.ruolo = ruolo;
	}
	
	public List<AttivitaDisponibili> getAttDisp() {
		return attDisp;
	}

	public void setAttDisp(List<AttivitaDisponibili> attDisp) {
		this.attDisp = attDisp;
	}

}