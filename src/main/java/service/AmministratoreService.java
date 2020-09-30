package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import domain.Amministratore;
import repository.AmministratoreDaoImplements;

@Service
public class AmministratoreService implements AmministratoreServiceInt{
	
	@Autowired
	AmministratoreDaoImplements AmministratoreDaoImplements;
	
	@Override
	public Amministratore checkLoginAmministratore(String username, String password) {
		return AmministratoreDaoImplements.checkLogin(username, password);
	}

}
