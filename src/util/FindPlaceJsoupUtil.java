package util;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;

import dto.DengSiteDto;

public class FindPlaceJsoupUtil {
	public List<DengSiteDto> getDaumSites(String query){
		List<DengSiteDto> list = new ArrayList<>();
		
		try {
		
			Document doc = Jsoup.connect("https://search.daum.net/search?w=tot&DA=YZR&t__nil_searchbox=btn&sug=&sugo=&q="+query).get();
			
			Elements links = doc.select("div.cont_inner a.url_fl");
			Elements names = doc.select("div.cont_inner div.wrap_tit a");
			Elements descs = doc.select("div.cont_inner p.desc");
			
			System.out.println(links.size());
			System.out.println(names.size());
			System.out.println(descs.size());
			
			int size = 10;
			
			if(links.size() <= 10 || names.size() <= 10 || descs.size() <= 10) {
				if(links.size() < names.size()) {
					if(descs.size() < links.size()) {
						size = descs.size();
					} else { 
						size = links.size();
					}
				} else {
					if(descs.size() < names.size()) {
						size = descs.size();
					} else { 
						size = names.size();
					}
				}				
			}
			
			for(int i=0; i<size; i++) {
				DengSiteDto dto = new DengSiteDto();
				System.out.println(links.get(i).text());
				dto.link = links.get(i).text();
				dto.name = names.get(i).text();
				dto.desc = descs.get(i).text();
				
				list.add(dto);
			}
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
		
	}
}


