package cc.javaee.bbs.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.PageBean;
import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.tool.Tool;
@Repository
public class TieziDao extends SqlSessionDaoSupport{
	String ns="jbbs_tiezi.";
	public List<Tiezi> findpage(PageBean<Tiezi> page) {
		return this.getSqlSession().selectList(ns+"findpage", page);
	}
	
	public int findpagecount(PageBean<Tiezi> page) {
		return this.getSqlSession().selectOne(ns+"findpagecount", page);
	}
	
	public List<Tiezi> find(Tiezi tiezi) {
		return this.getSqlSession().selectList(ns+"find", tiezi);
	}

	public void insert(Tiezi tiezi) {
		this.getSqlSession().insert(ns+"insert", tiezi);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(Tiezi tiezi) {
		this.getSqlSession().update(ns+"update", tiezi);
	}

	public int findnowcount(Tiezi tiezi) {
		// TODO Auto-generated method stub
		return this.getSqlSession().selectOne(ns+"findnowcount", tiezi);
	}
	
	public Map<String, Object> findbytieziid(Tiezi tiezi) {
		return this.getSqlSession().selectOne(ns+"findbytiezi", tiezi);
	}

	//更新查看次数
	public void updatefindcount(int id) {
		this.getSqlSession().update(ns+"updatefindcount", id);
	}
	//更新最后回复id，根据最近一个月的回复数据更新，性能提高，如果此更新比较频繁，可以修改为一周，或者一天
	public void updatetiezilasthuifuid() {
		Map<String, Object> map=new HashMap<String, Object>();
		map.put("date", Tool.getqy_yyyy_MM_dd());
		this.getSqlSession().update(ns+"updatetiezilasthuifuid",map);
	}
	//更新最后回复id，更新所有，此更新会比较慢
	public void updatetiezilasthuifuidall() {
		this.getSqlSession().update(ns+"updatetiezilasthuifuidall");
	}
	
	public Tiezi findbytieziwhere(Tiezi tiezi){
		return this.getSqlSession().selectOne(ns+"select", tiezi);
	}
	public List<Tiezi> select(Tiezi tiezi){
		return this.getSqlSession().selectList(ns+"select", tiezi);
	}
	public List<Tiezi> equalstiezi(Map<String, Object> tiezi){
		return this.getSqlSession().selectList(ns+"equalstiezi", tiezi);
	}
	
	public List<Tiezi> nextandlast(Map<String, Object> tiezi){
		return this.getSqlSession().selectList(ns+"nextandlast", tiezi);
	}

}