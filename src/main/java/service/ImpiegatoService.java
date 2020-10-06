package service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Impiegato;
import repository.ImpiegatoDao;

 
@Service
public class ImpiegatoService implements ImpiegatoServiceInt{
	
	@Autowired
	ImpiegatoDao impiegatoDao;

	@Override
	public int inserisciImpiegato(Impiegato i) {
		return impiegatoDao.inserisci(i);
	}

	@Override
	public int modificaImpiegato(Impiegato i) {
		
		return impiegatoDao.modifica(i);
	}

	@Override
	public int cambiaPwdImpiegato(String username, String newPassword) {
		
		return impiegatoDao.cambiaPwd(username, newPassword);
	}

	@Override
	public Boolean checkAbilitazioneImpiegato(Impiegato i) {
		return impiegatoDao.checkAbilitazione(i);
	}

	@Override
	public List<Impiegato> recuperaImpiegati() {
		
		return impiegatoDao.getAllImpiegati();
	}

	@Override
	public Impiegato recuperaImpiegatoByUser(String username) {
		
		return impiegatoDao.getImpiegatoByUser(username);
	}

	@Override
	public int modificaAbilitazioneImpiegato(String username, boolean abilitazione) {
		
		return impiegatoDao.modificaAbilitazione(username, abilitazione);
	}

	@Override
	public Impiegato checkLoginImpiegato(String username, String password) {
		
		return impiegatoDao.checkLogin(username, password);
	}

	
}
