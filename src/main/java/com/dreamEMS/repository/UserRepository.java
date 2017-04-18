package com.dreamEMS.repository;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.GrantedAuthority;

import com.dreamEMS.model.entity.User;

/**
 * @author Xiaoyue Xiao
 */
public interface UserRepository {

    User selectUserByNo(Long no);

    User selectUserById(String id);
    
    List<User> selectAllUsers();

    Integer insertUser(User user);

    Integer updateUserOnPasswordByNo(User user);
    
    Integer updateUserByNo(User user);

    Integer deleteUserByNo(Long no);
    
    Integer deleteUserById(String id); 

    List<GrantedAuthority> selectAuthority(String id);

	Integer insertAuthority(User user);

	Integer deleteAuthority(Long no);

	Integer deleteAuthorityById(String id);

}
