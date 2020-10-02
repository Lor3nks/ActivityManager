package domain;

import java.util.List;

public class AttivitaDisponibili {

	private String id_Disp;
	private String descrizione;
	private String abilitazione;
	private List<Impiegato> impiegato;
	

	public AttivitaDisponibili() {
		super();
	}


	public AttivitaDisponibili(String descrizione) {
		super();
		this.descrizione = descrizione;
	}

	public AttivitaDisponibili(String id_Disp, String descrizione, String abilitazione,List<Impiegato> impiegato) {
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

	public String getAbilitazione() {
		return abilitazione;
	}

	public void setAbilitazione(String abilitazione) {
		this.abilitazione = abilitazione;
	}


	public List<Impiegato> getImpiegato() {
		return impiegato;
	}


	public void setImpiegato(List<Impiegato> impiegato) {
		this.impiegato = impiegato;
	}

	
	
}