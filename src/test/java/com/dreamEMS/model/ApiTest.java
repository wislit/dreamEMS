package com.dreamEMS.model;

import javax.validation.Validator;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamEMS.Application;
import com.dreamEMS.model.entity.EmsTotProcCmd;
import com.dreamEMS.service.ApiService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class ApiTest {
      
	//@Qualifier("localValidatorFactoryBean")
	@Autowired
	private Validator validator;
	@Autowired
	private ApiService apiService;
	
     @Test
     public void getEmsTotProcCmd(){
    	 
    	 EmsTotProcCmd emsTotProcCmd = apiService.getEmsTotProcCmd("31", "CN", 234, "N", 0, "ee");
    	 System.out.println(emsTotProcCmd);
    	 
     }
     
     
}
