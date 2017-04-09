package com.dreamEMS.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author 
 */
@Controller
@RequestMapping("/ship")
public class ShipController {
	
	@GetMapping("/home")
    public String home() {
		return "tiles.ship.shipHome";
    }
	@GetMapping
    public String ship() {
		return "tiles.ship.ship";
    }
	@GetMapping("/excel")
    public String excel() {
		return "tiles.ship.shipExcel";
    }

}
