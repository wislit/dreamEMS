package com.dreamEMS.model.entity;

import java.io.Serializable;
import java.util.Collection;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.security.core.GrantedAuthority;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/** 사용자 클래스
 * @author min gyeong
 */
@Accessors(chain = true)
@NoArgsConstructor
@Getter
@Setter
@ToString
/*@FieldMatch.List({
	 @FieldMatch(first = "password", second = "confirmPassword"),
	})*/
public class User implements Serializable {

    private static final long serialVersionUID = 7698862379923111158L;

    
    private Long no;
    
    @NotEmpty
    private String id;
    @NotEmpty
    private String username;
    @NotEmpty
    private String password;
    
    private boolean enabled;
    private boolean accountNonExpired;
    private boolean credentialsNonExpired;
    private boolean accountNonLocked;
    private Collection<? extends GrantedAuthority> authorities;
    
    
    @NotEmpty
    private String sender;
    @NotEmpty
    private String senderZipCode;
    @NotEmpty
    private String senderAddr1;
    @NotEmpty
    private String senderAddr2;
    @NotEmpty
    private String senderTelNo;
    
    private Long groupId;
    private String groupName;

}
