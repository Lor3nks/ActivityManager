package domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalTime;

import javax.validation.constraints.Size;
 
public class AttivitaSvolte implements Serializable {

	private static final long serialVersionUID = 4261989059440444174L;
	private int id_Trigg;
	private Impiegato imp;
	private AttivitaDisponibili att_Disp;
	private LocalDate data_Attivita;
	private String ora_Inizio;
	private String ora_Fine;
	private String note;
	
	public AttivitaSvolte() {
		super();
	
	}

	public AttivitaSvolte(int id_Trigg, Impiegato imp, AttivitaDisponibili att_Disp, LocalDate data_Attivita,
			String ora_Inizio, String ora_Fine, String note) {
		super();
		this.id_Trigg = id_Trigg;
		this.imp = imp;
		this.att_Disp = att_Disp;
		this.data_Attivita = data_Attivita;
		this.ora_Inizio = ora_Inizio;
		this.ora_Fine = ora_Fine;
		this.note = note;
	}

	public AttivitaSvolte(Impiegato imp, AttivitaDisponibili att_Disp, LocalDate data_Attivita,
			String ora_Inizio, String ora_Fine, String note) {
		super();
		this.imp = imp;
		this.att_Disp = att_Disp;
		this.data_Attivita = data_Attivita;
		this.ora_Inizio = ora_Inizio;
		this.ora_Fine = ora_Fine;
		this.note = note;
	}

	public int getId_Trigg() {
		return id_Trigg;
	}

	public void setId_Trigg(int id_Trigg) {
		this.id_Trigg = id_Trigg;
	}

	public Impiegato getImp() {
		return imp;
	}

	public void setImp(Impiegato imp) {
		this.imp = imp;
	}

	public AttivitaDisponibili getAtt_Disp() {
		return att_Disp;
	}

	public void setAtt_Disp(AttivitaDisponibili att_Disp) {
		this.att_Disp = att_Disp;
	}

	public LocalDate getData_Attivita() {
		return data_Attivita;
	}

	public void setData_Attivita(LocalDate data_Attivita) {
		this.data_Attivita = data_Attivita;
	}

	public String getOra_Inizio() {
		return ora_Inizio;
	}

	public void setOra_Inizio(String ora_Inizio) {
		this.ora_Inizio = ora_Inizio;
	}

	public String getOra_Fine() {
		return ora_Fine;
	}

	public void setOra_Fine(String ora_Fine) {
		this.ora_Fine = ora_Fine;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	
}