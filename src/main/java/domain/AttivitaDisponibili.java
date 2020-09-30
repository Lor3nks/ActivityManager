package domain;

public class AttivitaDisponibili {

	private String id_Disp;
	private String descrizione;
	

	public AttivitaDisponibili() {

	}

	public AttivitaDisponibili(String descrizione) {
		super();
		this.descrizione = descrizione;
	}

	public AttivitaDisponibili(String id_Disp, String descrizione) {
		super();
		this.id_Disp = id_Disp;
		this.descrizione = descrizione;
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

}