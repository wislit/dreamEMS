package com.dreamEMS.web.controller;

import java.net.URI;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.model.dto.Msg;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.service.UserService;

import lombok.extern.apachecommons.CommonsLog;

/**
 * @author 
 */
@CommonsLog
@Controller
@RequestMapping("/user")
public class UserController {
	
	@Autowired UserService userService;
	
	@GetMapping("/home")
    public String home() {
		return "tiles.user.userHome";
    }
	
	@GetMapping
    public ResponseEntity<?> getUsers() {
		
		List<User> users = userService.getAllUsers();

        return ResponseEntity
        		.ok(users);
    }
	
	@PostMapping
    public ResponseEntity<?> postUser(@RequestBody User user) {
		userService.saveUser(user);

       /* URI location = ServletUriComponentsBuilder
                .fromCurrentRequest()
                .path("/{id}")
                .buildAndExpand(book.getId())
                .toUri();*/
		//ResponseEntity.created(new URI("/user/"+newUser.getUserId())).build()
		
		log.info(user);
		 URI location = ServletUriComponentsBuilder
	                .fromCurrentRequest()
	                .path("/{id}")
	                .buildAndExpand(user.getId())
	                .toUri();

        return ResponseEntity.
        		ok(Msg.SAVE_USER);
        		//badRequest().body(Errors.PARAMETER_ILLEGAL_ERROR);
/*                .created(location)
                .body("등록되었습니다");*/
    }
	
	 @PutMapping("/{userId}")
	    public ResponseEntity<?> putUser(@PathVariable Long userId, @RequestBody User user) {
		 
		 userService.modifyUserById(user);
		 
	        return ResponseEntity
	                .status(HttpStatus.OK)
	                .body(user);
	    }
	
	@DeleteMapping
	public ResponseEntity<?> deleteUser(@RequestBody User user) {
		userService.deleteUser(user);
		
		return ResponseEntity
                .noContent()
                .build();
	}

}
