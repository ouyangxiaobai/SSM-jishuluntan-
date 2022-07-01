package cc.javaee.bbs.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.javaee.bbs.dao.MessageDao;
import cc.javaee.bbs.model.Message;
import cc.javaee.bbs.model.PageBean;

@Service
public class MessageService{
	@Autowired
	MessageDao MessageDao;
	
	public PageBean<Message> findpage(Message message,PageBean<Message> page) {
		page.setBean(message);
		int count = MessageDao.findpagecount(page);
		page.setTotalRecords(count);
		List<Message> list = MessageDao.findpage(page);
		for (Message message2 : list) {
			String content = message2.getContent();
			if(content!=null&&content.length()>130){
				content=content.substring(0, 130)+"......";
				message2.setContent(content);
			}
		}
		page.setList(list);
		return page ;
	}
	

	public void insert(Message Message) {
		MessageDao.insert(Message);
	}
	public void update(Message Message) {
		MessageDao.update(Message);
	}

	public String delete(Integer id) {
		String result="1";
		MessageDao.delete(id);
		return result;
	}
	public Message findbyid(Message Message) {
		List<Message> list= MessageDao.find(Message);
		if(list.size()>0){
			Message=list.get(0);
		}
		return Message;
	}
	
	public List<Message> findbyparentId(Message Message) {
		List<Message> list= MessageDao.find(Message);
		return list;
	}


	public List<Message> find(Message Message) {
		return MessageDao.find(Message);
	}
	public int findisreadcount(int id) {
		Message message=new Message();
		message.setUseridaccept(id);
		message.setIsread("0");
		List<Message> list = MessageDao.find(message);
		return list.size();
	}

}
