package user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import product.ProductService;
import product.ProductVo;

@Controller
public class UserController {

	@Autowired
	UserService userService;
	@Autowired
	ProductService productService;
	
	@GetMapping("user/login.do")
	public String login(HttpServletRequest req, HttpSession sess) {
		String referer = req.getHeader("Referer");
		sess.setAttribute("redirect", referer);
		return "user/login";
	}
	@PostMapping("user/login.do")
	public String loginProcess(UserVo uvo, ProductVo pvo, Model model, HttpServletRequest req, HttpSession sess) {
		if(userService.login(uvo, sess)) {
			model.addAttribute("url", sess.getAttribute("redirect"));
			return "include/return";
		}
		else {
			model.addAttribute("msg", "아이디, 비밀번호를 확인해주세요");
			return "include/return";
		}
	}
	
	@GetMapping("/user/logout.do")
	public String logout(Model model, HttpSession sess, HttpServletRequest req) {
		String referer = req.getHeader("Referer");
		sess.setAttribute("redirect", referer);
		model.addAttribute("url", referer);
		model.addAttribute("msg","로그아웃되었습니다");
		sess.invalidate();
		return "include/return";
	}
	
	@GetMapping("user/regist.do")
	public String join() {
		return "user/regist";
	}
	@PostMapping("user/insert.do")
	public String insert(UserVo vo, HttpServletRequest req) {
		
		int r = userService.insert(vo);
		if(r > 0) {
			req.setAttribute("msg","정상적으로 가입되었습니다");
			req.setAttribute("url","/TProject/index.do");
		}else {
			req.setAttribute("msg","가입오류");			
		}
		
		return "include/return";
	}
	@GetMapping("user/idCheck.do")
	public String idCheck(Model model, @RequestParam String userid) {
		model.addAttribute("result", userService.idCheck(userid));
		return "include/result";
	}
	@GetMapping("/user/mypage.do")
	public String mypage() {
		return "user/mypage";
	}
	
	@GetMapping("/user/searchId.do")
	public String searchId() {
		return "user/searchId";
	}
	@PostMapping("/user/searchId.do")
	public String searchId(Model model, UserVo vo) {
		UserVo uv = userService.searchId(vo);
		model.addAttribute("result",uv == null ? "":uv.getUserid());
		
		return "include/result";
	}
	@GetMapping("/user/searchPwd.do")
	public String searchPwd() {
		return "user/searchPwd";
	}
	@Value("${mail.email}")
	private String mailid;
	@PostMapping("/user/searchPwd.do")
	public String searchPwd(Model model, UserVo vo) {
		UserVo uv = userService.searchPwd(vo, mailid);
		model.addAttribute("result", uv==null ? "" : "ok");
		return "include/result";
	}
	@GetMapping("/user/checkpw.do")
	public String checkPw() {
		return "user/checkedit";
	}
	/*
	@PostMapping("/user/checkpwd.do")
	public String checkPwd(UserVo vo, HttpSession sess, HttpServletRequest req) {
		String userid = ((UserVo)sess.getAttribute("memberInfo")).getUserid();
		vo.setUserid(userid);
		
		int r = userService.pwCheck(vo);
		if(r>0) {
			req.setAttribute("msg", "");
			req.setAttribute("url", "edit.do");
		}
		else {
			req.setAttribute("msg", "비밀번호 불일치");
			req.setAttribute("url", "checkpw.do");
		}
		return "include/return";
	}*/
	@GetMapping("/user/edit.do")
	public String edit(UserVo vo, HttpSession sess, Model model) {
		
		if (sess.getAttribute("memberInfo") != null) {
			String userid = ((UserVo)sess.getAttribute("memberInfo")).getUserid();
			UserVo uv = userService.selectUser(userid);
			model.addAttribute("user", uv);
			return "user/edit";
		} else {
			model.addAttribute("msg", "로그인 해주세요");
			model.addAttribute("url", "login.do");
			return "include/return";
		}
	}
	@PostMapping("/user/update.do")
	public String update(UserVo vo, HttpServletRequest req, HttpSession sess) {
		int r = userService.update(vo);
		
		if(r>0) {
			req.setAttribute("msg", "정상적으로 수정되었습니다."); //result.do에 msg와 url을 포워딩
			req.setAttribute("url", "../product/index.do");
			sess.invalidate();
		}else {
			req.setAttribute("msg", "수정오류"); //result.do에 msg와 url을 포워딩
			req.setAttribute("url", "edit.do");
		}
		return "include/return";
	}
	@GetMapping("/user/delete.do")
	public String delete(UserVo vo, HttpServletRequest req, HttpSession sess) {
		int r = userService.delete((UserVo)sess.getAttribute("memberInfo"));
		System.out.println(r);
		if(r>0) {
			req.setAttribute("msg", "탈퇴 되었습니다."); //result.do에 msg와 url을 포워딩
			req.setAttribute("url", "../index.do");
			sess.invalidate();
		}else {
			req.setAttribute("msg", "오류"); //result.do에 msg와 url을 포워딩
			req.setAttribute("url", "edit.do");
		}
		return "include/return";
	}
}

