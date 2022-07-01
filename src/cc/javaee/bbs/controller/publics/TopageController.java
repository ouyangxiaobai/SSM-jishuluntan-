package cc.javaee.bbs.controller.publics;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.tool.Tool;

/*
 * 公共页面
 * 
 */


@Controller
@RequestMapping("/topage")
public class TopageController {

	//没有权限发帖子提示页面
	@RequestMapping("quanxian.do")
	public String quanxian(HttpServletRequest request) {
		if(Tool.ismobile(request)){
			return "inc/mobilequanxian";
		}else{
			return "inc/quanxian";
		}
	}	
	
	//没有权限发帖子提示页面
	@RequestMapping("ipquanxian.do")
	public String ipquanxian(HttpServletRequest request) {
		if(Tool.ismobile(request)){
			return "inc/mobilequanxian";
		}else{
			return "inc/quanxian";
		}
	}	
}
