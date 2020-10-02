package repository;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import domain.Amministratore;
import domain.Impiegato;


@Repository
public class AmministratoreDao implements AmministratoreDaoInt{
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
	    this.jdbcTemplate = new JdbcTemplate(dataSource);
	}

	@Override
	public Amministratore checkLogin(String username,String password) {
		String sql="select * from AMMINISTRATORE where USERNAME=? AND PASSWORD = ?";
		return jdbcTemplate.queryForObject(sql, new Object[] { username,password },new BeanPropertyRowMapper<Amministratore>(Amministratore.class)); 
		
	}

	@Override
	public Amministratore getAmministratoreByUser(String username) {
		String sql = "SELECT * FROM IMPIEGATO WHERE USERNAME=? AND RUOLO='AMMINISTRATORE'";
		return jdbcTemplate.queryForObject(sql, new Object[] {username}, new BeanPropertyRowMapper<Amministratore>(Amministratore.class));
		
	}

		


      
}
