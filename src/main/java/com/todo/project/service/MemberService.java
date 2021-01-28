package com.todo.project.service;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.todo.project.dao.MemberDAO;

@Service
public class MemberService {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberDAO dao;
	
	//--------------------------회원가입------------------------------------------------------------------
	public ModelAndView join(HashMap<String, Object> params) {
		int success = dao.join(params);
		
		String msg = "가입에 실패했습니다.";
		String page = "joinForm";
		
		if(success>0) {
			msg = "가입에 성공했습니다! 일년동안 힘내봐요!";
			page = "Main";
		}
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("msg",msg);
		mav.setViewName(page);
		return mav;
	}
	//----------------------아이디 중복확인-----------------------------------------------------------------
	public HashMap<String,Object> dbchk(String id) {
		int cnt = dao.dbchk(id);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("cnt", cnt);
		return map;
	}
	//----------------------------로그인------------------------------------------------------------------
	public ModelAndView login(String id, String pw, HttpSession session, RedirectAttributes rAttr) {
		int cnt = dao.login(id,pw);
		
		ModelAndView mav = new ModelAndView();
		String page = "Main";
		String msg = "로그인에 실패했습니다.";

		if(cnt>0) {
		session.setAttribute("loginid", id);
		msg = "로그인 성공했습니다.";
		page = "redirect:/";
		}

		rAttr.addFlashAttribute("msg", msg);		
		mav.setViewName(page);
		
		return mav;
	}

}
