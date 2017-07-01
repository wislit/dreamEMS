package com.dreamEMS.model.entity;

import java.io.Serializable;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
import lombok.experimental.Accessors;

/** 사용자 그룹 클래스
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
public class UserGroup implements Serializable {

    private static final long serialVersionUID = 7698862379923111158L;

    
    private Long groupId;
    private String groupName;
    private boolean status;
    private int seq;

}
