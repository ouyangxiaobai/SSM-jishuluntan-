package cc.javaee.bbs.controller.user;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.javaee.bbs.model.Bankuai;
import cc.javaee.bbs.model.Huifu;
import cc.javaee.bbs.model.Jifen;
import cc.javaee.bbs.model.Message;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Pic;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.User;
import cc.javaee.bbs.model.Zhuti;
import cc.javaee.bbs.service.BankuaiService;
import cc.javaee.bbs.service.HuifuService;
import cc.javaee.bbs.service.JifenService;
import cc.javaee.bbs.service.MessageService;
import cc.javaee.bbs.service.PicService;
import cc.javaee.bbs.service.TieziService;
import cc.javaee.bbs.service.UserService;
import cc.javaee.bbs.service.ZhutiService;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;
import cc.javaee.bbs.tool.thread.IndexThread;
/*
 * 发帖页面
 * 
 */
@Controller
@RequestMapping("/tz")
public class TieziContriller {
	
	@Autowired
	TieziService tieziService;
	
	@Autowired
	ZhutiService zhutiService;
	@Autowired
	BankuaiService bankuaiService;
	@Autowired
	HuifuService huifuService;
	@Autowired
	JifenService jifenService;
	@Autowired
	UserService userService;
	@Autowired
	MessageService messageService;
	@Autowired
	PicService picService;
	//跳转发帖页面
	@RequestMapping("toft.do")
	public String toft(HttpServletRequest request,HttpServletResponse response, Model model,String id,PageBean<Tiezi> page) {
		if(Tool.isstopip(request, response, 4)){
			return null;
		}
		//查询板块信息
		Bankuai bankuai= bankuaiService.findbyid(id);
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		boolean flag=userService.isfatie(bankuai.getFatiegroup(),user);
		if(!flag){
			return "redirect:/topage/quanxian.do";
		}
		//根据板块查询主题
		Zhuti zhuti=new Zhuti();
		zhuti.setBankuaiId(Integer.parseInt(id));
		List<Zhuti> zhutilist = zhutiService.find(zhuti);
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(id));
		tiezi.setIsuse("1");
		page = tieziService.findpagebybankuanid(tiezi, page);
		//今日的帖子总数
		int nowcount=tieziService.findnowcount(id);
		model.addAttribute("zhutilist", zhutilist);
		model.addAttribute("bankuaiId", id);
		model.addAttribute("bankuai", bankuai);
		model.addAttribute("page", page);
		model.addAttribute("nowcount", nowcount);
		if(Tool.ismobile(request)){
			return "jsp/mobile/user/fatie";
		}else{
			return "jsp/index/user/fatie";
		}
	}
	
	
	//保存发帖数据
	@RequestMapping("add.do")
	public String add(HttpServletRequest request,HttpServletResponse response, Model model,Tiezi tiezi) {
		if(Tool.isstopip(request, response, 4)){
			return null;
		}
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		Bankuai bankuai=new Bankuai();
		bankuai.setId(tiezi.getBankuaiId());
		bankuai= bankuaiService.findbyid(bankuai);		
		boolean flag=userService.isfatie(bankuai.getFatiegroup(),sessionuser);
		if(!flag){
			return "redirect:/topage/quanxian.do";
		}
		tiezi.setCreatetime(Tool.getyyyyMMddHHmmss());
		tiezi.setCreateuserid(sessionuser.getId());
		tiezi.setLastupdate("");
		tiezi.setName(Tool.replacezhuanyi(tiezi.getName()));
		tiezi.setContenthtml(Tool.replacezhuanyi(tiezi.getContenthtml()));
		tiezi.setIsuse("1");
		tieziService.insert(tiezi);
		tiezi = tieziService.findbytieziwhere(tiezi);
		//新增图片记录
		if(tiezi.getContenthtml().contains("/file/image/")){
			String[] split = tiezi.getContenthtml().split("<img");
			for (int i = 0; i < split.length; i++) {
				String html=split[i];
				if(html.contains("/file/image/")){
					int statrt =html.indexOf("/file/image/")+5;
					String tmpcontent=html.substring(statrt);
					int end=tmpcontent.indexOf("\"");
					tmpcontent=tmpcontent.substring(0, end);
					String picpath="/file"+tmpcontent;
					tmpcontent=PublicStatic.FILE_PATH+tmpcontent;
					BufferedImage bufferedImage;
					try {
						bufferedImage = javax.imageio.ImageIO.read(new File(tmpcontent));
						int width = bufferedImage.getWidth();   
						int height = bufferedImage.getHeight();
						Pic pic=new Pic();
						pic.setBankuaiid(tiezi.getBankuaiId());
						pic.setHeight(height);
						pic.setWidth(width);
						pic.setPath(picpath);
						pic.setIsdel("0");
						pic.setPictype("0");
						pic.setCreateuserid(sessionuser.getId());
						pic.setTieziid(tiezi.getId());
						picService.insert(pic);
					} catch (IOException e) {
						e.printStackTrace();
					}   
				}
			}
		}
		//新增积分
		Jifen jifen=new Jifen();
		jifen.setFenshu(PublicStatic.JIFEN_FATIE);
		jifen.setUserid(sessionuser.getId());
		jifen.setType("101");
		jifen.setContent("您发布了帖子获得"+PublicStatic.JIFEN_FATIE+"积分");
		int findnowcount = jifenService.findnowcount(jifen);
		//如果发帖次数小于等于这个时间，增加积分
		if(findnowcount<=PublicStatic.JIFEN_FATIE_COUNT){
			jifenService.insert(jifen);
		}
		
		//启动缓存线程
		new IndexThread().start();
		return "redirect:/"+tiezi.getYuming()+"/";
	}
	
	//跳转编辑发帖页面
	@RequestMapping("toupdate.do")
	public String toupdate(HttpServletRequest request,HttpServletResponse response, Model model,PageBean<Tiezi> page,String tieziid) {
		if(Tool.isstopip(request, response, 4)){
			return null;
		}
		Tiezi tiezi=new Tiezi();
		tiezi.setId(Integer.parseInt(tieziid));
		tiezi = tieziService.findbytieziwhere(tiezi);
		String id=tiezi.getBankuaiId()+"";
		Bankuai bankuai= bankuaiService.findbyid(id);
		User user=(User)request.getSession().getAttribute(PublicStatic.USER);
		boolean flag=userService.isfatie(bankuai.getFatiegroup(),user);
		//判断是否有编辑权限
		if(Tool.isguanliyuan(user)){
			if(!flag){
				return "redirect:/topage/quanxian.do";
			}
		}
		Zhuti zhuti=new Zhuti();
		zhuti.setBankuaiId(Integer.parseInt(id));
		List<Zhuti> zhutilist = zhutiService.find(zhuti);
		tiezi.setIsuse("1");
		page = tieziService.findpagebybankuanid(tiezi, page);
		//今日的帖子总数
		int nowcount=tieziService.findnowcount(id);
		model.addAttribute("zhutilist", zhutilist);
		model.addAttribute("bankuaiId", id);
		model.addAttribute("bankuai", bankuai);
		model.addAttribute("page", page);
		model.addAttribute("nowcount", nowcount);
		model.addAttribute("tiezi", tiezi);
		return "jsp/index/user/updatefatie";
	}
	
	//修改发帖数据
	@RequestMapping("update.do")
	public String update(HttpServletRequest request,HttpServletResponse response, Model model,Tiezi tiezi) {
		if(Tool.isstopip(request, response, 4)){
			return null;
		}
		//
		Tiezi tiezisql = tieziService.findbytieziwhere(tiezi);
		
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		if(Tool.isguanliyuan(sessionuser)){
			if(sessionuser.getId()!=tiezisql.getCreateuserid()){
				return "redirect:/topage/quanxian.do";
			}
		}
		//更新帖子信息，并记录操作日志
		Tiezi tieziupdate =new Tiezi();
		tieziupdate.setId(tiezi.getId());
		tieziupdate.setZhutiid(tiezi.getZhutiid());
		tieziupdate.setName(tiezi.getName());
		tieziupdate.setContenthtml(tiezi.getContenthtml());
		tieziupdate.setContenttxt(tiezi.getContenttxt());
		tieziupdate.setLastupdate("您的帖子在"+Tool.getyyyyMMddHHmmss()+"被"+sessionuser.getLoginname()+"编辑<br/>");
		tieziupdate.setName(Tool.replacezhuanyi(tiezi.getName()));
		tieziupdate.setContenthtml(Tool.replacezhuanyi(tiezi.getContenthtml()));
		tieziupdate.setIsuse("1");
		tieziService.update(tieziupdate);
		return "redirect:/post/"+tiezi.getId()+"_1_1.html";
	}
	
	
	//保存回复信息
	@ResponseBody
	@RequestMapping("addhuifu.do")
	public String addhuifu(HttpServletRequest request,HttpServletResponse response, Model model,int id,String editortxt,String editorhtml,Integer huifuid) {
		if(Tool.isstopip(request, response, 5)){
			return null;
		}
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		Map<String, Object> map= tieziService.findbytieziid(id+"");
		//验证是否有回复权限
		String flag = userService.ishuifu(map.get("huifugroup")+"", sessionuser);
		if(!flag.equals("1")){
			return flag;
		}
		Huifu huifu=new Huifu();
		huifu.setContenthtml(editorhtml);
		huifu.setContenttxt(editortxt);
		huifu.setCreateuserid(sessionuser.getId());
		huifu.setTieziid(id);
		huifu.setCreatetime(Tool.getyyyyMMddHHmmss());
		huifu.setIsdel("0");
		huifu.setHuifuid(huifuid);
		huifu.setOrderby(huifuService.maxobderby(id));
		huifuService.insert(huifu);
		//回复记录积分
		Jifen jifen=new Jifen();
		jifen.setFenshu(PublicStatic.JIFEN_HUIFU);
		jifen.setUserid(sessionuser.getId());
		jifen.setType("102");
		jifen.setContent("您回复了帖子获得"+PublicStatic.JIFEN_HUIFU+"积分");
		int findnowcount = jifenService.findnowcount(jifen);
		if(findnowcount<21){
			jifenService.insert(jifen);
		}
		//增加消息记录
		Message message=new Message();
		message.setMessagetype("2");
		message.setIsread("0");
		message.setTitle("一条新的回复消息");
		message.setContent("用户 "+sessionuser.getLoginname()+" 回复了我的帖子:  <a href='"+request.getContextPath()+"/tiezi/"+id+"_1_1.html' target=\"_blank\" >"+map.get("name")+"</a> </br>回复内容: "+editortxt+" ");
		message.setCreatetime(Tool.getyyyyMMddHHmmss());
		int userid=Integer.parseInt(map.get("createuserid").toString()) ;
		message.setUseridaccept(userid);
		messageService.insert(message);
		//启动缓存线程
		new IndexThread().start();
		return "1";
	}
	
	//跳转编辑发帖页面
	@RequestMapping("toaddhuifu.do")
	public String toaddhuifu(HttpServletRequest request, HttpServletResponse response,Model model,int id,int huifuid) {
		if(Tool.isstopip(request, response, 5)){
			return null;
		}
		model.addAttribute("id", id);
		model.addAttribute("huifuid", huifuid);
		if(Tool.ismobile(request)){
			return "jsp/mobile/user/addhuifu";
		}else{
			return "jsp/index/user/addhuifu";
		}
	}
	
	//跳转我的帖子
	@RequestMapping("index.do")
	public String index(HttpServletRequest request, Model model,Tiezi tiezi,PageBean<Tiezi> page) {
		User sessionuser=(User)request.getSession().getAttribute(PublicStatic.USER);
		//查询板块的帖子
		tiezi.setCreateuserid(sessionuser.getId());
		//查询列表
		page = tieziService.findpagebyCreateuserid(tiezi, page);
		model.addAttribute("page", page);
		if(Tool.ismobile(request)){
			return "jsp/mobile/user/user-tiezi";
		}else{
			return "jsp/index/user/user-tiezi";
		}
	}
		
	
	
}
