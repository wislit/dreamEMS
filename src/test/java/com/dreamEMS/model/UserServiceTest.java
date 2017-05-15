package com.dreamEMS.model;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Collection;
import java.util.Iterator;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamEMS.Application;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class UserServiceTest {
      
     @Autowired private  UserService userService;
     
     private User user1;

     //@Before
     public void setup() {
          user1 = new User();
          user1.setId("ems");
          user1.setPassword("ems");
          user1.setAccountNonExpired(true);
          user1.setAccountNonLocked(true);
          user1.setUsername("ems");
          user1.setCredentialsNonExpired(true);
          user1.setEnabled(true);
          user1.setAuthorities(AuthorityUtils.createAuthorityList("USER","ADMIN"));
     }
      
    // @Test
     public void createUserTest() {
          userService.deleteUserById(user1);
          userService.saveUser(user1);
          User user = userService.getUserById(user1.getId()).get() ;
          assertThat(user.getId(), is(user1.getId()));
          
          PasswordEncoder passwordEncoder = userService.passwordEncoder();
          assertThat(passwordEncoder.matches("pass1", user.getPassword()), is(true));
 
          Collection<? extends GrantedAuthority> authorities1 = user1.getAuthorities();
          Iterator<? extends GrantedAuthority> it = authorities1.iterator();
          Collection<GrantedAuthority> authorities = (Collection<GrantedAuthority>) user.getAuthorities();
          while (it.hasNext()) {
               GrantedAuthority authority = it.next();
               assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
          }
     }

}
