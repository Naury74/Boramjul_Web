package com.example.demo;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class BestSellerTestApp {

	public static void main(String[] args) {
	
		String url = "http://www.kyobobook.co.kr/bestSellerNew/bestseller.laf?mallGb=KOR&linkClass=A&range=1&kind=0&orderClick=DAa"; //크롤링할 url지정
		Document doc = null;       

		try {
			doc = Jsoup.connect(url).get();
			
			Elements title_contents = doc.select(".title a strong");
            Elements author_contents = doc.select(".author");
            Elements price_contents = doc.select(".book_price");
            Elements ImageGroupList = doc.select(".cover a");
            
            for (int i=0; i<20; i++) {
            	System.out.println(title_contents.get(i).text() +"\t"+ author_contents.get(i).text() +"\t"+ price_contents.get(i).text());
            }
    		
            
		} catch (IOException e) {
			e.printStackTrace();
		}
	
 
//		Iterator<Element> ie1 = element.select(".title a strong").iterator();
//		Iterator<Element> ie2 = element.select(".author").iterator();
//		Iterator<Element> ie3 = element.select(".book_price").iterator();
		
		        
//		while (ie1.hasNext()) {
//			System.out.println(ie1.next().text()+"\t"+ie2.next().text()+"\t"+ie3.next().text());
//		}
//		for(Element el : element.select(".title a strong")) {    //
//
//            System.out.println(el.text());
//		}
		
//		for(Element el : element.select("strong.rank")) {    

//            System.out.println(el.text());

//}
		
	}
}

