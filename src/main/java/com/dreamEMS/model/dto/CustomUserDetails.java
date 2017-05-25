package com.dreamEMS.model.dto;

import org.apache.commons.lang3.StringUtils;
import org.springframework.security.core.userdetails.UserDetails;

import com.dreamEMS.model.entity.User;

import lombok.Getter;
import lombok.ToString;

/**
 * @author Xiaoyue Xiao
 */
@Getter
@ToString
public class CustomUserDetails extends User implements UserDetails {

    private static final long serialVersionUID = 1702923242319850756L;

    public CustomUserDetails(User user) {
        if (user != null
                && !StringUtils.isBlank(user.getId())
                && !StringUtils.isBlank(user.getPassword())) {
            setNo(user.getNo());
        	setId(user.getId());
        	setUsername(user.getUsername());
            setPassword(user.getPassword());
            setEnabled(user.isEnabled());
            setAccountNonExpired(user.isAccountNonExpired());
            setAccountNonLocked(user.isAccountNonLocked());
            setCredentialsNonExpired(user.isCredentialsNonExpired());
            setSender(user.getSender());
            setSenderAddr1(user.getSenderAddr1());
            setSenderAddr2(user.getSenderAddr2());
            setSenderTelNo(user.getSenderTelNo());
            setSenderZipCode(user.getSenderZipCode());
            //setAuthorities(user.getAuthorities()); 
            //this.authorities = Collections.unmodifiableSet(new HashSet<>(CollectionUtils.emptyIfNull(authorities)));
        } else {
            throw new IllegalArgumentException("Cannot pass null or empty values to constructor");
        }
    }

}
