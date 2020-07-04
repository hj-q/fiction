package org.jgs1905.entity;

import java.util.Date;

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
	
	private int id;
	private int fiction_id;

	private String content;

	private String author_name;
	private String name;//小说类型名

	private String  section_name;
	private String  fiction_name;
	private Date  time;
	

}
