package cc.javaee.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.InnerLinkDao;
import cc.javaee.bbs.model.InnerLink;
import cc.javaee.bbs.model.PageBean;

@Service
public class InnerLinkService{
	@Autowired
	InnerLinkDao InnerLinkDao;
	
	public PageBean<InnerLink> findpage(InnerLink InnerLink,PageBean<InnerLink> page) {
		page.setBean(InnerLink);
		int count = InnerLinkDao.findpagecount(page);
		page.setTotalRecords(count);
		List<InnerLink> list = InnerLinkDao.findpage(page);
		page.setList(list);
		return page ;
	}
	

	public void insert(InnerLink InnerLink) {
		InnerLinkDao.insert(InnerLink);
	}

	public String delete(Integer id) {
		String result="1";
		InnerLinkDao.delete(id);
		return result;
	}
	public void update(InnerLink InnerLink) {
		InnerLinkDao.update(InnerLink);
	}
	
	public InnerLink findbyid(int id){
		InnerLink innerLink=new InnerLink();
		innerLink.setId(id);
		List<InnerLink> list = InnerLinkDao.select(innerLink);
		if(list.size()>0){
			return list.get(0);
		}else{
			return null;
		}
		
	}
}
