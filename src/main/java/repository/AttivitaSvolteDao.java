package repository;



import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

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
		String sql="insert into attivita_svolte(username,id_disp,data_Attivita,ora_inizio,ora_fine,note) values(?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,new Object[] { as.getImp().getUsername(),as.getAtt_Disp().getid_Disp(),as.getData_Attivita(), as.getOra_Inizio(),as.getOra_Fine(),as.getNote()});
		
	}
	

	@Override
	public int modifica(AttivitaSvolte as) {
		String sql="update attivita_svolte set username = ?,id_disp=?,data_attivita=?,ora_inizio=?,ora_fine=?,note=?, where id_Trigg=?";
		 return jdbcTemplate.update(sql,new Object[] {as.getImp().getUsername(),as.getAtt_Disp().getid_Disp(), as.getData_Attivita(), as.getOra_Inizio(),as.getOra_Fine() ,as.getNote(),as.getId_Trigg()});
		
	}

	@Override
	public List<AttivitaSvolte> getAllAttivitaSvolte() {
		
			String sql="select * from attivita_svolte";
			return jdbcTemplate.query(sql, new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class));
		}

	@Override
	public List<AttivitaSvolte> getAttivitaSvolteByImpiegato(Impiegato i) {
		String sql="select * from attivita_svolte where username=?";
		return jdbcTemplate.query(sql,new BeanPropertyRowMapper<AttivitaSvolte>(AttivitaSvolte.class),i.getUsername()); 
		
	}
		
}


