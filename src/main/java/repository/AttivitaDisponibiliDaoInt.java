package repository;

import java.util.List;

import domain.AttivitaDisponibili;

public interface AttivitaDisponibiliDaoInt {
	public int salva(AttivitaDisponibili ad);
	public int modifica(AttivitaDisponibili ad);
	public int modificaAbilitazione(AttivitaDisponibili ad);
	public AttivitaDisponibili getAttivitaDisponibiliById(String id_disp);
	public List<AttivitaDisponibili> getAllAttivitaDisponibili();
	
}
