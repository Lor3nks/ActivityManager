package domain;

import java.io.Serializable;
import java.time.LocalDate;

public class Impiegato implements Serializable {
	
	private static final long serialVersionUID = 7611569892498705160L;
	private String username;
	private String password;
	private String email;
	private String nome;
	private String cognome;
	private LocalDate dataNascita;
	private boolean abilitazione;
	private String ruolo;

	public Impiegato() {
		super();
	}
	
	

	public Impiegato(String password, String email, String nome, String cognome, LocalDate dataNascita,
			boolean abilitazione, String ruolo) {
		super();
		this.password = password;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.abilitazione = abilitazione;
		this.ruolo = ruolo; 
	}



	public Impiegato(String username, String password, String email, String nome, String cognome, LocalDate dataNascita,
			boolean abilitazione, String ruolo) {
		super();
		this.username = username;
		this.password = password;
		this.email = email;
		this.nome = nome;
		this.cognome = cognome;
		this.dataNascita = dataNascita;
		this.abilitazione = abilitazione;
		this.ruolo = ruolo;
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
	
	
	
	

}