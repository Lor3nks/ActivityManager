package domain;

import java.util.List;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
   
public class AttivitaDisponibili {
  
	@NotEmpty
	private String id_Disp;
	@NotEmpty
	private String descrizione;
	@NotNull
	private int abilitazione;
	
	private List<Impiegato> impiegato;
	

	public AttivitaDisponibili() {
		super();
	}


	public AttivitaDisponibili(String descrizione) {
		super();
		this.descrizione = descrizione;
	}

	public AttivitaDisponibili(String id_Disp, String descrizione, int abilitazione) {
		super();
		this.id_Disp = id_Disp;
		this.descrizione = descrizione;
		this.abilitazione = abilitazione;
	}	
	
	public AttivitaDisponibili(String id_Disp, String descrizione, int abilitazione,List<Impiegato> impiegato) {
		super();
		this.id_Disp = id_Disp;
		this.descrizione = descrizione;
		this.abilitazione = abilitazione;
		this.impiegato=impiegato;
	}

	public String getid_Disp() {
		return id_Disp;
	}

	public void setid_Disp(String id_Disp) {
		this.id_Disp = id_Disp;
	}

	public String getDescrizione() {
		return descrizione;
	}

	public void setDescrizione(String descrizione) {
		this.descrizione = descrizione;
	}

	public int getAbilitazione() {
		return abilitazione;
	}

	public void setAbilitazione(int abilitazione) {
		this.abilitazione = abilitazione;
	}


	public List<Impiegato> getImpiegato() {
		return impiegato;
	}


	public void setImpiegato(List<Impiegato> impiegato) {
		this.impiegato = impiegato;
	}

}