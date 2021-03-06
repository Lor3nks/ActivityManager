package repository;

import java.util.List;

import domain.Impiegato;

public interface ImpiegatoDaoInt {
	
	public int inserisci (Impiegato i);
	public int modifica (Impiegato i);
	public int cambiaPwd (String newPassword, String username);
	public Boolean checkAbilitazione (Impiegato i);
	public List <Impiegato> getAllImpiegati ();
	public Impiegato getImpiegatoByUser (String username);
	public int modificaAbilitazione(String username, boolean abilitazione);
}
