package org.jgs1905.jsoup;

import java.util.List;

import org.seimicrawler.xpath.JXDocument;
import org.seimicrawler.xpath.JXNode;

public class Test {

	public static void main(String[] args) {
		String  url="https://www.qidian.com/free/all?chanId=21&orderId=&page=1&vip=hidden&style=1&pageSize=20&siteid=1&pubflag=0&hiddenField=1";
		JXDocument doc = JXDocument.createByUrl(url);
		List<JXNode> s = doc.selN("//*[@id=\"free-channel-wrap\"]/div/div/div[1]/div[3]/div[1]/ul/li");
		Demo3 demo3 = new Demo3();
		
		for (JXNode s1 : s) {
			try {
				JXNode url2 = s1.selOne("//a/@href");
				JXNode type = s1.selOne("//a/text()");
				String url3="https:"+url2.asString();
				demo3.getType(url3,type.asString());
			} catch (Exception e) {
				continue;
			}
		}
			
		

	}

}
