package com.dreamEMS.service;

import java.util.Collection;
import java.util.Optional;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.password.PasswordEncoder;

import com.dreamEMS.model.entity.User;

/**
 * @author Xiaoyue Xiao
 */
public interface UserService extends UserDetailsService {
	
	Collection<GrantedAuthority> getAuthorities(String id);

    Optional<User> getUserById(String id);

    boolean saveUser(User user);

    boolean modifyUserOnPasswordById(User user);

    boolean deleteUser(User user);

	PasswordEncoder passwordEncoder();

}
