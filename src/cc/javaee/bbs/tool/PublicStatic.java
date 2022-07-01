package cc.javaee.bbs.tool;

import java.util.List;
import java.util.Map;

import cc.javaee.bbs.model.InnerLink;
import cc.javaee.bbs.model.StopIp;

public class PublicStatic {

	//分页数量
	public static int PAGENO=10;
	
	//前台用户
	public static final String USER="indexuser";
	//判断是否第一次访问登陆
	public static final String LOGIN_FLAG="LOGIN_FLAG";
	//后台用户
	public static final String ADMINUSER="adminuser";
	
	//组后台管理员
	public static final int GROUPADMIN=1;
	//组版主
	public static final int GROUPBANZHU=2;
	//组普通会员
	public static final int GROUPVIP=3;
	//页面结尾
	public static final String HTML="html";
	
	
	//全局置顶
	public static final String ALLZHIDING="2";
	
	//板块置顶
	public static final String BANKUAIZHIDING="1";
	
	//积分 发帖
	public static final Integer JIFEN_FATIE=2;
	
	public static final Integer JIFEN_HUIFU=1;

	public static final Integer JIFEN_JINGHUA=5;
	
	public static final Integer JIFEN_LOGIN=2;
	
	//积分发帖次数
	public static final Integer JIFEN_FATIE_COUNT=10;
	
	
	
	//文件的路径
	public static String FILE_PATH="";
	
	//首页的热门帖子，热门回复，最新帖子
	public static List<Map<String, Object>> ztiezi;
	
	//首页的统计
	public static Map<String, Object> indexmap;
	
	//板块
	public static Map<String, Integer> bankuai;
	//内部链接
	public static List<InnerLink> innerLink;
	
	//禁止的ip
	public static List<StopIp> stopipList;
}
