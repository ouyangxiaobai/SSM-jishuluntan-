package cc.javaee.bbs.controller.index;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.JifenService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 登陆
 * 
 */
@Controller
@RequestMapping("/login")
public class LoginController {

	@Autowired
	UserService userService;
	
	@Autowired
	JifenService jifenService;
	
	
	private static Logger log = Logger.getLogger(LoginController.class);
	
	//修改或者新增
	@RequestMapping("index.do")
	public String toindex(HttpServletRequest request,HttpServletResponse response,Model model,String pathlocation) {
		if(Tool.isstopip(request, response, 3)){
			return null;
		}
		model.addAttribute("pathlocation", pathlocation);
		Cookie[] cookies = request.getCookies();
		if(cookies!=null){
			for(Cookie cookie : cookies){
			    String name=cookie.getName();
			    if("javaeelogin".equals(name)){
			    	String value=cookie.getValue();
			    	User user=new User();
			    	user.setCookieid(value);
			    	List<User> list = userService.find(user);
			    	if(list.size()>0){
			    		User usersession=list.get(0);
			    		request.getSession().setAttribute(PublicStatic.USER, usersession);
			    		Jifen jifen=new Jifen();
						jifen.setFenshu(PublicStatic.JIFEN_LOGIN);
						jifen.setUserid(usersession.getId());
						jifen.setType("104");
						jifen.setContent("每天第一次登录您获得"+PublicStatic.JIFEN_LOGIN+"积分");
						int findnowcount = jifenService.findnowcount(jifen);
						if(findnowcount==0){
							jifenService.insert(jifen);
						}
						Cookie c = new Cookie("login",usersession.getCookieid());
						c.setMaxAge(60*60*24*14);
						c.setPath("/");
						response.addCookie(c);
						if(pathlocation!=null&&!"".equals(pathlocation)){
							try {
								response.sendRedirect(pathlocation);
							} catch (IOException e) {
								e.printStackTrace();
							}
						}else{
							return "redirect:/";
						}
			    	}
			    }
			}
		}
		if(Tool.ismobile(request)){
			return "jsp/mobile/login";
		}else{
			return "jsp/index/login";
		}
	}
	//登录
	@ResponseBody
	@RequestMapping("login.do")
	public Map<String, String> login(HttpServletRequest request,HttpServletResponse response,  User user,String pathlocation,String yanzhengma) {
		if(Tool.isstopip(request, response, 3)){
			return null;
		}
		Map<String, String> map=new HashMap<String, String>();
		HttpSession session = request.getSession(true); 
		String yanzhengmasession=(String)session.getAttribute("yanzhengma");
		String flag="0";
		String msg="0";
		if(!yanzhengma.equalsIgnoreCase(yanzhengmasession)){
			flag="77";
			msg="验证码错误！";
		}else{
			flag=userService.login(user,request);
			if(pathlocation!=null&&!"".equals(pathlocation)){
				map.put("pathlocation", pathlocation);
			}else{
				map.put("pathlocation", request.getContextPath()+"/user/index.do");
			}
			if(flag.equals("1")){
				User usersession=(User)request.getSession().getAttribute(PublicStatic.USER);
				Jifen jifen=new Jifen();
				jifen.setFenshu(PublicStatic.JIFEN_LOGIN);
				jifen.setUserid(usersession.getId());
				jifen.setType("104");
				jifen.setContent("每天第一次登录您获得"+PublicStatic.JIFEN_LOGIN+"积分");
				int findnowcount = jifenService.findnowcount(jifen);
				if(findnowcount==0){
					jifenService.insert(jifen);
				}
				if(user.isIsremember()==true){
					Cookie cookie = new Cookie("javaeelogin",usersession.getCookieid());
					cookie.setMaxAge(60*60*24*14);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}
		map.put("flag", flag);
		map.put("msg", msg);
		return map;
	}
}
