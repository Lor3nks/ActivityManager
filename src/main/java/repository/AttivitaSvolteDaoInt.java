package repository;



import java.time.LocalDate;
import java.util.List;

import domain.AttivitaSvolte;
import domain.Impiegato;

 

public interface AttivitaSvolteDaoInt {
	public int salva(AttivitaSvolte as);
	public int modifica(AttivitaSvolte as);
	public List<AttivitaSvolte> getAllAttivitaSvolte();
	public List<AttivitaSvolte> getAttivitaSvolteByImpiegato(Impiegato i);
	public String getIdAttivitaDisponibili(int idSv);
	public String getUsernameImpiegato(int idSv);
	public int cancellaAttivitaSvolte(int idSv);
	public AttivitaSvolte leggiAttivitaSvolteById(int idSv);
	public List<AttivitaSvolte> getAttivitaSvolteFromTo(LocalDate dataInizio, LocalDate dataFine);
}
