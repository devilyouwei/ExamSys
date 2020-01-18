package cn.cslg.exam.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import cn.cslg.exam.model.Exam;
import cn.cslg.exam.model.ExamUser;
import cn.cslg.exam.model.User;
import cn.cslg.exam.service.ExamService;
import cn.cslg.exam.service.ExamUserService;
import cn.cslg.exam.service.UserService;

@Controller
@RequestMapping("/Admin")
public class AdminController {
	@Autowired
	private UserService userService;
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamUserService examUserService;

	private int PAGE_SIZE = 2;

	// 试卷管理
	@RequestMapping("/")
	public ModelAndView index(String cpage, HttpSession s) {
		int rows = PAGE_SIZE;
		String cPage = cpage == null ? "0" : cpage;
		ModelAndView mv;

		if (s.getAttribute("admin") == null)
			return new ModelAndView("redirect:/");

		List<Exam> exams;
		try {
			exams = examService.findExamsByPage(Integer.parseUnsignedInt(cPage), rows);
		} catch (NumberFormatException e) {
			exams = examService.findExamsByPage(0, rows);
		}
		int pages = examService.getPages(rows);

		mv = new ModelAndView("admin/index");
		mv.addObject("EXAMS", exams); // 试卷总数
		mv.addObject("PAGES", pages); // 总页数
		mv.addObject("CPAGE", cPage); // 当前页
		return mv;
	}

	// 删除试卷
	@RequestMapping("/delExam")
	public String delExam(String cpage, int id, HttpSession s) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		examService.DelExamById(id);
		return "redirect:/Admin/?cpage=" + cpage;
	}

	@RequestMapping("/addExamUser")
	public ModelAndView addExamUser(String cpage, int eid, HttpSession s) {
		int rows = PAGE_SIZE;
		String cPage = cpage == null ? "0" : cpage;

		if (s.getAttribute("admin") == null)
			return new ModelAndView("redirect:/");

		List<ExamUser> eus = examUserService.findByEid(eid);
		Exam exam = examService.findExamById(eid);
		List<User> us = userService.findUsersByPage(Integer.valueOf(cPage), rows);
		int pages = userService.getPages(rows);
		ModelAndView mv = new ModelAndView("admin/add_exam_user");
		mv.addObject("EU", eus);
		mv.addObject("USERS", us);
		mv.addObject("EXAM", exam);
		mv.addObject("PAGES", pages); // 总页数
		mv.addObject("CPAGE", cPage); // 当前页
		return mv;

	}

	// 向考试中添加一个学生
	@RequestMapping("/addOneUser")
	public String addOneUser(int uid, String cpage, int eid, HttpSession s) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		User user = userService.findUserById(uid);
		Exam exam = examService.findExamById(eid);
		if (user == null || exam == null)
			return "redirect:/Admin/addExamUser?cpage=" + cpage + "&eid=" + eid;

		ExamUser eu = new ExamUser();
		eu.setEid(exam.getId());
		eu.setUid(user.getId());
		if (!examUserService.exists(eu)) {
			eu.setCreateTime(getTimeStamp());
			eu.setDone(false);
			eu.setScore(0);
			eu.setUsername(user.getUsername());
			eu.setTitle(exam.getTitle());
			eu.setTime(exam.getTime());
			examUserService.save(eu);
		}
		return "redirect:/Admin/addExamUser?cpage=" + cpage + "&eid=" + eid;
	}

	@RequestMapping("/delExamUser")
	public String delExamUser(int id, HttpSession s, String cpage, int eid) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		examUserService.delExamUserById(id);
		return "redirect:/Admin/addExamUser?eid=" + eid + "&cpage=" + cpage;
	}

	// 管理用户
	@RequestMapping("/showUser")
	public ModelAndView showUser(String cpage, HttpSession s) {
		int rows = PAGE_SIZE;
		String cPage = cpage == null ? "0" : cpage;
		ModelAndView mv;

		if (s.getAttribute("admin") == null)
			return new ModelAndView("redirect:/");

		List<User> users;
		try {
			users = userService.findUsersByPage(Integer.parseUnsignedInt(cPage), rows);
		} catch (NumberFormatException e) {
			users = userService.findUsersByPage(0, rows);
		}
		int pages = userService.getPages(rows);
		mv = new ModelAndView("admin/show_users");
		mv.addObject("USERS", users); // 用户总数
		mv.addObject("PAGES", pages); // 总页数
		mv.addObject("CPAGE", cPage); // 当前页
		return mv;
	}

	@RequestMapping("/delUser")
	public String delUser(String cpage, int id, HttpSession s) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		userService.delUserById(id);
		return "redirect:/Admin/showUser?cpage=" + cpage;
	}

	@RequestMapping("/addExam")
	public String addExam(HttpSession s) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		return "admin/add_exam";
	}

	// 用户提交试卷
	@RequestMapping("/doAddExam")
	public String doAddExam(HttpSession s, Exam exam) {
		if (s.getAttribute("admin") == null)
			return "redirect:/";

		if (exam.getTitle().equals(""))
			return "redirect:/Admin/addExam";

		// 转成秒级
		exam.setCreateTime(getTimeStamp());
		exam.setTitle(exam.getTitle().trim());
		examService.save(exam);
		return "redirect:/Admin/";
	}

	private int getTimeStamp() {
		String ts = String.valueOf(System.currentTimeMillis());
		return Integer.valueOf(ts.substring(0, ts.length() - 3));

	}
}
