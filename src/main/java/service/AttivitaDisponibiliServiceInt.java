package service;

import java.util.List;

import domain.AttivitaDisponibili;
 
public interface AttivitaDisponibiliServiceInt {
	public int salvaAttivitaDisponibili(AttivitaDisponibili ad);
	public int modificaAttivitaDisponibili(AttivitaDisponibili ad);
	public int modificaAbilitazioneAttivitaDisponibili(AttivitaDisponibili ad);
	public AttivitaDisponibili recuperaAttivitaDisponibiliById(String id_disp);
	public List<AttivitaDisponibili> RecuperaAttivitaDisponibili();
	public int cancellaAttivitaDisponibili(String idAd);
}
