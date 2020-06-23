package org.jgs1905.entity;

import lombok.*;

/**
 * 
 * 	用户实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class User {
	
	private Long id;
	
	private String nickname;
	
	private String username;
	
	private String password;
	
	private Long region_id;
	
	private String photo;
	
}
