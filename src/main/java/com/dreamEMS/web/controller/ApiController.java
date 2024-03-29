package com.dreamEMS.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamEMS.model.entity.Nation;
import com.dreamEMS.service.ApiService;

/**
 * @author 
 */
@Controller
public class ApiController {
	
	@Autowired ApiService apiService;
	
	@GetMapping("/nationList")
	public ResponseEntity<?> nationList(
	        @RequestParam(value = "premiumcd", required = false) String premiumcd
    ) {

        //List<Nation> nationList = apiService.getNationList("31");
        List<Nation> nationList = apiService.getNationList(premiumcd);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(nationList);
    }

}
