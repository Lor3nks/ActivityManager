package repository;

import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import domain.AttivitaDisponibili;

@Repository
public class AttivitaDisponibiliDao implements AttivitaDisponibiliDaoInt {
 		
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	 

	@Override
	public int salva(AttivitaDisponibili ad) {
		String sql = "INSERT INTO ATTIVITA_DISPONIBILI (ID_DISP, DESCRIZIONE, ABILITAZIONE) VALUES (?,?,?)";
		return jdbcTemplate.update(sql,new Object[] {ad.getid_Disp(), ad.getDescrizione(), ad.getAbilitazione() });
		
	}

	@Override
	public int modifica(AttivitaDisponibili ad) {
		String sql = "UPDATE ATTIVITA_DISPONIBILI SET DESCRIZIONE=?, ABILITAZIONE=? WHERE ID_DISP=?";
		return jdbcTemplate.update(sql,new Object[] {ad.getDescrizione(), ad.getAbilitazione(), ad.getid_Disp() });
	}
	
	@Override
	public int modificaAbilitazione(AttivitaDisponibili ad) {
		String sql = "UPDATE ATTIVITA_DISPONIBILI SET ABILITAZIONE=? WHERE ID_DISP=?";
		return jdbcTemplate.update(sql,new Object[] {ad.getAbilitazione(), ad.getid_Disp() });
	}

	@Override
	public AttivitaDisponibili getAttivitaDisponibiliById(String id_Disp) {
		String sql = "SELECT * FROM ATTIVITA_DISPONIBILI WHERE ID_DISP=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {id_Disp}, new BeanPropertyRowMapper<AttivitaDisponibili>(AttivitaDisponibili.class));
	}

	@Override
	public List<AttivitaDisponibili> getAllAttivitaDisponibili() {
		String sql = "SELECT * FROM ATTIVITA_DISPONIBILI";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<AttivitaDisponibili>(AttivitaDisponibili.class));		
	}

	
}
