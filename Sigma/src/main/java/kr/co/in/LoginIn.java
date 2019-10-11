package kr.co.in;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginIn extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = modelAndView.getModel().get("vo");
		
		if(obj != null) {
			session.setAttribute("login", obj);
			
			session.removeAttribute("login_failed");
			
			String dest = (String) session.getAttribute("dest");
			session.removeAttribute("dest");
			response.sendRedirect(dest!=null?dest:"/");
		} else {
			
			session.setAttribute("login_failed", "로그인 정보가 틀렸습니다. 다시 확인해주세요.");
			
			response.sendRedirect("/member/login/login");
			
		}
		
	}


	
	
}
