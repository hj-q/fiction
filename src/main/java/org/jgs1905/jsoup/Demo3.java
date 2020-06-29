package org.jgs1905.jsoup;

import java.awt.image.TileObserver;
import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.net.URL;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.filefilter.RegexFileFilter;
import org.jgs1905.dao.AuthorDao;
import org.jgs1905.dao.FictionDao;
import org.jgs1905.dao.SectionDao;
import org.jgs1905.entity.Author;
import org.jgs1905.entity.Fiction;
import org.jgs1905.entity.Job;
import org.jgs1905.entity.Section;
import org.jgs1905.service.FictionService;
import org.junit.Test;
import org.seimicrawler.xpath.JXDocument;
import org.seimicrawler.xpath.JXNode;

/**
 * 爬取一本小说所有内容
 * 
 * @author junki
 * @date 2020年6月21日
 */
public class Demo3 {
	static SectionDao sectionDao = new SectionDao();
	
	static FictionService fictionService = new FictionService();
	static AuthorDao authorDao = new AuthorDao();
	public  void getType(String url, String type){
		
		ExecutorService newCachedThreadPool = Executors.newCachedThreadPool();
		for (int i = 1; i <= 1; i++) {
			int pageNum = i;
			newCachedThreadPool.submit(new Thread(() -> {
				 

				
					try {
						getOne(url,type);
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					
			
			}));
			continue;
			}

		
			

	}

	private static void getOne(String url, String type) throws Exception {

		// 1.获取页面的dom实例
		JXDocument doc = JXDocument.createByUrl(url);

		StringBuilder sb = new StringBuilder();

		List<JXNode> s = doc.selN("//*[@id=\"free-channel-wrap\"]/div/div/div[2]/div[2]/div/ul/li");

		for (JXNode s1 : s) {
			try {
				JXNode name = s1.selOne("//li/div[2]/h4/a/text()");
				JXNode name2 = s1.selOne("//li/div[2]/h4/a/@href");
				JXNode author = s1.selOne("//li/div[2]/p[1]/a[1]/text()");
				JXNode intro = s1.selOne("//li/div[2]/p[2]/text()");
				JXNode cover = s1.selOne("//li/div[1]/a/img/@src");
				FileUtils.copyURLToFile(new URL("https:" + cover.asString()),
						new File("C:/Users/Administrator.USER-20181207NZ/git/fiction/src/main/webapp/upload/fiction_images/" + name + "-" + author + "img.jpg"));
				
				String imgae_url="upload/fiction_images/" + name + "-" + author + "img.jpg";
				Author author2 = Author.builder().name(author.asString()).build();
				authorDao.insert(author2);
				Author author3 = authorDao.selectIdByAuthor_name(author2);
				Long author_id = author3.getId();
				int type_id=0;
				switch (type) {
				case "玄幻":type_id=1;
					break;
				case "奇幻":type_id=2;
					break;
				case "武侠":type_id=3;
					break;
				case "仙侠":type_id=4;
					break;
				case "都市":type_id=5;
					break;
				case "军事":type_id=6;
					break;
				case "历史":type_id=7;
					break;
				case "游戏":type_id=8;
					break;
				case "科幻":type_id=9;
					break;
				case "悬疑":type_id=10;
					break;
				case "其他":type_id=11;
					break;

				default:
					break;
				}
				Long hits=1L;
				Fiction fiction=Fiction.builder().intro(intro.asString())
						.book_name(name.asString())
						.author_name(author.asString())
						.author_id(author_id)
						.type_id(type_id)
						.image(imgae_url)
						.hits(hits)
						.build();
				fictionService.addFiction(fiction);
				Long fictionId=fictionService.getIdByBookName(name.asString());
				String two = getTwo("https:" + name2);
				getThree(two,fictionId);
				
				sb.setLength(0);
				sb.append(name).append("\r\n").append(author).append("\r\n").append(intro);

				

				FileUtils.writeStringToFile(new File("f://qidian/" + name + "-" + author + "/" + ".txt"), sb.toString(),
						"utf-8");

			} catch (Exception e) {
				continue;
			}}
			
	}

	private static void getThree(String two,Long fiction_id) throws Exception {
		// 1.获取页面的dom实例
		JXDocument doc = JXDocument.createByUrl(two);

		// 2.获取名称
		String name = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h1/text()").asString();

		// 3.获取作者
		String author = doc.selNOne("//*[@id=\"j_textWrap\"]/div/div/h2/a/text()").asString();

		// 获取所有小说内容
		getOneChapter(two, name, author,fiction_id);
	}

	private static void getOneChapter(String url, String name, String author,Long fiction_id) throws Exception {

		JXDocument doc = JXDocument.createByUrl(url);
		JXNode timeJxNode = doc.selNOne("//*[@class=\"j_updateTime\"]/text()");
	      String timDate=timeJxNode.asString();
	      SimpleDateFormat sdf=new SimpleDateFormat("yyyy.MM.dd HH:mm");
	      
	      java.util.Date date=sdf.parse(timDate);
		// 获取章节标题
		JXNode titleNode = doc.selNOne("//*[@class=\"j_chapterName\"]/span[1]/text()");
		// 最后一页
		if (titleNode == null) {
			System.out.println(name + "-" + author + "->爬取完毕！");
			return;
		}
		String title = titleNode.asString();
		title = title.replaceAll("[\\pP\\p{Punct}]", "");
		// 获取章节内容
		List<JXNode> contentNodeList = doc.selN("//*[@class=\"read-content j_readContent\"]/p");
		StringBuilder sb = new StringBuilder();
		for (JXNode contentNode : contentNodeList) {
			sb.append(contentNode);
		}
		
		Section job = Section.builder().section_name(title)
				.content(sb.toString())
				.fiction_name(name)
				.fiction_id(fiction_id)
				.time(date)
				.build();
	
	    sectionDao.insert(job);
		FileUtils.writeStringToFile(new File("f://qidian/" + name + "-" + author + "/" + title + ".txt"), contentNodeList.toString(),
				"utf-8");

		// 获取下一章地址
		String nextUrl = "https:" + doc.selNOne("//*[@id=\"j_chapterNext\"]/@href").asString();
		// 递归调用，获取下一章小说内容
		getOneChapter(nextUrl, name, author,fiction_id);

	}

	public static String getTwo(String url) {
		JXDocument doc = JXDocument.createByUrl(url);
		JXNode selNOne = doc.selNOne("//*[@id=\"readBtn\"]/@href");
		String sel = "https:" + selNOne;
		return sel;
	}
}
