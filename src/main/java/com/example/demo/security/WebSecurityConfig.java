package com.example.demo.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;

import javax.sql.DataSource;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	private static final String USER_ROLE = "USER";
	private static final String ADMIN_ROLE = "ADMIN";
	@Autowired
	private DataSource dataSource;

	@Autowired
	AuthenticationSuccessHandlerCustom authenticationSuccessHandlerCustom;

	@Autowired
	public void configAuthentication(AuthenticationManagerBuilder auth) throws Exception {
		auth.jdbcAuthentication().dataSource(dataSource).passwordEncoder(passwordEncoder())
				.usersByUsernameQuery("SELECT username, password, enabled FROM user WHERE username=?")
				.authoritiesByUsernameQuery(
						"SELECT u.username, r.name FROM user_role ur " + " INNER JOIN user u ON u.id = ur.user_id"
								+ " INNER JOIN  role r ON r.id = ur.role_id" + " WHERE u.username=?");
	}

	@Bean
	public PasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.csrf().disable()
		.authorizeRequests()
		.antMatchers("/login").authenticated()
		.antMatchers("/admin/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/customer/**").hasAuthority(ADMIN_ROLE)
        .antMatchers("/editAccountUser/**").hasAuthority(ADMIN_ROLE)
        .antMatchers("/editAccount/**").hasAuthority(ADMIN_ROLE)
        .antMatchers("/newUser/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/productsadmin/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/productSearch/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/searchByCategory/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/addProduct/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/newProduct/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/editProduct/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/updateProduct/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/deleteproduct/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/orders/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/viewdetails/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/editOrder/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/updateOrder/**").hasAuthority(ADMIN_ROLE)
		.antMatchers("/user/**").hasAuthority(USER_ROLE)
		.antMatchers("/search/**").hasAuthority(USER_ROLE)
		.antMatchers("/viewAllProducts/**").hasAuthority(USER_ROLE)
		.antMatchers("/page/**").hasAuthority(USER_ROLE)
		.antMatchers("/viewProduct/**").hasAuthority(USER_ROLE)
		.antMatchers("/cart/**").hasAuthority(USER_ROLE)
		.and()
		.formLogin().permitAll()
		.loginPage("/login")
		.loginProcessingUrl("/j_spring_security_check")
		.usernameParameter("username")
		.passwordParameter("password")
		.failureUrl("/error")
		.successHandler(authenticationSuccessHandlerCustom)
		.and()
		.logout()
		.permitAll()
		.logoutUrl("/logout");

	}
}
