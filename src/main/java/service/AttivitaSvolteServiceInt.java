package service;

import java.util.List;

import domain.AttivitaSvolte;
import domain.Impiegato;

public interface AttivitaSvolteServiceInt {
	
	public int salvaAttivitaSvolte(AttivitaSvolte as);
	public int modificaAttivitaSvolte(AttivitaSvolte as);
	public List<AttivitaSvolte> recuperaAttivitaSvolteDaImpiegato(Impiegato i);
	public List<AttivitaSvolte> recuperaAttivitaSvolte();
	public String getAttIdDispFromAttSvolte(int idSv);
	public int eliminaAttivitaSvolte(int idSv);
	public AttivitaSvolte recuperaAttivitaSvolteById(int idSv);
	
}
