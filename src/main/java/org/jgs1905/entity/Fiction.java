package org.jgs1905.entity;

import java.util.List;

import cn.afterturn.easypoi.excel.annotation.Excel;
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
	@Excel(name = "简介")
	private String intro;//简介
	
	private int type_id;//类型
	@Excel(name = "书名")
	private String  book_name;
	private String  name;//类型名
	@Excel(name = "作者")
	private String  author_name;
	private Long  hits;
	
	private String  image;//小说封面图

	private List<Comment> comments;

	
	
}
