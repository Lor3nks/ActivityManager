package daoInterface;

import domain.Impiegato;

public interface ImpiegatoDaoInt {
	
	public int inserisci (Impiegato i);
	public int modifica (Impiegato i);
	public int cambiaPwd (String username, String newPassword);
	public int checkAbilitazione (Impiegato i);
	public int getAllImpigati ();
	public int getAllImpByUser (String username);
	public int modificaAbilitazione(String username, boolean abilitazione);
	public int checkLogin (String username, String password);
	

}
