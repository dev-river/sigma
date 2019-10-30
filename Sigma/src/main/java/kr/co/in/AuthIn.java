package kr.co.in;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthIn extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession(false);
		if(session!=null) {
			if(session.getAttribute("login") != null){
				return true;
			}else {
				saveDest(request);
				alert(response);
				return false;
			}
		}else {
			saveDest(request);
			alert(response);
			return false;
		}
	}
	
	private void saveDest(HttpServletRequest request) {
		HttpSession session = request.getSession();
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query="";
		} else {
			query = "?"+query;
		}
		
		String me = request.getMethod();
		if(me.equalsIgnoreCase("get")) {
			session.setAttribute("dest", uri+query);
			
		}
		
	}
	
	private void alert(HttpServletResponse response) throws IOException {
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('로그인이 필요한 페이지입니다.'); location.href='/member/login/login';</script>");
		 
		out.flush();
	}
	
	

	
	
}
