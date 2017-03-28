package com.dreamEMS.service.impl;

import java.util.Collection;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import com.dreamEMS.model.dto.CustomUserDetails;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.repository.UserRepository;
import com.dreamEMS.service.UserService;

/**
 * @author Xiaoyue Xiao
 */
@Service
public class UserServiceImpl implements UserService {

    private final UserRepository userRepository;
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Autowired
    public UserServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }
    
    @Override
    public PasswordEncoder passwordEncoder() {
         return this.passwordEncoder;
    }

    @Override
    public UserDetails loadUserByUsername(String id) throws UsernameNotFoundException {
        User user = userRepository.selectUserById(id);
        if (user == null) {
            throw new UsernameNotFoundException("Could not find the user '" + id + "'");
        }
        CustomUserDetails userDetails = new CustomUserDetails(user);
        userDetails.setAuthorities(getAuthorities(user.getId()));
        return userDetails;
    }
    
    @Override
	public Collection<GrantedAuthority> getAuthorities(String id) {
        Collection<GrantedAuthority> authorities = userRepository.selectAuthority(id);
        return authorities;
	}

	@Override
    public Optional<User> getUserById(String id) {
		User user = userRepository.selectUserById(id);
		user.setAuthorities(userRepository.selectAuthority(user.getId())) ;
        return Optional.ofNullable(user);
    }

    @Override
    public boolean saveUser(User user) {
    	String rawPassword = user.getPassword();
        String encodedPassword = new BCryptPasswordEncoder().encode(rawPassword);
        user.setPassword(encodedPassword);
        boolean rvl = userRepository.insertUser(user) > 0 &
        			userRepository.insertAuthority(user) > 0;
        return rvl;
    }

    @Override
    public boolean modifyUserOnPasswordById(User user) {
        return userRepository.updateUserOnPasswordByNo(user) > 0;
    }

    @Override
    public boolean deleteUser(User user) {
    	boolean rvl = userRepository.deleteUserByNo(user.getNo()) > 0 & 
    			userRepository.deleteAuthority(user.getId()) > 0;
        return  rvl;
    }

}
