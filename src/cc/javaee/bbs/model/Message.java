package cc.javaee.bbs.model;

public class Message {
	
    private Integer id;
    
    //标题
    private String title;

    //内容
    private String content;

    //创建时间
    private String createtime;

    //发送人
    private Integer useridsend;

    //接受人
    private Integer useridaccept;

    //发送类型
    private String messagetype;

    //是否读取
    private String isread;
    //显示使用 发送人名称
    private String loginnamesend;
    //显示使用 接收人名称
    private String loginnameaccept;
    //查询使用 开始时间
    private String starttime;
    //查询使用 结束时间
    private String endtime;

    
    

    public String getStarttime() {
		return starttime;
	}

	public void setStarttime(String starttime) {
		this.starttime = starttime;
	}

	public String getEndtime() {
		return endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getLoginnamesend() {
		return loginnamesend;
	}

	public void setLoginnamesend(String loginnamesend) {
		this.loginnamesend = loginnamesend;
	}

	public String getLoginnameaccept() {
		return loginnameaccept;
	}

	public void setLoginnameaccept(String loginnameaccept) {
		this.loginnameaccept = loginnameaccept;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getId() {
        return id;
    }
    public void setId(Integer id) {
        this.id = id;
    }
    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public Integer getUseridsend() {
        return useridsend;
    }

    public void setUseridsend(Integer useridsend) {
        this.useridsend = useridsend;
    }

    public Integer getUseridaccept() {
        return useridaccept;
    }

    public void setUseridaccept(Integer useridaccept) {
        this.useridaccept = useridaccept;
    }

    public String getMessagetype() {
        return messagetype;
    }

    public void setMessagetype(String messagetype) {
        this.messagetype = messagetype;
    }

    public String getIsread() {
        return isread;
    }

    public void setIsread(String isread) {
        this.isread = isread;
    }
}