package config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.NoOpPasswordEncoder;
import org.springframework.security.web.firewall.DefaultHttpFirewall;
import org.springframework.security.web.firewall.HttpFirewall;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {

	@Autowired
	DataSource dataSource;
	
	// NoOpPasswordEncoder deprecato ma funzionante
	@Bean
	public static NoOpPasswordEncoder passwordEncoder() {
	return (NoOpPasswordEncoder) NoOpPasswordEncoder.getInstance();
	}
	
	@Bean
	public HttpFirewall allowUrlEncodedSlashHttpFirewall() {
	    DefaultHttpFirewall firewall = new DefaultHttpFirewall();
	    firewall.setAllowUrlEncodedSlash(true);
	    return firewall;
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
	
	@Override
	public void configure(WebSecurity web) throws Exception {
	    web.httpFirewall(allowUrlEncodedSlashHttpFirewall());
	}
}