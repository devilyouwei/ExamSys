package cn.cslg.exam.controller;

import cn.cslg.exam.model.User;
import cn.cslg.exam.security.MD5;
import cn.cslg.exam.service.UserService;

import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

//登录模块
@Controller
public class LoginController {

	@Autowired
	private UserService userService;

	@RequestMapping("/")
	public String login(HttpSession s) {
		if(s.getAttribute("user")!=null || s.getAttribute("admin")!=null){
			return "redirect:/User/";
		}
		return "user/login";
	}

	@RequestMapping("/register")
	public String register() {
		return "user/register";
	}

	@RequestMapping("/doRegister")
	public ModelAndView doRegister(User u) {
		ModelAndView mv;
		//去空格
		String username = u.getUsername().trim();
		String password = u.getPassword().trim();
		mv = new ModelAndView("user/register");
		if(username.equals("") || password.equals("")){
			mv.addObject("ERROR","用户名和密码不能为空！");
			return mv;
		}
		if (userService.exsits(username)) {
			mv.addObject("ERROR","用户已经存在！");
			return mv;
		}
		try {
			u.setAdmin(false);
			u.setUsername(username);
			u.setPassword(password);
			userService.save(u);
		} catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
			mv.addObject("ERROR","用户注册失败！");
		}
		mv.addObject("SUCCESS","注册成功！");
		return mv;
	}

	@RequestMapping("/doLogin")
	public ModelAndView doLogin(User u,HttpSession s) throws UnsupportedEncodingException, NoSuchAlgorithmException{
		ModelAndView mv = new ModelAndView("user/login");
		if(u.getUsername().equals("") || u.getPassword().equals("")){
			mv = new ModelAndView("user/login");
			mv.addObject("ERROR","请输入账号密码！");
			return mv;
		}
		User findUser = userService.findByName(u.getUsername());
		if(findUser==null){
			mv.addObject("ERROR","用户不存在！");
			return mv;
		}
		if(!MD5.md5(u.getPassword()).equals(findUser.getPassword())){
			mv.addObject("ERROR","密码错误！");
			return mv;
		}
		if(findUser.isAdmin()==true){
			mv.addObject("SUCCESS","登录成功，发现你是管理员大佬，马上跳转到管理员页");
			s.setAttribute("admin", findUser);
			return mv;
		}else{
			mv.addObject("SUCCESS","登录成功，发现你是普通人，马上去考试吧！");
			s.setAttribute("user", findUser);
			return mv;
		}
	}

	@RequestMapping("/logout")
	public String logout(HttpSession s) {
		s.setAttribute("user", null);
		s.setAttribute("admin", null);
		return "redirect:/";
	}
	@RequestMapping("/about")
	public String about(){
		return "about";
	}

}
