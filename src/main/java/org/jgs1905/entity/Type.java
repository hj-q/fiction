package org.jgs1905.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 小说实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Type {
	
	private int id;
	private int hits;
	private String  name;//小说封面图
	
	
	
}
