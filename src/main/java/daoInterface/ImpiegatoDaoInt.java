package daoInterface;

import java.sql.Connection;

import domain.Impiegato;

public interface ImpiegatoDaoInt {
	
	public int cancella (Connection con, Impiegato i);
	public int inserisci (Connection con, Impiegato i);
	public int modifica (Connection con, Impiegato i);
	public int cambiaPwd (Connection con, Impiegato i);
	

}
