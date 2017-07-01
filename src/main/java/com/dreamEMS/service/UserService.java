package com.dreamEMS.service;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.dreamEMS.model.entity.User;
import com.dreamEMS.model.entity.UserGroup;

/**
 * @author Xiaoyue Xiao
 */
public interface UserService extends UserDetailsService {
	
	Collection<GrantedAuthority> getAuthorities(String id);

    Optional<User> getUserById(String id);
    
    List<User> getAllUsers();

    boolean saveUser(User user);

    boolean modifyUserOnPasswordById(User user);
    
    boolean modifyUserById(User user);

    boolean deleteUser(Long no);
    
    boolean deleteUserById(User user);

	PasswordEncoder passwordEncoder();

	List<UserGroup> getGroupList();
	boolean modifyUserGroup(UserGroup group);
	boolean saveUserGroup(UserGroup group);
	boolean deleteUserGroup(Long groupId);

}
