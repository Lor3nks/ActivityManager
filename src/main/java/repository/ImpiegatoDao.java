package repository;

import java.sql.Date;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import domain.Impiegato;

@Repository
public class ImpiegatoDao implements ImpiegatoDaoInt {
	
	private JdbcTemplate jdbcTemplate;
	
	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.jdbcTemplate = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int inserisci(Impiegato i) {
		String sql = "insert into impiegato(username,password,email,nome,cognome,data_nascita,abilitazione) values(?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, new Object[] {i.getUsername(), i.getPassword(), i.getEmail(), i.getNome(), i.getCognome(), Date.valueOf(i.getDataNascita()), i.isAbilitazione()});
	}

	@Override
	public int modifica(Impiegato i) {
		String sql = "UPDATE IMPIEGATO SET(PASSWORD=?, EMAIL=?, NOME=?, COGNOME=?, DATA_NASCITA=?, ABILITAZIONE=?, RUOLO=?) WHERE USERNAME=?";
		return jdbcTemplate.update(sql, new Object[] {i.getPassword(), i.getEmail(), i.getNome(), i.getCognome(), Date.valueOf(i.getDataNascita()), i.isAbilitazione(), i.getRuolo()});
	}

	@Override
	public int cambiaPwd(String username, String newPassword) {
		String sql = "UPDATE IMPIEGATO SET(PASSWORD=?) WHERE USERNAME=?";
		return jdbcTemplate.update(sql, new Object[] {username, newPassword});
	}

	@Override
	public Boolean checkAbilitazione(Impiegato i) {
		String sql = "SELECT ABILITAZIONE FROM IMPIEGATO WHERE USERNAME=?";
		return jdbcTemplate.queryForObject(sql, Boolean.class, i.getUsername());
		
	}

	@Override
	public List <Impiegato> getAllImpiegati() {
		String sql ="SELECT * FROM IMPIEGATO ORDER BY COGNOME ASC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<Impiegato>(Impiegato.class));
	}

	@Override
	public Impiegato getImpiegatoByUser(String username) {
		String sql = "SELECT * FROM IMPIEGATO WHERE USERNAME=?";
		return jdbcTemplate.queryForObject(sql, new Object[] {username}, new BeanPropertyRowMapper<Impiegato>(Impiegato.class));
		
	}

	@Override
	public int modificaAbilitazione(String username, boolean abilitazione) {
		String sql = "UPDATE ABILITAZIONE FROM IMPIEGATO WHERE USERNAME=?";
		return jdbcTemplate.update(sql, new Object[] {username, abilitazione});
	}

	@Override
	public Impiegato checkLogin(String username, String password) {
		String sql = "SELECT * FROM IMPIEGATO WHERE USERNAME=? AND PASSWORD=? ";
		return jdbcTemplate.queryForObject(sql, new Object[] {username, password}, new BeanPropertyRowMapper<Impiegato>(Impiegato.class));
	}
	

}
