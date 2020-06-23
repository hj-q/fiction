package org.jgs1905.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 章节实体类
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Section {
	
	private Long id;
	private Long fiction_id;
	
	// 岗位名称
	private String content;
	
	// 公司名称
	private String  section_name;
	private String  fiction_name;
	
	
	// 地址
	
	
	// 省份
	
	
}
