package daoInterface;

import java.util.List;

import domain.AttivitaSvolte;



public interface AttivitaSvolteDaoInt {
	public void salva(AttivitaSvolte as);
	public void modifica(AttivitaSvolte as);
	public List<AttivitaSvolte> getAllAttivitaSvolte();
	
}
