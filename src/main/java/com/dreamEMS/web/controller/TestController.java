package com.dreamEMS.web.controller;

import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.dreamEMS.service.DllService;

import lombok.extern.apachecommons.CommonsLog;

@CommonsLog
@Controller
public class TestController {
	
	@Autowired DllService dllService;
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
    
}
