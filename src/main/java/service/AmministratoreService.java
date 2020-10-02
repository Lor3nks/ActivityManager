package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Amministratore;
import domain.Impiegato;
import repository.AmministratoreDao;
import repository.ImpiegatoDao;

@Service
public class AmministratoreService implements AmministratoreServiceInt{
	
	ImpiegatoDao iDao = new ImpiegatoDao();
	
	@Autowired
	AmministratoreDao AmministratoreDao;
	
	@Override
	public Amministratore checkLoginAmministratore(String username, String password) {
		return AmministratoreDao.checkLogin(username, password);
	}

	@Override
	public int resetPwdImpiegato(String username, String randomPassword) {
		return iDao.cambiaPwd(username, randomPassword);	
	}
	
	@Override
	public Amministratore recuperaAmministratoreByUser(String username) {
		return AmministratoreDao.getAmministratoreByUser(username);
	}
	
	
	

}
