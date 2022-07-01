package cc.javaee.bbs.dao;


import java.util.List;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import cc.javaee.bbs.model.Tiezi;
import cc.javaee.bbs.model.TieziBig;
@Repository
public class TieziBigDao extends SqlSessionDaoSupport{
	String ns="jbbs_tiezi_big.";

	public void insert(TieziBig tieziBig) {
		this.getSqlSession().insert(ns+"insert", tieziBig);
	}

	public void delete(Integer id) {
		this.getSqlSession().delete(ns+"delete", id);
	}

	public void update(TieziBig tieziBig) {
		this.getSqlSession().update(ns+"update", tieziBig);
	}

	//查询列表
	public List<TieziBig> select(TieziBig tieziBig){
		return this.getSqlSession().selectList(ns+"select", tieziBig);
	}
	
	//查询一个
	public TieziBig selectOne(int id){
		TieziBig tieziBig=new TieziBig();
		tieziBig.setId(id);
		return this.getSqlSession().selectOne(ns+"select", tieziBig);
	}

	
}