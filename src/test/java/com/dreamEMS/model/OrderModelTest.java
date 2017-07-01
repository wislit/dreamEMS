package com.dreamEMS.model;

import java.io.File;
import java.lang.reflect.Array;
import java.util.Arrays;
import java.util.List;
import java.util.Set;

import javax.validation.ConstraintViolationException;
import javax.validation.Validator;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamEMS.Application;
import com.dreamEMS.model.entity.Order;
import com.dreamEMS.service.OrderService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class OrderModelTest {
      
	//@Qualifier("localValidatorFactoryBean")
	@Autowired
	private Validator validator;
	@Autowired
	private OrderService orderService;
	
	
     //@Test
     public void readUserTest() {
    	 
    	 File destFile = new File("D:\\text.xlsx");
    	 orderService.excelUpload(destFile);
       // Validate input
    	 Order order = new Order();
    	 order.setPremiumCd("31");
    	 order.setReceiveName("姚安光");
    	 order.setReceiveTelNo("13172036918");
    	 order.setCountryCd("CN");
    	 order.setReceiveZipCode("08281");
    	 order.setReceiveAddr3("上海市金山区亭林镇林盛路54号");
    	 order.setTotWeight("18800");
    	 order.setContents("Stationery");
    	 order.setValue("49");
    	 
    	 
    	 
    	 
          Set violations = validator.validate(order);
          if (!violations.isEmpty())
            throw new ConstraintViolationException(violations);

          // Perform update
          //User user = extractUserFromUserForm(userForm);
          //userDao.updateUser(user);
          
     }
     
     //@Test
     public void regexSample() {
          final String regex = "[\\p{Alnum}\\p{IsHan}\\p{IsHangul}\\.\\,\\_\\-\\/\\s]{1,35}";
          String useStr = "wwl.ka,sd_h/w u-f";
          System.out.println(useStr.matches(regex));

          String useStr2 = "한글일때";
          System.out.println(useStr2.matches(regex));
          
          String useStr3 = "精选品牌"; //\p{Han} p{IsHan}
          System.out.println(useStr3.matches(regex));
          
     }
     
     //@Test
     public void regexSample2() {
          final String regex = "([\\p{Alnum}\\.\\,\\_\\-\\/\\s]{1,300}|[\\p{IsHan}\\d\\.\\,\\_\\-\\/\\s]{1,140})";
          String useStr = "上海市金山区亭林镇林盛路54号";
          System.out.println(useStr.matches(regex));

          String useStr2 = "sawsfawdawdawr";
          System.out.println(useStr2.matches(regex));
          
          String useStr3 = "한글일때"; //\p{Han} p{IsHan}
          System.out.println(useStr3.matches(regex));
          
     }
     
/*     @Override
     @Secured({"ROLE_EMPLOYEE"})
     @Transactional(readOnly=false, isolation=Isolation.READ_COMMITTED,propagation=Propagation.SUPPORTS)
     public abstract void updateUser(@Valid UserForm userForm) {

       // Perform update
       User user = extractUserFromUserForm(userForm);
       userDao.updateUser(user);
     }*/
      
     //@Test
     public void readAuthorityTest() {
          /*List<GrantedAuthority> authorities = userMapper.selectAuthority("ems");
          Iterator<GrantedAuthority> it = authorities.iterator();
          while (it.hasNext()) {
               GrantedAuthority authority = it.next();
               assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
          }*/

          //assertThat(authorities, hasItems("ADMIN", "USER"));      
            
          //authorities= userMapper.selectAuthority("abc");
          //assertThat(authorities, hasItem("USER"));    
     }
     
     //@Test
     public void validateProperty() {
    	 
    	 Order order = new Order();
    	 order.setPremiumCd("31");
    	 Boolean test = orderService.validateProperty("premiumCd",order);
    	 System.out.println(test);
    }
     
     //@Test
     public void saveOrder(){
    	 Order order = new Order();
    	 order.setPremiumCd("31");
    	 order.setReceiveName("姚安光");
    	 order.setReceiveTelNo("13172036918");
    	 order.setCountryCd("CN");
    	 order.setReceiveZipCode("08281");
    	 order.setReceiveAddr3("上海市金山区亭林镇林盛路54号");
    	 order.setTotWeight("18800");
    	 order.setContents("Stationery");
    	 order.setValue("49");
    	 
    	 boolean rvl = orderService.saveOrder(order);
    	 System.out.println(rvl);
    	 
     }
     
}
