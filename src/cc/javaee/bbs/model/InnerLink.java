package cc.javaee.bbs.model;

public class InnerLink {
    private Integer id;

    //名称
    private String name;
//连接地址
    private String innerlink;
//连接类型
    private String type;
//是否使用
    private String isuse;
//创建人
    private Integer createuserid;
//创建时间
    private String createtime;
    
    //查询展示使用
    private String loginname;
    
    public String getLoginname() {
		return loginname;
	}

	public void setLoginname(String loginname) {
		this.loginname = loginname;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    public String getInnerlink() {
        return innerlink;
    }

    public void setInnerlink(String innerlink) {
        this.innerlink = innerlink;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getIsuse() {
        return isuse;
    }

    public void setIsuse(String isuse) {
        this.isuse = isuse;
    }

    public Integer getCreateuserid() {
        return createuserid;
    }

    public void setCreateuserid(Integer createuserid) {
        this.createuserid = createuserid;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }
}