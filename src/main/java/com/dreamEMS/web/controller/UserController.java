package com.dreamEMS.web.controller;

import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.dreamEMS.model.dto.Errors;
import com.dreamEMS.model.dto.Msg;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.model.entity.UserGroup;
import com.dreamEMS.service.UserService;
import com.dreamEMS.web.exception.DreamEMSException;

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
    public ResponseEntity<?> getUsers(@RequestParam Map param) {
		
		List<User> users = userService.getAllUsers(param );

        return ResponseEntity.ok(users);
    }
	
	@PostMapping
    public ResponseEntity<?> postUser(@Valid @RequestBody User user) {
		
		if(user.getId().equals("err")) throw new DreamEMSException(Errors.PARAMETER_ILLEGAL_ERROR);
		userService.saveUser(user);
		log.info(user);
        
		return ResponseEntity.ok(Msg.SAVE_USER);
    }
	
	 @PutMapping("/{userId}")
	    public ResponseEntity<?> putUser(@PathVariable Long userId, @RequestBody User user) {
		 
		 userService.modifyUserById(user);
		 
	     return ResponseEntity.ok(Msg.MODIFY_USER);
	    }
	 
	 @PostMapping("resetPwd")
	    public ResponseEntity<?> resetPassored(@RequestBody User user) {
			
		 log.info(user);
		 userService.modifyUserOnPasswordById(user);
 
		 return ResponseEntity.ok(Msg.RESET_USER);
	    }
	
	@DeleteMapping("/{userNo}")
	public ResponseEntity<?> deleteUser(@PathVariable Long userNo) {
		
		userService.deleteUser(userNo);
		
		return ResponseEntity.ok(Msg.REMOVE_USER);
	}
	
	@GetMapping("/group")
    public ResponseEntity<?> getUserGroup() {
		List<UserGroup> groupList = userService.getGroupList();
        return ResponseEntity.ok(groupList);
    }
	
	@PostMapping("/group")
    public ResponseEntity<?> postUserGroup(@RequestBody UserGroup group) {
		
		userService.saveUserGroup(group);
		log.info(group);
        
		return ResponseEntity.ok(group);
    }
	
	 @PutMapping("/group/{groupId}")
	    public ResponseEntity<?> putUserGroup(@PathVariable Long groupId, @RequestBody UserGroup group) {
		 
		 userService.modifyUserGroup(group);
		 
	     return ResponseEntity.ok(Msg.SUCCESS);
	    }
	 
	 @DeleteMapping("/group/{groupId}")
		public ResponseEntity<?> deleteUserGroup(@PathVariable Long groupId) {
			
			boolean ret = userService.deleteUserGroup(groupId);
			
			Msg msg = ret ? Msg.SUCCESS : Msg.FAIL;
			
			return ResponseEntity.ok(msg);
		}
	 
	 @GetMapping("/groupHome")
	    public String groupHome() {
			return "blank.user.groupHome";
	    }
	 
	 
	 
	 

}
