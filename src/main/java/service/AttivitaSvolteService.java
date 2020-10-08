package service;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.AttivitaSvolte;
import domain.Impiegato;
import repository.AttivitaSvolteDaoInt;
 
@Service
public class AttivitaSvolteService implements AttivitaSvolteServiceInt {

	@Autowired
	AttivitaSvolteDaoInt attivitaSvolteDaoInt;
	
	@Override
	public int salvaAttivitaSvolte(AttivitaSvolte as) {
		return attivitaSvolteDaoInt.salva(as);
	}

	@Override
	public int modificaAttivitaSvolte(AttivitaSvolte as) {
		return attivitaSvolteDaoInt.modifica(as);
	}

	@Override
	public List<AttivitaSvolte> recuperaAttivitaSvolteDaImpiegato(Impiegato i) {
		return attivitaSvolteDaoInt.getAttivitaSvolteByImpiegato(i);
	}

	@Override
	public List<AttivitaSvolte> recuperaAttivitaSvolte() {
		return attivitaSvolteDaoInt.getAllAttivitaSvolte();
	}

	@Override
	public String getAttIdDispFromAttSvolte(int idSv) {
		return attivitaSvolteDaoInt.getIdAttivitaDisponibili(idSv);
	}
	
	@Override
	public String getUsernameFromAttSvolte(int idSv) {
		return attivitaSvolteDaoInt.getUsernameImpiegato(idSv);
	}

	@Override
	public int eliminaAttivitaSvolte(int idSv) {
		return attivitaSvolteDaoInt.cancellaAttivitaSvolte(idSv);
	}

	@Override
	public AttivitaSvolte recuperaAttivitaSvolteById(int idSv) {	
		return attivitaSvolteDaoInt.leggiAttivitaSvolteById(idSv);
	}

	@Override
	public List<AttivitaSvolte> recuperaAttivitaSvolteDaA(LocalDate dataInizio, LocalDate dataFine) {
		return attivitaSvolteDaoInt.getAttivitaSvolteFromTo(dataInizio, dataFine);
	}
}
