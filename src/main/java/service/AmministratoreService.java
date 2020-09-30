package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Amministratore;
import repository.AmministratoreDaoImplements;
import repository.ImpiegatoDao;

@Service
public class AmministratoreService implements AmministratoreServiceInt{
	
	ImpiegatoDao iDao = new ImpiegatoDao();
	
	@Autowired
	AmministratoreDaoImplements AmministratoreDaoImplements;
	
	@Override
	public Amministratore checkLoginAmministratore(String username, String password) {
		return AmministratoreDaoImplements.checkLogin(username, password);
	}

	@Override
	public int resetPwdImpiegato(String username, String randomPassword) {
		return iDao.cambiaPwd(username, randomPassword);	
	}
	
	

}
