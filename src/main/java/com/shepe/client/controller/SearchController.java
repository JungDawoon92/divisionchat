package com.shepe.client.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.shepe.client.biz.division.SearchService;
import com.shepe.client.common.PagingVO;
import com.shepe.client.common.SearchPaging;

@Controller
public class SearchController {
	
	@Autowired
	private SearchPaging searchPaging;
	
	@Autowired
	private SearchService searchService;
	
	@RequestMapping("/search")
	public String search() {
		return "/client/division/search/search";
	}
	
	@RequestMapping("/searchAction")
	public String searchAction(@RequestParam(value="searchValue", required=false) String searchValue, Model model, PagingVO po) {
		
		System.out.println("여기타나?"+searchValue);
		int pager = 1;
		int re_listcount = searchService.getsearch_reCount(searchValue);
		int in_listcount = searchService.getsearch_inCount(searchValue);

		model.addAttribute("re_paging", searchPaging.searchpaging(pager, re_listcount, po, 2));
		model.addAttribute("in_paging", searchPaging.searchpaging(pager, in_listcount, po, 5));
		
		model.addAttribute("search_reList", searchService.getsearch_reListList(pager, searchValue));
		model.addAttribute("search_inList", searchService.getsearch_inListList(pager, searchValue));
		
		return "/client/division/search/search";
		
	}

}