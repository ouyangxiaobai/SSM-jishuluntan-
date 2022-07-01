package cc.javaee.bbs.controller.admin;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.StopIp;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.StopIpService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
import cc.javaee.bbs.tool.thread.IndexThread;
/*
 * 后台板块查询
 * 
 */
@Controller
@RequestMapping("/admin/stopip")
public class AdminStopIpController {
	
	@Autowired
	StopIpService stopIpService;
	
	@Autowired
	UserService userService;

	private static Logger log = Logger.getLogger(AdminStopIpController.class);

	//后台页面查询
	@RequestMapping("index.do")
	public String findAllWhere(HttpServletRequest request, Model model,StopIp stopIp,PageBean<StopIp> page) {
		page = stopIpService.findpage(stopIp,page);
		model.addAttribute("page", page);
		return "jsp/admin/stopip/index";
	}
	
	//跳转到修改页面
	@RequestMapping("toupdateoradd.do")
	public String toupdateoradd(StopIp stopIp, Model model) {
		if(stopIp.getId()!=null){
			stopIp=stopIpService.findbyid(stopIp);
		}
		model.addAttribute("stopip", stopIp);
		return "jsp/admin/stopip/updateoradd";
	}
	
	//修改或者新增
	@RequestMapping("updateoradd.do")
	public String updateoradd(HttpServletRequest request,StopIp stopIp) {
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		stopIp.setCreateuserid(user.getId());
		stopIp.setCreatetime(Tool.getyyyyMMddHHmmss());
		if(stopIp.getId()!=null){
			stopIpService.update(stopIp);
		}else{
			stopIpService.insert(stopIp);
		}
		new IndexThread().start();
		return "redirect:index.do ";
	}
	
	//删除
	@ResponseBody
	@RequestMapping("del.do")
	public String del(int id) {
		String result=stopIpService.delete(id);
		new IndexThread().start();
		return result;
	}
	
	//修改生效
	@ResponseBody
	@RequestMapping("updateuse.do")
	public String updateuse(HttpServletRequest request,StopIp stopIp) {
		new IndexThread().start();
		stopIpService.update(stopIp);
		return "1";
	}
	//禁用用户ip
	@ResponseBody
	@RequestMapping("updatestopid.do")
	public String updatestopid(HttpServletRequest request,Integer id) {
		User usersession=(User)request.getSession().getAttribute(PublicStatic.USER);
		User user=new User();
		user.setId(id);
		user = userService.findbyid(user);
		StopIp stopIp=new StopIp();
		stopIp.setStartip(user.getZhuceip());
		stopIp.setEndip(user.getZhuceip());
		stopIp.setIsuse("1");
		stopIp.setType("-2,-3,-4,-5,");
		stopIp.setCreatetime(Tool.getyyyyMMddHHmmss());
		stopIp.setCreateuserid(usersession.getId());
		stopIp.setRemarks("注册IP禁止用户:"+user.getLoginname()+" 注册，登陆，发帖，回复");
		stopIpService.insert(stopIp);
		if(!user.getZhuceip().equals(user.getLoginip())&&user.getLoginip()!=null&&!"".equals(user.getLoginip())){
			stopIp.setStartip(user.getLoginip());
			stopIp.setEndip(user.getLoginip());
			stopIp.setIsuse("1");
			stopIp.setType("-2,-3,-4,-5,");
			stopIp.setCreatetime(Tool.getyyyyMMddHHmmss());
			stopIp.setCreateuserid(usersession.getId());
			stopIp.setRemarks("登陆IP禁止用户:"+user.getLoginname()+" 注册，登陆，发帖，回复");
			stopIpService.insert(stopIp);
		}
		return "1";
	}
}
