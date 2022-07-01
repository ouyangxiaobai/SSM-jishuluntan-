package cc.javaee.bbs.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.JifenService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 发帖页面
 * 
 */
@Controller
@RequestMapping("/user/jifen")
public class JifenContriller {
	
	@Autowired
	JifenService jifenService;
	@Autowired
	UserService userService;
	
	//跳转发帖页面
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,Jifen jifen,PageBean<Jifen> page) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		jifen.setUserid(sessionuser.getId());
		page = jifenService.findpage(jifen, page);
		model.addAttribute("page", page);
		model.addAttribute("jifen", jifen);
		
		sessionuser = userService.findbyid(sessionuser);
		request.getSession().setAttribute(PublicStatic.USER,sessionuser);
		if(Tool.ismobile(request)){
			return "jsp/mobile/user/user-jifen";
		}else{
			return "jsp/index/user/user-jifen";
		}
	}
	
	
	
	
}
