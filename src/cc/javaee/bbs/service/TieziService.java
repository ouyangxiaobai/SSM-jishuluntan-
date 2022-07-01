package cc.javaee.bbs.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.TieziBigDao;
import cc.javaee.bbs.dao.TieziDao;
import cc.javaee.bbs.model.InnerLink;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.TieziBig;
import cc.javaee.bbs.tool.PublicStatic;
import cc.javaee.bbs.tool.Tool;

@Service("tieziService")
public class TieziService{
	
	private static Logger log = Logger.getLogger(TieziService.class);
	
	
	@Autowired
	TieziDao tieziDao;
	
	@Autowired
	TieziBigDao tieziBigDao;
	
	public PageBean<Tiezi> findpage(Tiezi tiezi,PageBean<Tiezi> page) {
		tiezi.setIsuse("1");
		page.setBean(tiezi);
		int count = tieziDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Tiezi> list = tieziDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(Tiezi tiezi) {
		try {
			tieziDao.insert(tiezi);
			TieziBig tieziBig=new TieziBig();
			tieziBig.setId(tiezi.getId());
			tieziBig.setHtml(tiezi.getContenthtml());
			tieziBig.setText(tiezi.getContenttxt());
			tieziBig.setCreatetime(Tool.getyyyyMMddHHmmss());
			tieziBig.setOrderby(1);
			tieziBigDao.insert(tieziBig);
		} catch (Exception e) {
			log.error("保存异常",e);
		}
	}

	public String delete(Integer id) {
		String result="1";
		tieziDao.delete(id);
		return result;
	}
	public void update(Tiezi tiezi) {
		tieziDao.update(tiezi);
		TieziBig tieziBig=new TieziBig();
		tieziBig.setId(tiezi.getId());
		tieziBig.setHtml(tiezi.getContenthtml());
		tieziBig.setText(tiezi.getContenttxt());
		tieziBig.setCreatetime(Tool.getyyyyMMddHHmmss());
		tieziBig.setOrderby(1);
		tieziBigDao.update(tieziBig);
	}
	
	public void updatepost(Tiezi tiezi) {
		tiezi.setCreatetime(Tool.getyyyyMMddHHmmss());
		tieziDao.update(tiezi);
	}
	
	public Tiezi findbyid(Tiezi tiezi) {
		List<Tiezi> list= tieziDao.find(tiezi);
		if(list.size()>0){
			tiezi=list.get(0);
		}
		return tiezi;
	}
	
	public List<Tiezi> find(Tiezi tiezi) {
		return tieziDao.find(tiezi);
	}


	public PageBean<Tiezi> findpagebybankuanid(Tiezi tiezi,
			PageBean<Tiezi> page) {
		String orderby = tiezi.getOrderby();
		if("0".equals(orderby)){
			orderby=" t1.id  ";
		}else if("1".equals(orderby)){
			orderby=" t1.huifuid ";
		}else if("2".equals(orderby)){
			orderby=" t1.jinghua ";
		}else if("3".equals(orderby)){
			orderby=" t1.findcount ";
		}else if("4".equals(orderby)){
			orderby=" t1.isuse ";
		}else if("5".equals(orderby)){
			orderby=" t1.createtime ";
		}else{
			orderby=" t1.id ";
		}
		tiezi.setOrderby(orderby);
		page.setBean(tiezi);
		int count = tieziDao.findpagecount(page);
		page.setTotalRecords(count);
//		long start = System.currentTimeMillis();
		List<Tiezi> list = tieziDao.findpage(page);
//		System.out.println(System.currentTimeMillis()-start);
		page.setList(list);
		return page ;
	}
	
	public PageBean<Tiezi> findpagebyCreateuserid(Tiezi tiezi,
			PageBean<Tiezi> page) {
		tiezi.setIsuse("1");
		page.setBean(tiezi);
		int count = tieziDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Tiezi> list = tieziDao.findpage(page);
		page.setList(list);
		return page ;
	}


	public int findnowcount(String bankuaiid) {
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(bankuaiid));
		tiezi.setCreatetime(Tool.getyyyy_MM_dd());
		return tieziDao.findnowcount(tiezi);
	}


	public List<Tiezi> findzhiding(String bankuaiid) {
		Tiezi tiezi=new Tiezi();
		tiezi.setBankuaiId(Integer.parseInt(bankuaiid));
		List<Tiezi> find = tieziDao.find(tiezi);
		return find;
	}


	public Map<String, Object> findbytieziid(String id) {
		Map<String, Object> map=new HashMap<String, Object>();
		Tiezi tiezi=new Tiezi();
		tiezi.setId(Integer.parseInt(id));
		Map<String, Object> findbytieziid = tieziDao.findbytieziid(tiezi);
		TieziBig tieziBig = tieziBigDao.selectOne(Integer.parseInt(id));
		if(tieziBig!=null){
			findbytieziid.put("contenttxt", tieziBig.getText());
			findbytieziid.put("contenthtml", tieziBig.getHtml());
		}else{
			findbytieziid.put("contenttxt", "");
			findbytieziid.put("contenthtml", "");
		}
		String contenttxt=findbytieziid.get("contenttxt")+"";
		if(contenttxt!=null){
			contenttxt=contenttxt.replaceAll("<", "");
			contenttxt=contenttxt.replaceAll(">", "");
			findbytieziid.put("contenttxt", contenttxt);
		}
		if(contenttxt!=null&&contenttxt.length()>200){
			//对页面描述(<meta name="description" content="${map.tiezi.contenttxt}" /> )的修改，截取并替换<>
			contenttxt=contenttxt.substring(0, 190)+"...";
			findbytieziid.put("contenttxt", contenttxt);
		}
		String contenthtml=findbytieziid.get("contenthtml")+"";
		if(contenthtml!=null&&contenthtml.length()>0){
			//搜索引擎禁止传递权重标签
			contenthtml=contenthtml.replace("<a", "<a rel=\"nofollow\" ");
			List<InnerLink> innerLinklist = PublicStatic.innerLink;
			for (InnerLink innerLink : innerLinklist) {
				String name = innerLink.getName();
				String innerLinkurl=innerLink.getInnerlink();
				contenthtml=contenthtml.replaceAll(name, "<a href=\""+innerLinkurl+"\" title=\""+name+"\" target=\"_blank\">"+name+"</a>");
			}
			findbytieziid.put("contenthtml", contenthtml);
		}
		
		map.put("tiezi", findbytieziid);
		map.put("findgroup", findbytieziid.get("findgroup"));
		map.put("fatiegroup", findbytieziid.get("fatiegroup"));
		map.put("huifugroup", findbytieziid.get("huifugroup"));
		map.put("createuserid", findbytieziid.get("createuserid"));
		map.put("contenttxt", findbytieziid.get("contenttxt"));
		map.put("name", findbytieziid.get("name"));
		map.put("bankuai_id", findbytieziid.get("bankuai_id"));
		map.put("id", findbytieziid.get("id"));
		return map;
	}


	public void updatefindcount(int id) {
		tieziDao.updatefindcount(id);
	}
	
	
	public Tiezi findbytieziwhere(Tiezi tiezi){
		Tiezi tiezitmp=new Tiezi();
		tiezitmp.setId(tiezi.getId());
		tiezi=tieziDao.findbytieziwhere(tiezitmp);
		TieziBig tieziBig = tieziBigDao.selectOne(tiezi.getId());
		tiezi.setContenthtml(tieziBig.getHtml());
		tiezi.setContenttxt(tieziBig.getText());
		return tiezi;
	}
	
	public List<Tiezi> select(Tiezi tiezi) {
		List<Tiezi> find = tieziDao.select(tiezi);
		return find;
	}
	
	public List<Tiezi> equalstiezi(Map<String, Object> tiezi) {
		List<Tiezi> find = tieziDao.equalstiezi(tiezi);
		return find;
	}
	
	public List<Tiezi> nextandlast(Map<String, Object> tiezi) {
		List<Tiezi> find = tieziDao.nextandlast(tiezi);
		return find;
//		return new ArrayList<Tiezi>();
	}
	
}
