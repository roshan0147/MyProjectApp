package in.nit.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;
import org.springframework.stereotype.Component;

@Component
@EnableWebSecurity
public class SecurityConfig 
extends WebSecurityConfigurerAdapter
{
	@Autowired
	private UserDetailsService userDetailsService;

	@Autowired
	private BCryptPasswordEncoder passwordEncoder; 

	//1. verify un/pwd
	@Override
	protected void configure(AuthenticationManagerBuilder auth) 
			throws Exception 
	{
		auth.userDetailsService(userDetailsService)
		.passwordEncoder(passwordEncoder);
	}

	//2. verfiy roles
	@Override
	protected void configure(HttpSecurity http) 
			throws Exception 
	{
		http
		.csrf().disable()
		.authorizeRequests()

		.antMatchers("/user/**")
		.permitAll()

		.antMatchers("/uom/**","/whusertype/**",
				"/part/**","/ordermethod/**","/shipment/**")
		.hasAuthority("EMPLOYEE")

		.antMatchers("/purchaseOrder/**","/grn/**","/saleOrder/**","/shipping/**")
		.hasAuthority("ADMIN")

		//remaining URLS can be accessed by
		.anyRequest()
		.authenticated() //Who just login (no role required)


		.and()
		.formLogin() 
		.loginPage("/user/login")
		.loginProcessingUrl("/login")
		.defaultSuccessUrl("/uom/register", true)
		.failureUrl("/user/login?error=true")

		.and()
		.logout()
		.logoutRequestMatcher(new AntPathRequestMatcher("/logout"))
		.logoutSuccessUrl("/user/login?logout=true");

	}
}



