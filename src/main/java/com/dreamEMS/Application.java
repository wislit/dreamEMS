package com.dreamEMS;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * SpringBoot-MyBatis Application.
 *
 * @author Xiaoyue Xiao
 */
@SpringBootApplication
public class Application extends SpringBootServletInitializer  {
	
	//aa
	 @Override
	    protected SpringApplicationBuilder configure(SpringApplicationBuilder application) {
	        return application.sources(Application.class);
	    }
	 
//zz
    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class, args);
    }
    
}
