package cc.javaee.bbs.tool;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLConnection;
import java.net.UnknownHostException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.StringTokenizer;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;





import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.google.gson.Gson;

import cc.javaee.bbs.model.StopIp;
import cc.javaee.bbs.model.User;
import sun.misc.BASE64Encoder;

public class Tool {

	private static Logger log = Logger.getLogger(Tool.class);
	
	
	//获取带分时间
	public static String getyyyyMMddHHmm(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		return sdf.format(d);
	}
	//获取带毫秒时间
	public static String getyyyyMMddHHmmss(){
		Date d = new Date();
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		return sdf.format(d);
	}
	//获取带毫秒时间戳
	public static String getyyyyMMddHHmmssSSS(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmssSSS");
		return sdf.format(d);
	}
	//获取日期
	public static String getyyyyMMdd(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		return sdf.format(d);
	}
	//获取日期
	public static String getyyyy_MM_dd(){
		Date d = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		return sdf.format(d);
	}
	
	//前一天
	public static String getq_yyyy_MM_dd(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long l=System.currentTimeMillis()-1000l*60*60*24;
		return sdf.format(l);
	}
	
	//前一月
	public static String getqy_yyyy_MM_dd(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long l=System.currentTimeMillis()-(1000l*60*60*24*30);
		return sdf.format(l);
	}
	//前一周
	public static String getq_zy_yyyy_MM_dd(){
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		long l=System.currentTimeMillis()-1000l*60*60*24*7;
		return sdf.format(l);
	}
	
	//获取10000-100000的随机数
	public static int getRandom(){
		int max=100000;
        int min=10000;
        Random random = new Random();
        int s = random.nextInt(max)%(max-min+1) + min;
        return s;
	}
	
	
	//获取ip--暂时不使用
	public static String getIps(HttpServletRequest request)
	  {
	    String ip = request.getHeader("x-forwarded-for");
	    if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
	      ip = request.getHeader("Proxy-Client-IP");
	    }
	    if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
	      ip = request.getHeader("WL-Proxy-Client-IP");
	    }
	    if ((ip == null) || (ip.length() == 0) || ("unknown".equalsIgnoreCase(ip))) {
	      ip = request.getRemoteAddr();
	    }
	    if (ip.equals("127.0.0.1"))
	    {
	      log.error("获取客户ip失败：" + ip);
	      ip = getUUID();
	    }
	    return ip;
	  }
	//获取ip
	public  static String getIp(HttpServletRequest request) {
		String ip = request.getHeader("X-Pounded-For");
		if (ip != null) {
			return ip;
		}

		ip = request.getHeader("x-forwarded-for");

		if (ip == null) {
			ip = request.getRemoteAddr();
			if (ip.equals("127.0.0.1") || ip.equals("0:0:0:0:0:0:0:1")) {
				InetAddress address;
				try {
					address = InetAddress.getLocalHost();
					ip = address.getHostAddress();
				} catch (UnknownHostException e) {
					e.printStackTrace();
				}

			}
			return ip;
		} else {
			StringTokenizer tokenizer = new StringTokenizer(ip, ",");
			for (int i = 0; i < tokenizer.countTokens() - 1; i++) {
				tokenizer.nextElement();
			}

			ip = tokenizer.nextToken().trim();

			if (ip.equals("")) {
				ip = null;
			}
		}

		if (ip == null) {
			ip = "0.0.0.0";
		}

		return ip;
	}
	//获取uuid
	public static String getUUID()
	  {
	    String uuid = UUID.randomUUID().toString().trim().replaceAll("-", "");
	    return uuid;
	  }
	  
	public static String MD5(String str){
		String newstr="";
		try {
        //确定计算方法
        MessageDigest md5= MessageDigest.getInstance("MD5");
        BASE64Encoder base64en = new BASE64Encoder();
        //加密后的字符串
        newstr=base64en.encode(md5.digest(str.getBytes("utf-8")));
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        return newstr;
    }
	
	//判断是否管理员或者版主，如果是返回false，否则true
	public static boolean isguanliyuan(User user){
		if(user.getGroupid()==PublicStatic.GROUPBANZHU||user.getGroupid()==PublicStatic.GROUPADMIN){
			return false;
		}else{
			return true;
		}
	}
	
	public static String sendGet(String url, String param) {
        String result = "";
        BufferedReader in = null;
        try {
        	String urlNameString=url;
        	if(param.length()>0){
        		urlNameString=urlNameString+"?" + param;
        	}
//            System.out.println(urlNameString);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            connection.setRequestProperty("user-agent",
                    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
//            for (String key : map.keySet()) {
//                System.out.println(key + "--->" + map.get(key));
//            }
            // 定义 BufferedReader输入流来读取URL的响应
            in = new BufferedReader(new InputStreamReader(
                    connection.getInputStream(),"utf-8"));
            String line;
            while ((line = in.readLine()) != null) {
                result += line;
            }
        } catch (Exception e) {
            System.out.println("发送GET请求出现异常！" + e);
            e.printStackTrace();
        }
        // 使用finally块来关闭输入流
        finally {
            try {
                if (in != null) {
                    in.close();
                }
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
        return result;
    }
	
	//百度插入文件后返回json的处理
	public static String updatebaiduresult(HttpServletRequest request,String result){
		Gson gson = new Gson();
		Map<String, String> map= gson.fromJson(result, Map.class);
		if(map!=null&&map.get("state")!=null&&"SUCCESS".equals(map.get("state"))){
			String url=map.get("url");
			url=url.replaceAll("/upload", "");
			StringBuffer requesturl = request.getRequestURL();  
			String tempContextUrl = requesturl.delete(requesturl.length() - request.getRequestURI().length(), requesturl.length()).append(request.getContextPath()).toString(); 
			url=tempContextUrl+"/file"+url;
			System.out.println(url);
			map.put("url", url);
			result=gson.toJson(map);
		}
		return result;
	}
	//转移html内容
	public static String replacezhuanyi(String html){
		html=html.replaceAll("<script>", "&lt;script&gt;");
		html=html.replaceAll("</script>", "&lt;/script&gt;");
		return html;
	}
	//ipIsValid("192.167.1.1-192.168.5.10", "192.168.3.54") 返回true和false
	public static boolean ipIsValid(String ipSection, String ip) {     
        if (ipSection == null)     
            throw new NullPointerException("IP段不能为空！");     
        if (ip == null)     
            throw new NullPointerException("IP不能为空！");     
        ipSection = ipSection.trim();     
        ip = ip.trim();     
        final String REGX_IP = "((25[0-5]|2[0-4]\\d|1\\d{2}|[1-9]\\d|\\d)\\.){3}(25[0-5]|2[0-4]\\d|1\\d{2}|[1-9]\\d|\\d)";     
        final String REGX_IPB = REGX_IP + "\\-" + REGX_IP;     
        if (!ipSection.matches(REGX_IPB) || !ip.matches(REGX_IP))     
            return false;     
        int idx = ipSection.indexOf('-');     
        String[] sips = ipSection.substring(0, idx).split("\\.");     
        String[] sipe = ipSection.substring(idx + 1).split("\\.");     
        String[] sipt = ip.split("\\.");     
        long ips = 0L, ipe = 0L, ipt = 0L;     
        for (int i = 0; i < 4; ++i) {     
            ips = ips << 8 | Integer.parseInt(sips[i]);     
            ipe = ipe << 8 | Integer.parseInt(sipe[i]);     
            ipt = ipt << 8 | Integer.parseInt(sipt[i]);     
        }     
        if (ips > ipe) {     
            long t = ips;     
            ips = ipe;     
            ipe = t;     
        }     
        return ips <= ipt && ipt <= ipe;     
    }     
    public static void main(String[] args) {     
    	long currentTimeMillis = System.currentTimeMillis();
    	for (int i = 0; i <10000; i++) {
    		boolean ipisstop = ipisstop("10.10.1.1", "192.169.5.10", "192.169.1.0");
//    		System.out.println(ipisstop);
		}
    	System.out.println(System.currentTimeMillis()-currentTimeMillis);
    }  
	
    public static boolean ipisstop(String startip,String endip,String targetip){
    	String[] startsplit = startip.split("\\.");
    	String[] endsplit = endip.split("\\.");
    	String[] targetsplit = targetip.split("\\.");
    	boolean flag=false;
    	if(startsplit.length==4&&endsplit.length==4&&targetsplit.length==4){
    		for (int i = Integer.parseInt(startsplit[0]); i <= Integer.parseInt(endsplit[0]); i++) {
				if(i==Integer.parseInt(targetsplit[0])){
					flag=true;
					break;
				}
			}
    		if(!flag){
//    			System.out.println("1");
    			return false;
    		}
    		flag=false;
    		for (int i = Integer.parseInt(startsplit[1]); i <= Integer.parseInt(endsplit[1]); i++) {
    			if(i==Integer.parseInt(targetsplit[1])){
    				flag=true;
    				break;
    			}
    		}
    		if(!flag){
//    			System.out.println("2");
    			return false;
    		}
    		flag=false;
    		for (int i = Integer.parseInt(startsplit[2]); i <= Integer.parseInt(endsplit[2]); i++) {
    			if(i==Integer.parseInt(targetsplit[2])){
    				flag=true;
    				break;
    			}
    		}
    		if(!flag){
//    			System.out.println("3");
    			return false;
    		}
    		flag=false;
    		for (int i = Integer.parseInt(startsplit[3]); i <= Integer.parseInt(endsplit[3]); i++) {
    			if(i==Integer.parseInt(targetsplit[3])){
    				flag=true;
    				break;
    			}
    		}
    		if(!flag){
//    			System.out.println("4");
    			return false;
    		}
    	}else{
    		System.out.println("传入ip错误");
    		return false;
    	}
    	return true;
    }
    //1 访问 2 注册  3登陆 4发帖 5回复
	public static boolean isstopip(HttpServletRequest request,
			HttpServletResponse response, int i) {
		List<StopIp> stopipList = PublicStatic.stopipList;
		String ip = getIp(request);
		String urlString=request.getRequestURI();
		if(urlString.contains("/topage/ipquanxian.do")){
			return false;
		}
		for (StopIp stopIp : stopipList) {
			String type=stopIp.getType();
			if(type.contains("-"+i+",")){
				if(ipisstop(stopIp.getStartip(), stopIp.getEndip(), ip)){
					try {
						response.sendRedirect(request.getContextPath()+"/topage/ipquanxian.do");
						return true;
					} catch (IOException e) {
						e.printStackTrace();
					}
				}
			}
		}
		return false;
	}
    
    //判断是否手机访问
    public static boolean ismobile(HttpServletRequest request){
    	Boolean ismobile=(Boolean) request.getSession().getAttribute("ismobile");
    	if(ismobile!=null){
    		return ismobile;
    	}else{
    		return ismobilefilter(request);
    	}
    }
    
    //拦截器判断是否手机访问
    public static boolean ismobilefilter(HttpServletRequest request){
    	Boolean ismobile=false;
    	String userAgent = request.getHeader("user-agent");
    	if(userAgent.indexOf("Android") != -1){
    	    //安卓
    		ismobile=true;
    	}else if(userAgent.indexOf("iPhone") != -1 || userAgent.indexOf("iPad") != -1){
    		ismobile=true;
    	   //苹果
    	}else{
    		ismobile=false;
    	    //电脑
    	}
    	return ismobile;
    }
	public static String equalsql(String string) {
		string=string.replace(" ", "");
		string=string.replace("（", "");
		string=string.replace("，", "");
		string=string.replace("）", "");
		string=string.replace(":", "");
		string=string.replace("的", "");
		string=string.replace("和", "");
		StringBuffer sb=new StringBuffer();
		//name like '%%' or name like '%%'
		char[] charArray = string.toCharArray();
		for (int i = 0; i < charArray.length; i++) {
			if(i==0){
				sb.append("t1.name like '%"+charArray[i]+"%'");
			}else{
				sb.append(" or t1.name like '%"+charArray[i]+"%'");
			}
		}
		return sb.toString();
	}
    
    
    
}
