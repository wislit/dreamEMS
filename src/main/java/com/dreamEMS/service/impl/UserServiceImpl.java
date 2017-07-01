package com.dreamEMS.service.impl;

import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.dreamEMS.model.dto.CustomUserDetails;
import com.dreamEMS.model.entity.User;
import com.dreamEMS.model.entity.UserGroup;
import com.dreamEMS.repository.UserRepository;
import com.dreamEMS.service.UserService;

/**
 * @author Xiaoyue Xiao
 */
@Service
@Transactional
public class UserServiceImpl implements UserService {


	private final UserRepository userRepository;
    private PasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

    @Override
    public List<UserGroup> getGroupList() {
    	return userRepository.selectAllGroup();
    }
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
	public List<User> getAllUsers(Map where) {
    	return userRepository.selectAllUsers(where);
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
        if (user.getAuthorities() == null) {
        	user.setAuthorities(AuthorityUtils.createAuthorityList("USER"));
		}
        boolean rvl = userRepository.insertUser(user) > 0 &
        			userRepository.insertAuthority(user) > 0;
        return rvl;
    }

    @Override
    public boolean modifyUserOnPasswordById(User user) {
    	
    	String rawPassword = user.getPassword();
        String encodedPassword = new BCryptPasswordEncoder().encode(rawPassword);
        user.setPassword(encodedPassword);
    	
        return userRepository.updateUserOnPasswordByNo(user) > 0;
    }
    
    @Override
    public boolean modifyUserById(User user) {
    	
        return userRepository.updateUserByNo(user) > 0;
    }

    @Override
    public boolean deleteUser(Long no) {
    	boolean rvl = userRepository.deleteAuthority(no) > 0 & 
    			userRepository.deleteUserByNo(no) > 0;
        return  rvl;
    }
    
    @Override
    public boolean deleteUserById(User user) {
    	boolean rvl = userRepository.deleteAuthorityById(user.getId()) > 0 & 
    			userRepository.deleteUserById(user.getId()) > 0;
        return  rvl;
    }
	@Override
	public boolean modifyUserGroup(UserGroup group) {
		return userRepository.updateUserGroup(group)> 0;
	}
	@Override
	public boolean saveUserGroup(UserGroup group) {
		return userRepository.insertUserGroup(group) > 0;
	}
	@Override
	public boolean deleteUserGroup(Long groupId) {
		
		Map where = new HashMap<>();
		where.put("groupId", groupId );
		List<User> user = userRepository.selectAllUsers(where);
		if (user.size() > 0) {
			return false;
		}
		
		return userRepository.deleteUserGroup(groupId) > 0;
	}
    
    

}
