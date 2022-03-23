package product;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import util.CommonUtil;

@Controller
public class ProductController {

	@Autowired
	ProductService service;
	
	@GetMapping("/product/index.do")
	public String index(Model model, ProductVo vo, HttpServletRequest request, HttpSession sess) {
		// delete out-of-date items
		List<ProductVo> list_f = service.selectAll(vo);
		Long datetime = System.currentTimeMillis();
		Timestamp now = new Timestamp(datetime);
		String pid = "";
		for(int i=0; i < list_f.size(); i++) {
		    if(list_f.get(i).getTimeleft() < 1) {
		    	//System.out.println("종료 : "+list_f.get(i).getItemid());
		    	pid=list_f.get(i).getItemid();
		    	service.delete(pid);
		    	System.out.println("삭제="+pid);
		    }
		}
		// saving primary_category
		String primary_category = request.getParameter("primary_category");
		if(primary_category != null) { 
			primary_category.replaceAll("%20", " ");
			vo.setPrimary_category(primary_category);
		} else
			vo.setPrimary_category("");
		
		// saving all primary_categories
		model.addAttribute("primaryCategory_list", service.selectPCList());
		
		// saving all secondary_categories
		// setSecondaryCategory_list(service.selectSCList(request.getParameter("primary_category")));
		
		// saving secondary_category
		String secondary_category = request.getParameter("secondary_category");
		if(secondary_category != null) 
			vo.setSecondary_category(secondary_category);
		else
			vo.setSecondary_category("");
		// saving orderCondition
		String orderCondition = request.getParameter("orderCond");
		if(orderCondition != null) 
			vo.setOrderCond(orderCondition);
		else
			vo.setOrderCond("");
		
		// pagination
		int totCount = service.count(vo);
		int totPage = totCount/20;
		if(totCount % 20 > 0) totPage++;
		
		int startIdx = (vo.getPage()-1)*20;
		vo.setStartIdx(startIdx);
		
		// list of products (primary_category, orderCondition applied)
		vo.setPage_boolean(0);
		List<ProductVo> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		// sending pagination variables
		model.addAttribute("totCount",totCount);
		model.addAttribute("totPage",totPage);
		model.addAttribute("pageArea", CommonUtil.getPageArea(vo, "index.do", vo.getPage(), totPage, 20));
		
		// finding max_price
		ArrayList price_list = new ArrayList<Double>();
		vo.setPage_boolean(1);
		List<ProductVo> list2 = service.selectList(vo);
		for(int i=0; i < list2.size(); i++) {
			price_list.add(list2.get(i).getPrice());
		}
		model.addAttribute("max_price", Collections.max(price_list));
		
		return "product/index";
	}
	
	@GetMapping("/product/detailPage.do")
	public String detail(Model model, ProductVo vo, @RequestParam String itemid) {
		model.addAttribute("data", service.view(itemid));
		return "product/detailPage";
	}
	
	
}