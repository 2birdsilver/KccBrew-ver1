package kr.co.kccbrew.comm.interceptor.component;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.ModelAndViewDefiningException;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Component
public class CertificationInterceptor extends Interceptor { 
	/**
	 * 클라이언트 요청을 컨트롤러에 전달 전
	 * 세션 값, 계정 권한 체크
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		System.out.println("ss");
		if(session==null) {
			 ModelAndView modelAndView = new ModelAndView("redirect:/");
             modelAndView.addObject("msgCode", "세션이 만료되어 로그아웃 되었습니다. 다시 로그인 해주세요.");
             throw new ModelAndViewDefiningException(modelAndView);
		}
		return true;
	}
	/**
	 * API 접근한 IP 세션에 저장
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		HttpSession session = request.getSession();
		String ip = getClientIp(request);
		session.setAttribute("userIp", ip);
	}
}