package service;

import java.util.List;

import domain.Impiegato;
 
public interface ImpiegatoServiceInt {

	public int inserisciImpiegato(Impiegato i);
	public int modificaImpiegato(Impiegato i);
	public int cambiaPwdImpiegato(String username,String newPassword);
	public Boolean checkAbilitazioneImpiegato(Impiegato i);
	public List<Impiegato> recuperaImpiegati();
	public Impiegato recuperaImpiegatoByUser(String username);
	public int modificaAbilitazioneImpiegato(String username,boolean abilitazione);
	public Impiegato checkLoginImpiegato(String username,String password);
}
