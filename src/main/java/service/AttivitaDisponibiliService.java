package service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.AttivitaDisponibili;
import repository.AttivitaDisponibiliDao;
 
@Service
public class AttivitaDisponibiliService implements AttivitaDisponibiliServiceInt {

	@Autowired
	AttivitaDisponibiliDao attivitaDisponibiliDao;
	
	
	@Override
	public int salvaAttivitaDisponibili(AttivitaDisponibili ad) {
		return attivitaDisponibiliDao.salva(ad);
	}

	@Override
	public int modificaAttivitaDisponibili(AttivitaDisponibili ad) {
		return attivitaDisponibiliDao.modifica(ad);
	}

	@Override
	public int modificaAbilitazioneAttivitaDisponibili(AttivitaDisponibili ad) {
		return attivitaDisponibiliDao.modificaAbilitazione(ad);
	}

	@Override
	public AttivitaDisponibili recuperaAttivitaDisponibiliById(String id_disp) {
		return attivitaDisponibiliDao.getAttivitaDisponibiliById(id_disp);
	}

	@Override
	public List<AttivitaDisponibili> RecuperaAttivitaDisponibili() {
		return attivitaDisponibiliDao.getAllAttivitaDisponibili();
	}

}
