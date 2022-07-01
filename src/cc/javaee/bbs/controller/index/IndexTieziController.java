package cc.javaee.bbs.controller.index;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.HuifuService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
/*
 * 帖子的查询
 * 
 */
@Controller
@RequestMapping("/post")
public class IndexTieziController {
	@Autowired
	BankuaiService bankuaiService;
	
	@Autowired
	TieziService tieziService;
	
	@Autowired
	ZhutiService zhutiService;
	
	@Autowired
	HuifuService huifuService;
	
	@Autowired
	UserService userService;

	private static Logger log = Logger.getLogger(IndexTieziController.class);

	//根据帖子id查询信息
	@RequestMapping("index.do")
	public String index(HttpServletRequest request, Model model,String bankuaiid,String id,String orderby,PageBean<Map<String, Object>> page) {
		
//		long start = System.currentTimeMillis();
		Map<String, Object> map= tieziService.findbytieziid(id);
		
		//判断访问权限
		String findgroup = map.get("findgroup")+"";
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		boolean b=userService.isfind(findgroup,user);
		if(!b){
			return "redirect:/topage/quanxian.do";
		}
		
		model.addAttribute("map", map);
		//判断回复权限
		if(user!=null){
			String flag = userService.ishuifu(map.get("huifugroup")+"", user);
			model.addAttribute("flag", flag);
		}
		Map<String, Object> qmap=new HashMap<String, Object>();
		qmap.put("id", id);
		if("0".equals(orderby)){
			qmap.put("orderby", " desc");
		}else{
			qmap.put("orderby", " asc ");
		}
		tieziService.updatefindcount(Integer.parseInt(id));
		PageBean<Map<String, Object>> huifumap = huifuService.findpage(qmap, page);
		model.addAttribute("huifumap", huifumap);
		model.addAttribute("orderby", orderby);
		
		//查询相关帖子
		Map<String, Object> tiezi=new HashMap<String, Object>();
		String sql=Tool.equalsql(map.get("name")+"");
		tiezi.put("sql", sql);
		tiezi.put("id", map.get("id"));
		tiezi.put("bankuai_id", map.get("bankuai_id"));
		List<Tiezi> listtiezi = tieziService.equalstiezi(tiezi);
		model.addAttribute("listtiezi", listtiezi);
		//获取上一个和下一个
		List<Tiezi> nextandlast = tieziService.nextandlast(tiezi);
		for (Tiezi tiezi2 : nextandlast) {
			int tieziid=Integer.parseInt(map.get("id")+"");
			if(tiezi2.getId()<tieziid){
				model.addAttribute("next", tiezi2);
			}else{
				model.addAttribute("last", tiezi2);
			}
		}
		
		
		if(Tool.ismobile(request)){
			return "jsp/mobile/neirong";
		}else{
			return "jsp/index/neirong";
		}
	}
}
