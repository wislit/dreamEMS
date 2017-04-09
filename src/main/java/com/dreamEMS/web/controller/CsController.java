package com.dreamEMS.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 
 */
@Controller
@RequestMapping("/cs")
public class CsController {
	
	@GetMapping("/home")
    public String home() {
		return "tiles.cs.csHome";
    }

}
