package kr.co.kccbrew.comm.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.kccbrew.comm.login.model.LogInVo;
import kr.co.kccbrew.comm.login.service.ILogInService;
import lombok.NoArgsConstructor;
import lombok.RequiredArgsConstructor;

/**
 * @ClassNmae : LogInContorller
 * @Decription : 로그인 기능을 관리하기 위한 controller
 * 
 * @   수정일               수정자             수정내용
 * ============      ==============     ==============
 * 2023-08-28			윤진호				최초생성
 * @author YUNJINHO
 * @version 1.0
 */
@Controller
@RequiredArgsConstructor
public class LogInController {
	/**
	 * loginService변수 생성
	 */
	private final ILogInService loginService;
	
	/** 로그인 페이지로 이동 */
	
	@RequestMapping(value="/loginpage" , method=RequestMethod.GET)
	public String login() {
		return "loginPage";
	}
	
	/** 로그인 처리 */
	@ResponseBody
	@RequestMapping(value="/login",method = RequestMethod.GET)
	public String login(String id, String pwd,Model model,HttpServletRequest httpServletRequest) {
		LogInVo vo = new LogInVo();
		vo.setUserId(id);
		vo.setUserPwd(pwd);
		LogInVo user=loginService.logIn(vo);
		System.out.println(user);
		if(user!=null && user.getUserId()!=null) {
			if(user.getApproveYn()!=null && user.getApproveYn().equals("Y")) {
				// 세션을 생성하기 전에 기존의 세션 파기
		        httpServletRequest.getSession().invalidate();
		        HttpSession session = httpServletRequest.getSession(true);  // Session이 없으면 생성
		        // 세션에 userId를 넣어줌
		        session.setAttribute("userTypeCd", user.getUserTypeCd());
		        session.setAttribute("userName", user.getUserNm());
		        session.setAttribute("userId", user.getUserId());
				session.setMaxInactiveInterval(1800); // Session이 30분동안 유지
				return "t";
			}else {
				return "n";
			}
		}else {
			return "f";
		}
	}
	
	/** 사용자 유형 코드 가져오기 **/
	@ResponseBody
	@RequestMapping(value="getUserTypeCd",method = RequestMethod.GET)
	public String getCd(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession(false);
		if(session != null) {
			String userTypeCd = (String) session.getAttribute("userTypeCd");
	        if (userTypeCd != null) {
	            return userTypeCd;
	        }
		}
		return "ERROR";
	}
	
	/** 사용자 이름 가져오기 **/
	@ResponseBody
	@RequestMapping(value="getUserName", method = RequestMethod.GET)
	public String getName(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession(false);
		String userName = (String)session.getAttribute("userName");
		return userName;
	}
	
	/** 사용자 아이디 가져오기 **/
	@ResponseBody
	@RequestMapping(value="getUserId", method = RequestMethod.GET)
	public String getId(HttpServletRequest httpServletRequest) {
		HttpSession session = httpServletRequest.getSession(false);
		String userId = (String)session.getAttribute("userId");
		return userId;
	}
}