package repository;


 
import java.sql.Date;
import java.sql.Time;
import java.time.LocalDate;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import domain.AttivitaDisponibili;
import domain.AttivitaSvolte;
import domain.Impiegato;

@Repository
public class AttivitaSvolteDao implements AttivitaSvolteDaoInt{

	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
	    this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int salva(AttivitaSvolte as) {
		String sql="insert into attivita_svolte (USERNAME,ID_DISP,DATA_ATTIVITA,ORA_INIZIO,ORA_FINE,NOTE) values(?,?,?,?,?,?)";
		//return jdbcTemplate.update(sql,new Object[] { as.getImp().getUsername(),as.getAtt_Disp().getid_Disp(),Date.valueOf(as.getData_Attivita()), Time.valueOf(as.getOra_Inizio()), Time.valueOf(as.getOra_Fine()),as.getNote()});
		//return jdbcTemplate.update(sql,new Object[] { as.getImp().getUsername(),as.getAtt_Disp().getid_Disp(),Date.valueOf(as.getData_Attivita()), as.getOra_Inizio().toString(), as.getOra_Fine().toString(),as.getNote()});
		return jdbcTemplate.update(sql,new Object[] { as.getImp().getUsername(),as.getAtt_Disp().getid_Disp(),Date.valueOf(as.getData_Attivita()), as.getOra_Inizio(), as.getOra_Fine(),as.getNote()});
	}
	 

	@Override
	public int modifica(AttivitaSvolte as) {
		String sql="update attivita_svolte set ID_DISP=?,DATA_ATTIVITA=?,ORA_INIZIO=?,ORA_FINE=?,NOTE=? where ID_TRIGG=?";
		 return jdbcTemplate.update(sql,new Object[] {as.getAtt_Disp().getid_Disp(),Date.valueOf(as.getData_Attivita()), as.getOra_Inizio(), as.getOra_Fine(),as.getNote(),as.getId_Trigg()});
		
	}

	@Override
	public List<AttivitaSvolte> getAllAttivitaSvolte() {
		try {
			String sql="select * from attivita_svolte order by data_attivita desc";
			return jdbcTemplate.query(sql, new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class));
		} catch (EmptyResultDataAccessException e) {
			return null;
		}
	}

	@Override
	public List<AttivitaSvolte> getAttivitaSvolteByImpiegato(Impiegato i) {
		String sql="select * from attivita_svolte where username=? order by data_attivita desc";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class),i.getUsername()); 
		
	}

	@Override
	public String getIdAttivitaDisponibili(int idSv) {
		String sql = "SELECT ID_DISP FROM ATTIVITA_SVOLTE WHERE ID_TRIGG=?";
		return jdbcTemplate.queryForObject(sql, String.class, idSv);		
	}
	
	@Override
	public String getUsernameImpiegato(int idSv) {
		String sql = "SELECT USERNAME FROM ATTIVITA_SVOLTE WHERE ID_TRIGG=?";
		return jdbcTemplate.queryForObject(sql, String.class, idSv);
	}

	@Override
	public int cancellaAttivitaSvolte(int idSv) {
		String sql="DELETE FROM ATTIVITA_SVOLTE WHERE ID_TRIGG=?";
		return jdbcTemplate.update(sql,new Object[] {idSv});
	}

	@Override
	public AttivitaSvolte leggiAttivitaSvolteById(int idSv) {
		String sql="SELECT * FROM ATTIVITA_SVOLTE WHERE ID_TRIGG=?";
		return jdbcTemplate.queryForObject(sql, new Object[] { idSv },new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class));
	}

	@Override
	public List<AttivitaSvolte> getAttivitaSvolteFromTo(LocalDate dataInizio, LocalDate dataFine) {
		String sql ="SELECT * FROM ATTIVITA_SVOLTE WHERE DATA_ATTIVITA BETWEEN ? AND ? ORDER BY DATA_ATTIVITA DESC";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class), Date.valueOf(dataInizio), Date.valueOf(dataFine));
	}		
}

 
