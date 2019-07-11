package org.yht.controller.bbs;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.yht.domain.test01.FoodParam;
import org.yht.domain.test01.FoodVo;

import org.yht.service.bbs.FoodService;

@Controller
public class FoodController {
	
	@Resource(name="FoodService")
	FoodService foodService;
	
	
	@RequestMapping(value = "foodBbsList.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String foodBbsList(Model model, FoodParam param) {
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = (sn) * param.getRecordCountPerPage() + 1;
		int end = (sn+1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<FoodVo> foodBbsList = foodService.getFoodList(param);
		
		// 글의 총 갯수
		int totalRecordCount = foodService.getFoodCount(param);
		
		System.out.println("foodBbsList:" + foodBbsList.size());
		
		model.addAttribute("foodBbsList", foodBbsList);
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("f_category", param.getF_category());
		model.addAttribute("f_keyword", param.getF_keyword());
		
		return "foodBbs/foodBbsList";
		
		
	}
	
	@RequestMapping(value = "writeFood.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeFood() {
		
			System.out.println("notice 글쓰기로 이동");
		
		return "foodBbs/foodWrite";
	}
	
	@RequestMapping(value = "writeFoodAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String writeFoodAf(FoodVo fv) {
		
			
		
			System.out.println("food 글쓰기 등록 --" + fv.toString());
			String src = "";
/*			boolean isS = foodService.writeFood(nv);
			
			if(isS) {
				System.out.println("notice 글쓰기 완료!");
				src = "redirect:/noticeBbsList.do";
				
			}else {
				System.out.println("notice 글쓰기 실패!");
				src = "redirect:/writeNotice.do";
			}*/
		
			return src;
	}
	

}