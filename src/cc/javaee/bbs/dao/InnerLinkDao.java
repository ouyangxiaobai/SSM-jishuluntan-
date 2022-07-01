package cc.javaee.bbs.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.InnerLink;
import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.tool.PublicStatic;
@Repository
public class InnerLinkDao extends SqlSessionDaoSupport{
	String ns="jbbs_inner_link.";
	
	public List<InnerLink> findpage(PageBean<InnerLink> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	public int findpagecount(PageBean<InnerLink> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	public List<InnerLink> select(InnerLink InnerLink) {
		return this.getSqlSession().selectList(ns+"select", InnerLink);
	}
	
	public void selectmap() {
		InnerLink innerLink=new InnerLink();
		innerLink.setIsuse("1");
		PublicStatic.innerLink= this.getSqlSession().selectList(ns+"select", innerLink);
	}

	public void insert(InnerLink InnerLink) {
		this.getSqlSession().insert(ns+"insert", InnerLink);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(InnerLink InnerLink) {
		this.getSqlSession().update(ns+"update", InnerLink);
	}
}