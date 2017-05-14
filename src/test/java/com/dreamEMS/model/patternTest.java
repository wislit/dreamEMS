package com.dreamEMS.model;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.dreamEMS.Application;

@RunWith(SpringJUnit4ClassRunner.class)
@SpringBootTest(classes = Application.class)
@WebAppConfiguration
public class patternTest {
      
     //@Test
     public void regexSample() {
          final String regex = "\\;{1,3}$";
          String useStr = "Stationery;;;";
          System.out.println( useStr.replaceAll(regex, "") );

          String useStr2 = "Stationery;;";
          System.out.println( useStr2.replaceAll(regex, "") );

          String useStr3 = "Stationery;"; 
          System.out.println( useStr3.replaceAll(regex, "") );

          String useStr4 = "Stationery;22;;"; 
          System.out.println( useStr4.replaceAll(regex, "") );

          String useStr5 = "Stationery;22;33;"; 
          System.out.println( useStr5.replaceAll(regex, "") );

          String useStr6 = "Stationery;22;333;44";
          System.out.println( useStr6.replaceAll(regex, "") );

     }
     
     @Test
     public void regexSample2() {
    	  
          final String regex = "([\\d]{2,3})-([\\d]{3,4})-([\\d]{4})";
          
          Pattern p = Pattern.compile(regex);
          
          
          String useStr = "010-1234-4566";
          System.out.println( useStr.matches(regex) );
          
          Matcher m = p.matcher(useStr);
          if(m.find())
          {
        	  System.out.println(  m.group(1) );
        	  System.out.println(  m.group(2) );
        	  System.out.println(  m.group(3) );

          }
          
          String useStr2 = "02-1342-3526";
          
          Matcher m2 = p.matcher(useStr2);
          if(m2.find())
          {
        	  System.out.println(  m2.group(1) );
        	  System.out.println(  m2.group(2) );
        	  System.out.println(  m2.group(3) );

          }

     }
     
     
}
