package com.dreamEMS.web.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.web.exception.DreamEMSException;
import com.dreamEMS.web.exception.ParameterIllegalException;
import com.dreamEMS.web.exception.ServerInternalErrorException;

import lombok.extern.apachecommons.CommonsLog;

@CommonsLog
@Controller
public class TestController {
	
	@Autowired MessageSource messageSource;
	
    @RequestMapping(value = "/", method=RequestMethod.GET)
    public String home() {
    	Locale locale = LocaleContextHolder.getLocale();
        String message = messageSource.getMessage ("dreamEMS.test", null, locale );
        return "site.index";
    }
    
    @RequestMapping(value = "/login", method=RequestMethod.GET)
    public String login(@RequestParam(value = "error", required=false) boolean error ) {
    	if(error){
    		log.error("error랍니다~");
    	}
        return "site.login";
    }
    
    @RequestMapping(value = "/print", method=RequestMethod.GET)
    public String print() {
        return "site.print";
    }
    
    @RequestMapping(value = "/error/404")
    public String error() {
        return "error.404";
    }
    
    @RequestMapping("/messages/{propertiesName}")
    public void getProperties(@PathVariable String propertiesName, HttpServletResponse response) throws IOException {
           OutputStream outputStream = response.getOutputStream();
           Resource resource = new ClassPathResource("/messages/" + propertiesName + ".properties");
           InputStream inputStream = resource.getInputStream();
          
           List<String> readLines = IOUtils.readLines(inputStream);
           IOUtils.writeLines(readLines, null, outputStream);
          
           IOUtils.closeQuietly(inputStream);
           IOUtils.closeQuietly(outputStream);
    }
    
    @RequestMapping(value = "/{sampleURI}.html", method=RequestMethod.GET)
    public String sample(@PathVariable("sampleURI") String sampleURI){
    	return "sample."+sampleURI; 
    }
    
    @RequestMapping(value = "/greet", method=RequestMethod.GET)
    public ModelAndView greet(@RequestParam(value = "name", required=false, defaultValue="World!")final String name, final Model model) {
    	log.info("Controller has been invoked with Request Parameter name = '" + name + "'.");
        return new ModelAndView("site.greeting", "name", name);
    }

    @RequestMapping(value = "/greet/{name}", method=RequestMethod.GET)
    public ModelAndView greetTwoWays(@PathVariable(value="name") final String name, final Model model) {
        log.info("Controller has been invoked with Path Variable name = '" + name + "'.");
        return new ModelAndView("site.greeting", "name", name);
    }
    
    
    @RequestMapping(value = "/error/1")
    public String error1() {
    	log.info("Throw OrderNotFoundException for unknown order 12345");
		throw new DataIntegrityViolationException(null);
    }
    
    @RequestMapping(value = "/error/2")
    public String error2() {
    	log.info("An invalid value was specified for one of the query parameters in the request URL.");
		throw new ParameterIllegalException();
    }
    
    @RequestMapping(value = "/error/3")
    public String error3() {
    	log.info("The server encountered an internal error. Please retry the request.");
		throw new ServerInternalErrorException();
    }
    
    @RequestMapping(value = "/error/4")
    public String error4() {
    	log.info("The server met an unexpected error. Please contact administrators");
		throw new RuntimeException();
    }
    
    @RequestMapping(value = "/error/5")
    public String error5() {
    	log.info("The server met an unexpected error. Please contact administrators");
    	throw new DreamEMSException(Errors.SERVER_INTERNAL_ERROR, "error 입니다다당오ㅗ옹");
    }
}
