package config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
//	@Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
	
	@Bean
	public static NoOpPasswordEncoder passwordEncoder() {
	return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
	}
	
	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		
		auth.jdbcAuthentication().dataSource(dataSource)
			.usersByUsernameQuery("select username,password, abilitazione from impiegato where username=?")
			.authoritiesByUsernameQuery("select username, ruolo from impiegato where username=?");
	}
		
	@Override
	protected void configure(HttpSecurity http) throws Exception {  
		
		http.authorizeRequests()
		.antMatchers("/menuAmministratore", "/visualizzaListaImpiegati", "/formAttivitaDisponibili", "/modificaAttivitaDisponibili1", "/modificaImpAmm", "/visualizzaAttivitaDisponibili", "/visualizzaAttivitaSvolte").hasAuthority("amministratore")
		.and()
			.formLogin().loginPage("/login").failureUrl("/login?error")
				.usernameParameter("username").passwordParameter("password")
					.defaultSuccessUrl("/mainMenu")
		.and()
			.logout().logoutSuccessUrl("/login?logout")
		.and()
			.exceptionHandling().accessDeniedPage("/403")
		.and()
			.csrf().disable();
	}
}