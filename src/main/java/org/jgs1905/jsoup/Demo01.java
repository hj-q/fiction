package org.jgs1905.jsoup;

import java.io.File;
import java.io.IOException;
import java.net.URL;

import org.apache.commons.io.FileUtils;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.junit.Test;
import org.seimicrawler.xpath.JXDocument;

/**
 *	爬虫：
 * 		1.使用程序自动收集网络资源
 * 		2.通常来说，收集的都是公开的资源
 * 	
 * 	技术实现：
 * 		1.主流的语言：java、python、go
 * 		2.主流框架：
 * 				java的weblogic、jsoup、jsoupxpath、seimicrawler
 * 				python的scrapy
 * 
 * 	jsoup：
 * 		1.解析html（将html文本解析成java对象）
 * 			Document doc = Jsoup.connect(url).get();
 * 		2.数据抽取
 * 			1.通过多个方法，链式获取数据，类似js
 * 			2.使用选择器，类似jquery
 * 		3.数据修改
 * 		4.html清理（消除不安全的html内容，防止xss攻击）
 * 	
 * 
 * 
 * @author junki
 * @date 2020年6月13日
 */
public class Demo01 {

	@Test
	public void getDocByUrl() throws IOException {
		String url = "https://read.qidian.com/chapter/zmsq12zNSFhrNWkNCb7tfg2/w-ED_jx91jW2uJcMpdsVgA2";

JXDocument doc = JXDocument.createByUrl(url);
		
		// 2.获取名称
		String name = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h1/text()").asString();
		
		// 3.获取作者
		String author = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h2/a/text()").asString();
		
		// 4.获取封面
		String imgUrl = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/div[1]/img/@src").asString();
		FileUtils.copyURLToFile(new URL("https:" + imgUrl), new File("e://qidian/" + name + "-" + author + "/img.jpg"));
		
	}
	
	
	
}
