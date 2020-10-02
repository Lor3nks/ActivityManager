package service;

import domain.Amministratore;

public interface AmministratoreServiceInt {
	public Amministratore checkLoginAmministratore(String username,String password);
	public int resetPwdImpiegato(String username, String randomPassword);
	public Amministratore recuperaAmministratoreByUser(String username);
}
