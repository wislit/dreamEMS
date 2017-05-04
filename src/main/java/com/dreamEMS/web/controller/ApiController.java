package com.dreamEMS.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.dreamEMS.model.entity.Nation;
import com.dreamEMS.service.ApiService;
import org.springframework.web.bind.annotation.RequestParam;

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

        List<Nation> nationList = apiService.getNationList(premiumcd);

        return ResponseEntity
                .status(HttpStatus.OK)
                .body(nationList);
    }

}
