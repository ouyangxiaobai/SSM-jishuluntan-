package cc.javaee.bbs.tool;

import javax.servlet.http.HttpServletRequest;

public class ToolIp {

	
	public static void printip(HttpServletRequest request){
		String ip=Tool.getIp(request);
		if(ip!=null&&ip.length()>0){
//			if(ip.startsWith("203.208.60.")){
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("google谷歌(中国)公司-蜘蛛");
//			}else if(ip.startsWith("220.181.125.")){
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("sougou搜狗公司电信节点-蜘蛛 ");
//			}else if(ip.startsWith("42.236.")){
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("360so-蜘蛛 ");
//			}else if(ip.startsWith("180.153.")){
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("360so-蜘蛛");
//			}else if(ip.startsWith("68.180.")){
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("yahoo雅虎-蜘蛛");
//			}else {
//				System.out.println("url:"+request.getRequestURI()+" ip:"+ip+" 来访时间："+Tool.getyyyyMMddHHmmss());
//				System.out.println("otherip");
//				System.out.println("*******************************************************");
//			}
		}
		
		
	}
}
