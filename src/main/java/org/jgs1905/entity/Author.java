package org.jgs1905.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 作者实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Author {
	
	private int id;
	
	private String  name;
	
	private String  password;
	
}
