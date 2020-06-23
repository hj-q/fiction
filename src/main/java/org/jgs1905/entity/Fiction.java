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
public class Fiction {
	
	private Long id;
	
	private Long author_id;
	
	private String intro;//简介
	
	private String type;//类型
	
	private String  book_name;
	
	private String  author_name;
	
	private String  image;//小说封面图
	
	
}
