package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import domain.AttivitaSvolte;
import domain.Impiegato;
import repository.AttivitaSvolteDaoInt;

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

}
