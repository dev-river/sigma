package kr.co.in;

import java.io.PrintWriter;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.swing.JOptionPane;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.domain.memberVO;
import kr.co.service.memberService;

public class LoginIn extends HandlerInterceptorAdapter{
	
	@Inject
	private memberService mService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession(false);
		if(session != null) {
			if(session.getAttribute("login") != null) {
				session.removeAttribute("login");
			}
		}
		Cookie[] cookies = request.getCookies();
		if(cookies != null) {
			for(int i=0; i<cookies.length; i++) {
				cookies[i].setMaxAge(0);
				response.addCookie(cookies[i]);
			}
		}
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		Object obj = modelAndView.getModel().get("vo");

		String suseCookie = request.getParameter("useCookie");
		boolean useCookie = Boolean.valueOf(suseCookie);
		
		
		if(obj != null) {
			if(useCookie == true) {
				String id = ((memberVO)obj).getId(); 
				
				String jsid = session.getId();
				Cookie loginCookie = new Cookie("loginCookie", jsid);
				loginCookie.setPath("/");
				loginCookie.setMaxAge(60*2);
				response.addCookie(loginCookie);
				
				long validtime = System.currentTimeMillis()+1000*60*2;
				
				mService.updateJsidNvalidtime(jsid, validtime, id);
			}
			session.removeAttribute("login_failed");
			
			session.setAttribute("login", obj);
			
			String dest = (String) session.getAttribute("dest");
			session.removeAttribute("dest");
			response.sendRedirect(dest!=null?dest:"/");
		} else {
			
			session.setAttribute("login_failed", "로그인 정보가 틀렸습니다. 다시 확인해주세요.");
			
			response.sendRedirect("/member/login/login");
			
		}
		
	}


	
	
}
