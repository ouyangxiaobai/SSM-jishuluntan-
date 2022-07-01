package cc.javaee.bbs.controller.user;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Message;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.MessageService;
/*
 * 内部消息板块
 * 
 */
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;


@Controller
@RequestMapping("/user/message")
public class MessageController {
	
	@Autowired
	MessageService messageService;
	
	
	//查询所有
	@RequestMapping("index.do")
	public String index(HttpServletRequest request, Model model,Message message,PageBean<Message> page) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		message.setUseridaccept(sessionuser.getId());
		page = messageService.findpage(message, page);
		model.addAttribute("page", page);
		model.addAttribute("message", message);
		if(Tool.ismobile(request)){
			return "jsp/mobile/user/user-message";
		}else{
			return "jsp/index/user/user-message";
		}
	}
	
	@RequestMapping("findbyid.do")
	public String findbyid(HttpServletRequest request, Model model,Message message) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		message.setIsread("1");
		message.setUseridaccept(sessionuser.getId());
		messageService.update(message);
		message=messageService.findbyid(message);
		model.addAttribute("message", message);
		messageService.find(message);
		int count=messageService.findisreadcount(sessionuser.getId());
		sessionuser.setIsreadcount(count);
		request.getSession().setAttribute(PublicStatic.USER, sessionuser);
		return "jsp/index/user/messageinfo";
	}
	@ResponseBody
	@RequestMapping("allread.do")
	public String allread(HttpServletRequest request, Model model,Message message) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		message.setIsread("1");
		message.setUseridaccept(sessionuser.getId());
		messageService.update(message);
		messageService.find(message);
		int count=messageService.findisreadcount(sessionuser.getId());
		sessionuser.setIsreadcount(count);
		request.getSession().setAttribute(PublicStatic.USER, sessionuser);
		return "1";
	}
	
	

}
