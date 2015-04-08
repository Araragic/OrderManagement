package cn.emagsoftware.dm.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;


public class LoginHandleInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
		
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8"); 

		HttpSession session = request.getSession();
		String user = (String) session.getAttribute("username");
		String ContextPath = request.getContextPath();
		String RequestURI = request.getRequestURI();
		int cut = RequestURI.indexOf(ContextPath)+ContextPath.length();
		String cutPath = RequestURI.substring(cut);
		
		if(cutPath.indexOf("/assets")>-1){
			return true;
		}
		if(cutPath.equals("/login")){
			return true;
		}
		if (cutPath.equals("/")) {
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		if(user == null){
			PrintWriter out = response.getWriter();  
            StringBuilder builder = new StringBuilder();  
            builder.append("<script type=\"text/javascript\" charset=\"UTF-8\">");  
            builder.append("alert(\"页面过期，请重新登录\");");  
            builder.append("window.top.location.href=\"");  
            builder.append("/Emagdm/login\";</script>");  
            out.print(builder.toString());  
            out.close();  
            return false;  
		}else{
			return true;
		}
	}
}
