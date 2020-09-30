package repository;



import java.util.List;

import domain.AttivitaSvolte;
import domain.Impiegato;



public interface AttivitaSvolteDaoInt {
	public int salva(AttivitaSvolte as);
	public int modifica(AttivitaSvolte as);
	public List<AttivitaSvolte> getAllAttivitaSvolte();
	public List<AttivitaSvolte> getAttivitaSvolteByImpiegato(Impiegato i);
}