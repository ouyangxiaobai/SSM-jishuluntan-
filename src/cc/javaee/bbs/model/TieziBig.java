package cc.javaee.bbs.model;
/*
 * 存储帖子内容使用，大字段特殊设置表
 * 
 * 
 */
public class TieziBig {
    private Integer id;
    
    private String html;

    private String text;

    private String createtime;

    private Integer orderby;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getHtml() {
		return html;
	}

	public void setHtml(String html) {
		this.html = html;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}

	public Integer getOrderby() {
		return orderby;
	}

	public void setOrderby(Integer orderby) {
		this.orderby = orderby;
	}
    
    

}