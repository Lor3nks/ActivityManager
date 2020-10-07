package config;


import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Import;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.ReloadableResourceBundleMessageSource;
import org.springframework.core.env.Environment;
import org.springframework.format.FormatterRegistry;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.JstlView;

import formatter.LocalDateFormatter;

@EnableWebMvc
@Configuration
@ComponentScan(basePackages = {"controller","domain","formatter","repository","service"})
@Import({ SecurityConfig.class })
@PropertySource("classpath:jdbc.properties")
public class AppConfig implements WebMvcConfigurer{
	
	
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver viewResolver = new InternalResourceViewResolver();
		viewResolver.setViewClass(JstlView.class);
		viewResolver.setPrefix("/WEB-INF/pages/");
		viewResolver.setSuffix(".jsp");
		return viewResolver;
	}
	@Autowired
	Environment environment;
	
	@Bean(name = "dataSource")
	DriverManagerDataSource dataSource() {
		DriverManagerDataSource driverManagerDataSource = new DriverManagerDataSource();
		driverManagerDataSource.setDriverClassName(environment.getProperty("jdbc.driverClassName"));
		driverManagerDataSource.setUrl(environment.getProperty("jdbc.url"));
		driverManagerDataSource.setUsername(environment.getProperty("jdbc.username"));
		driverManagerDataSource.setPassword(environment.getProperty("jdbc.password"));
		
		return  driverManagerDataSource;
	}
	
	@Bean
    public JavaMailSender getJavaMailSender() 
    {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();
        mailSender.setHost("smtp.mail.yahoo.com");
        mailSender.setPort(465);
        mailSender.setUsername("activitytraker@yahoo.com");
        mailSender.setPassword("cgzyyswbkkmhmcos");
          
        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.transport.protocol", "smtp");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "false");
        props.put("mail.debug", "true");
        props.put("mail.smtp.socketFactory.port", "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.socketFactory.port", "465");
          
        return mailSender;
    }
	
//	<bean id="mailSender" class="org.springframework.mail.javamail.JavaMailSenderImpl">
//    <property name="host" value="smtp.mail.yahoo.com" />
//    <property name="port" value="465" />
//    <property name="username" value="activitytraker@yahoo.com" />
//    <property name="password" value="cgzyyswbkkmhmcos" />
//    <property name="javaMailProperties">
//        <props>
//            <prop key="mail.smtp.auth">true</prop>
//            <prop key="mail.debug">true</prop>
//            <prop key="mail.transport.protocol">smtp</prop>
//            <prop key="mail.smtp.socketFactory.class">javax.net.ssl.SSLSocketFactory</prop>
//            <prop key="mail.smtp.socketFactory.port">465</prop>
//            <prop key="mail.smtp.starttls.enable">false</prop>
//        </props>
//    </property>
//</bean>
	
	@Override
	public void addResourceHandlers(final ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/js/**").addResourceLocations("/ui/js/");
		registry.addResourceHandler("/css/**").addResourceLocations("/ui/css/");
		registry.addResourceHandler("/resources/**").addResourceLocations("/resources/");
	}
	
	@Override
    public void addFormatters(FormatterRegistry registry) {
        registry.addFormatter(new LocalDateFormatter("dd/MM/yyyy"));
    }
	
//	@Bean(name = "messageSource")
//	  public ReloadableResourceBundleMessageSource getMessageSource() {
//	      ReloadableResourceBundleMessageSource messageSource = new ReloadableResourceBundleMessageSource();
//	      messageSource.setBasename("/WEB-INF/resource/messages");
//	      messageSource.setDefaultEncoding("UTF-8");
//	      messageSource.setUseCodeAsDefaultMessage(true);
//	      return messageSource;
//	  }
}