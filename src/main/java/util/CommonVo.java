package util;

import javax.servlet.http.HttpServletRequest;

public class CommonVo {
	private String s_type;
	private String s_site;
	private String searchword;
	private String sw_categ;
	private String orderCond;
	private int startIdx; //parameter는 아니지만 모든 vo에 필요하기 때문에 여기에 입력 - limit 시작값
	private int page; //사용자가 요청한 페이지
	
	public CommonVo() { //생성자
		//controller에서 BoardVo가 요청되는 순간 ->  page=1로 됨
		page = 1; //사용자가 요청했는데 0페이지일 순 없으니까 1로 초기화
		
	}

	public String getOrderCond() {
		return orderCond;
	}

	public void setOrderCond(String orderCond) {
		this.orderCond = orderCond;
	}

	public int getStartIdx() {
		return startIdx;
	}

	public void setStartIdx(int startIdx) {
		this.startIdx = startIdx;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public String getS_type() {
		return s_type;
	}

	public void setS_type(String s_type) {
		this.s_type = s_type;
	}

	public String getS_site() {
		return s_site;
	}

	public void setS_site(String s_site) {
		this.s_site = s_site;
	}

	public String getSearchword() {
		return searchword;
	}

	public void setSearchword(String searchword) {
		this.searchword = searchword;
	}

	public String getSw_categ() {
		return sw_categ;
	}

	public void setSw_categ(String sw_categ) {
		this.sw_categ = sw_categ;
	}

	
	
}
