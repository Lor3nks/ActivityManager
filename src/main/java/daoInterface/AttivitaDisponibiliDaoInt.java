package daoInterface;

import java.util.List;

import domain.AttivitaDisponibili;

public interface AttivitaDisponibiliDaoInt {
	public void salva(AttivitaDisponibili ad);
	public void modifica(AttivitaDisponibili ad);
	public void getAttivitaDisponibiliById(AttivitaDisponibili ad, String  id_disp);
	public List<AttivitaDisponibili> getAllAttivitaDisponibili(AttivitaDisponibili ad);
	public void modificaAbilitazione(AttivitaDisponibili ad);
}
