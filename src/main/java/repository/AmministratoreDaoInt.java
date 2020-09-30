package repository;

import domain.Amministratore;

public interface AmministratoreDaoInt {
	
	public Amministratore checkLogin(String username, String password);

}