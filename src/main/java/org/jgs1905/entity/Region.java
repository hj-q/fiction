package org.jgs1905.entity;

import lombok.*;

/**
 * 区划实体类
 * @author junki
 * @date 2020年6月18日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Region {
	
	private Long id;
	
	private Long parent_id;
	
	private Long root_id;
	
	private String name;
	
	private String full_name;
	
	private Byte level;
	
}
