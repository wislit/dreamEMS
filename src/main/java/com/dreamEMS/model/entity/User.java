package com.dreamEMS.model.entity;

import java.io.Serializable;
import java.util.Collection;

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

    
    /**사용자 고유번호
     */
    private Long no;
    /**tt
     */
    private String id;
    private String username;
    private String password;
    
    private boolean enabled;
    private boolean accountNonExpired;
    private boolean credentialsNonExpired;
    private boolean accountNonLocked;
    private Collection<? extends GrantedAuthority> authorities;
    
    
    private String sender = "test";
    private String senderZipCode = "402701";
    private String senderAddr1 = "jaYng-dong 123";
    private String senderAddr2 = "GwangJin, Seoul";
    private String senderTelNo = "010-1234-5678";

}
