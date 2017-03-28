package com.dreamEMS.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

import com.dreamEMS.security.Handler.LoginSuccessHandler;
import com.dreamEMS.service.UserService;

@Configuration
public class WebSecurityConfiguration extends WebSecurityConfigurerAdapter {

    private final UserService userService;
    @Autowired LoginSuccessHandler loginSuccessHandler;

	/*@Override
	public void configure(WebSecurity web) throws Exception {
		web.ignoring().antMatchers("/**");
	}*/
	

    @Override
	protected void configure(HttpSecurity http) throws Exception {
    	http
	        .csrf().disable()
	        .authorizeRequests()
	        	.antMatchers("/", "/static/**", "/login").permitAll()
	        	.antMatchers("/ems/**").hasRole("USER")
                .antMatchers("/admin/**").access("hasRole('USER') and hasRole('ADMIN')") 
                .anyRequest().authenticated()
                .and()
            .formLogin()
		        .loginPage("/login")
		        .loginProcessingUrl("/login-process")
		        .passwordParameter("password")
		        .usernameParameter("id")
		        //.defaultSuccessUrl("/index.do",true)  // true : always-use-default-target
		        .successHandler(loginSuccessHandler)
		        .failureUrl("/login?error")
		        .permitAll()                    
	            .and()
            .logout()
	            //.logoutUrl("/logout")
	            .logoutSuccessUrl("/login?logout")
	            .invalidateHttpSession(true)
	            .clearAuthentication(true)
	            .deleteCookies("JSESSIONID")
	            .permitAll();
    	//http.exceptionHandling().accessDeniedPage("/login.do?error");
        //http.sessionManagement().invalidSessionUrl("/login.do");
	}
    
    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
         auth.userDetailsService(userService)
              .passwordEncoder(userService.passwordEncoder())
              ;
    }

	@Autowired
    public WebSecurityConfiguration(UserService userService) {
        this.userService = userService;
    }

    
    
}
