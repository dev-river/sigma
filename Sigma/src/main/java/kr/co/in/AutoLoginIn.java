package kr.co.in;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.domain.memberVO;
import kr.co.service.memberService;

public class AutoLoginIn extends HandlerInterceptorAdapter{
	
	@Inject
	private memberService mService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Cookie[] arr = request.getCookies();
		Cookie loginCookie = null;
		
		if(arr!=null) {
			for(Cookie x : arr) {
				if(x.getName().equalsIgnoreCase("loginCookie")) {
					loginCookie = x;
					break;
				}
			}
			if(loginCookie != null) {
				String jsid = loginCookie.getValue();
				memberVO vo = mService.getmemberVO(jsid);
				
				long curTime = System.currentTimeMillis();
				
				if(vo.getValidtime()>curTime) {
					
					HttpSession session = request.getSession();
					
					session.setAttribute("login", vo);
					
					loginCookie.setMaxAge(60*60*24);
					response.addCookie(loginCookie);
					
					long validtime = curTime+1000*60*60*24;
					mService.timeUpdate(jsid, validtime);

				}else {

				}
			} 
		}
		return true;
	}


}
