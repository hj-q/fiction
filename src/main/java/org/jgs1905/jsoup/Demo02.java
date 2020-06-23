package org.jgs1905.jsoup;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.seimicrawler.xpath.JXDocument;
import org.seimicrawler.xpath.JXNode;

/**
 * 爬取一本小说所有内容
 * @author junki
 * @date 2020年6月21日
 */
public class Demo02 {
	
	public static void main(String[] args) {
		
		String url = "https://read.qidian.com/chapter/zmsq12zNSFhrNWkNCb7tfg2/w-ED_jx91jW2uJcMpdsVgA2";
		
		try {
			getOne(url);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	/**
	 * 爬取一本小说
	 * @param url 小说页面的url地址
	 * @throws IOException 
	 * @throws MalformedURLException 
	 */
	private static void getOne(String url) throws Exception {
		
		// 1.获取页面的dom实例
		JXDocument doc = JXDocument.createByUrl(url);
		
		// 2.获取名称
		String name = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h1/text()").asString();
		
		// 3.获取作者
		String author = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h2/a/text()").asString();
		
		// 4.获取封面
		String imgUrl = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/div[1]/img/@src").asString();
		FileUtils.copyURLToFile(new URL("https:" + imgUrl), new File("e://qidian/" + name + "-" + author + "/img.jpg"));
		
		// 获取所有小说内容
		getOneChapter(url, name, author);
	}

	private static void getOneChapter(String url, String name, String author) throws Exception {
		
		JXDocument doc = JXDocument.createByUrl(url);
		
		// 获取章节标题
		JXNode titleNode = doc.selNOne("//*[@class=\"j_chapterName\"]/span[1]/text()");
		// 最后一页
		if (titleNode == null) {
			System.out.println(name + "-" + author + "->爬取完毕！");
			return;
		}
		String title = titleNode.asString();
		// 获取章节内容
		List<JXNode> contentNodeList = doc.selN("//*[@class=\"read-content j_readContent\"]/p/text()");
		StringBuilder sb = new StringBuilder();
		for (JXNode contentNode : contentNodeList) {
			sb.append(contentNode.asString()).append("\r\n");
		}
		FileUtils.writeStringToFile(new File("e://qidian/" + name + "-" + author + "/" + title + ".txt"), sb.toString(), "utf-8");
			
		// 获取下一章地址
		String nextUrl = "https:" + doc.selNOne("//*[@id=\"j_chapterNext\"]/@href").asString();
		// 递归调用，获取下一章小说内容
		getOneChapter(nextUrl, name, author);
		
	}
	
}
