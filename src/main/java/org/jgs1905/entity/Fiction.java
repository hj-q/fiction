package org.jgs1905.entity;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 51job岗位实体
 * @author junki
 * @date 2020年6月13日
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Fiction {
	
	private Long id;
	private Long author_id;
	
	
	// 岗位名称
	private String intro;
	private String type;
	
	// 公司名称
	private String  book_name;
	private String  author_name;
	private String  image;
	
	// 地址
	
	
	// 省份
	
	
}
