package com.dreamEMS.model;

import static org.hamcrest.CoreMatchers.hasItem;
import static org.hamcrest.CoreMatchers.hasItems;
import static org.hamcrest.CoreMatchers.is;
import static org.junit.Assert.assertThat;

import java.util.Iterator;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamEMS.Application;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.repository.mybatis.UserMapper;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class UserMapperTest {
      
     @Autowired UserMapper userMapper;
      
     @Test
     public void readUserTest() {
          User user = userMapper.selectUserById("ems");
          assertThat("ems", is(user.getId()));
          assertThat("YCU", is(user.getUsername()));
          assertThat("1234", is(user.getPassword()));
     }
      
     @Test
     public void readAuthorityTest() {
          List<GrantedAuthority> authorities = userMapper.selectAuthority("ems");
          Iterator<GrantedAuthority> it = authorities.iterator();
          while (it.hasNext()) {
               GrantedAuthority authority = it.next();
               assertThat(authorities, hasItem(new SimpleGrantedAuthority(authority.getAuthority())));
          }

          //assertThat(authorities, hasItems("ADMIN", "USER"));      
            
          //authorities= userMapper.selectAuthority("abc");
          //assertThat(authorities, hasItem("USER"));    
     }
}
