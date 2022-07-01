package cc.javaee.bbs.controller.publics;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.Pic;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
import cc.javaee.bbs.tool.thread.IndexThread;
/*
 * 公共的操作
 * 
 */
@Controller
@RequestMapping("/common")
public class CommonController {
	
	@Autowired
	UserService userService;
	
	private static Logger log = Logger.getLogger(CommonController.class);

	//每五秒钟调用一次，更新在线时间
	@ResponseBody
	@RequestMapping("updateuseronlinetime.do")
	public void updateuseronlinetime(HttpServletRequest request) {
		User user=(User) request.getSession().getAttribute(PublicStatic.USER);
		if(user!=null){
			Map<Integer, Long> map= (Map<Integer, Long>)request.getSession().getServletContext().getAttribute("updateuseronlinetime");
			if(map==null){
				map=new HashMap<Integer, Long>();
			}
			long l=System.currentTimeMillis();
			if(map.get(user.getId())==null||(l-map.get(user.getId())>4*1000)){
				userService.updateuseronlinetime(user);
				map.put(user.getId(), l);
				request.getSession().getServletContext().setAttribute("updateuseronlinetime", map);
			}
		}
	}
	
	//保存发帖数据
		@RequestMapping("topcorm.do")
		public void add(HttpServletRequest request,HttpServletResponse response,String ismobile,String pathlocation) {
			if(ismobile.equals("1")){
				request.getSession().setAttribute("ismobile", true);
			}else{
				request.getSession().setAttribute("ismobile", false);
			}
			try {
				response.sendRedirect(pathlocation);
			} catch (IOException e) {
				e.printStackTrace();
			}
//			return "redirect:"+pathlocation;
		}
		//跳转页面  http://bbs.javaee.cc/common/tourl.do?url=http://baidu.com
		@RequestMapping("tourl.do")
		public void tourl(HttpServletRequest request,HttpServletResponse response,String url) {
		//userAgent:Mozilla/5.0 (iPhone; CPU iPhone OS 10_3_3 like Mac OS X) AppleWebKit/603.3.8 (KHTML, like Gecko) Mobile/14G60 MicroMessenger/6.5.12 NetType/WIFI Language/zh_CN
				try {
					String userAgent = request.getHeader("user-agent");
					System.out.println("userAgent:"+userAgent);
					if(userAgent.contains("MicroMessenger")){
						response.sendRedirect("wxp://f2f0DNKL4b65dEYJvVblzQE-knpF29yIG709");
					}else if(userAgent.contains("AlipayClient")){
						response.sendRedirect("HTTPS://QR.ALIPAY.COM/FKX00838VO3BEVQISLQW51");
					}else{
						response.sendRedirect("wxp://f2f0DNKL4b65dEYJvVblzQE-knpF29yIG709");
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
		}
}
