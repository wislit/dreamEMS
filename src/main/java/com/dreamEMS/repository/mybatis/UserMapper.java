package com.dreamEMS.repository.mybatis;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.security.core.GrantedAuthority;

import com.dreamEMS.model.entity.User;
import com.dreamEMS.repository.UserRepository;

/**
 * @author Xiaoyue Xiao
 */
@Mapper
public interface UserMapper extends UserRepository {

	@Override
	User selectUserByNo(@Param("no") Long no); 

	@Override
	User selectUserById(@Param("id") String id);

	@Override
	List<GrantedAuthority> selectAuthority(@Param("id") String id);

	@Override
	Integer insertUser(User user);

	@Override
	Integer deleteUserByNo(@Param("no") Long no);

	@Override
	Integer deleteUserById(@Param("id") String id);

	@Override
	Integer insertAuthority(User user);

	@Override
	Integer deleteAuthority(@Param("id") String id);

	@Override
	List<User> selectAllUsers();

	@Override
	Integer updateUserOnPasswordByNo(User user);

	@Override
	Integer updateUserByNo(User user);
	
	


	
}
