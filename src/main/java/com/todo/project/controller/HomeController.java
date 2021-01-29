package com.todo.project.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.todo.project.service.MemberService;

@Controller
public class HomeController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService service;
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "Main";
	}
	
	//--------------------------회원가입폼-----------------------------------------------------------------
	@RequestMapping(value = "/joinForm", method = RequestMethod.GET)
	public String joinForm(Model model) {
		
		return "join";
	}

	//--------------------------회원가입-----------------------------------------------------------------
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public ModelAndView join(@RequestParam HashMap<String, Object> params) {
		logger.info("params : {}", params);
		return service.join(params);
	}
	//--------------------------아이디 중복확인------------------------------------------------------------
	@RequestMapping(value = "/dbchk", method = RequestMethod.GET)
	public@ResponseBody HashMap<String, Object> dbchk(@RequestParam String id) {
		return service.dbchk(id);
	}
	//------------------------------로그인---------------------------------------------------------------
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public ModelAndView login(@RequestParam String id, @RequestParam String pw, HttpSession session, RedirectAttributes rAttr) {
		return service.login(id,pw,session,rAttr);
	}
	//----------------------------로그아웃----------------------------------------------------------------
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session, Model model) {
		session.removeAttribute("loginid");
		model.addAttribute("msg","로그아웃 되었습니다.");
		return "Main";
	}
	@RequestMapping(value = "/quarter", method = RequestMethod.GET)
	public ModelAndView quarter(Model model, @RequestParam String type) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("type",type);
		mav.setViewName("quarter");
		return mav;
	}
}
