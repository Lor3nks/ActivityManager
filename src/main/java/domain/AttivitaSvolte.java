package domain;

import java.io.Serializable;
import java.time.LocalDate;
import java.time.LocalDateTime;

public class AttivitaSvolte implements Serializable {

	private static final long serialVersionUID = 4261989059440444174L;
	private int id_Trigg;
	private String username;
	private String id_Disp;
	private LocalDate data_Attivita;
	private LocalDateTime ora_Inizio;
	private LocalDateTime ora_Fine;
	private String note;
	
	
	public AttivitaSvolte() {
		super();
	}

	public AttivitaSvolte(String username, String id_Disp, LocalDate data_Attivita, LocalDateTime ora_Inizio,
			LocalDateTime ora_Fine, String note) {
		super();
		this.username = username;
		this.id_Disp = id_Disp;
		this.data_Attivita = data_Attivita;
		this.ora_Inizio = ora_Inizio;
		this.ora_Fine = ora_Fine;
		this.note = note;
	}

	public AttivitaSvolte(int id_Trigg, String username, String id_Disp, LocalDate data_Attivita, LocalDateTime ora_Inizio,
			LocalDateTime ora_Fine, String note) {
		super();
		this.id_Trigg = id_Trigg;
		this.username = username;
		this.id_Disp = id_Disp;
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

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getId_Disp() {
		return id_Disp;
	}

	public void setId_Disp(String id_Disp) {
		this.id_Disp = id_Disp;
	}

	public LocalDate getData_Attivita() {
		return data_Attivita;
	}

	public void setData_Attivita(LocalDate data_Attivita) {
		this.data_Attivita = data_Attivita;
	}

	public LocalDateTime getOra_Inizio() {
		return ora_Inizio;
	}

	public void setOra_Inizio(LocalDateTime ora_Inizio) {
		this.ora_Inizio = ora_Inizio;
	}

	public LocalDateTime getOra_Fine() {
		return ora_Fine;
	}

	public void setOra_Fine(LocalDateTime ora_Fine) {
		this.ora_Fine = ora_Fine;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
	
}