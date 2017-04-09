/**
 * @author min gyeong
 * @since 2017. 4. 7.
 * @version 1.0
 */
package com.dreamEMS.web.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.context.NoSuchMessageException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author min gyeong
 */
public class ExceptionController {
	
	@Autowired
    private MessageSource messageSource;

    public void setMessageSource(MessageSource messageSource) {
        this.messageSource = messageSource;
    }

    @RequestMapping("/error")
    public String exception(Model model,Exception ex,Locale locale,HttpServletRequest httpRequest,HttpServletResponse httpResponse){

        ex.printStackTrace();

        model.addAttribute("templatePath", "exception/exception");
        model.addAttribute("template", "content");
        try{
            model.addAttribute("exceptionMessage",messageSource.getMessage(String.format("exception.body.%s",httpResponse.getStatus()),new Object[]{},locale));
        } catch (NoSuchMessageException e){
            model.addAttribute("exceptionMessage",messageSource.getMessage("exception.body",new Object[]{},locale));
        }
        return "site.error";
    }

}
