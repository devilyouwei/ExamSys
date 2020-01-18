package cn.cslg.exam.controller;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.cslg.exam.model.*;
import cn.cslg.exam.service.*;

@Controller
@RequestMapping("/User")
public class UserController {
	@Autowired
	private ExamService examService;
	@Autowired
	private ExamUserService examUserService;
	@Autowired
	private QSelectService qSelectService;
	@Autowired
	private QMulselService qMulselService;
	@Autowired
	private QFillService qFillService;
	@Autowired
	private QJudgeService qJudgeService;

	@RequestMapping("/")
	public ModelAndView index(HttpSession s) {
		// 如果是管理员。立即跳转到管理员页面
		if (s.getAttribute("admin") != null)
			return new ModelAndView("redirect:/Admin/");// 转发给管理员
		if (s.getAttribute("user") == null)
			return new ModelAndView("redirect:/");

		// 检查有没有正在做的试卷，有就进去做！
		if (s.getAttribute("randexam") != null)
			return new ModelAndView("redirect:/User/exam");

		User u = (User) s.getAttribute("user");
		List<ExamUser> eus = examUserService.findByUid(u.getId());
		ModelAndView mv = new ModelAndView("user/index");
		mv.addObject("EUS", eus);
		return mv;

	}

	@RequestMapping("/exam")
	public ModelAndView exam(HttpSession s, Integer id) {
		if (s.getAttribute("admin") != null)
			return new ModelAndView("redirect:/Admin/");// 转发给管理员
		if (s.getAttribute("user") == null)
			return new ModelAndView("redirect:/");

		// 当前存在未做完的试卷，有就先做当前试卷，并且忽略id请求
		if (s.getAttribute("randexam") != null) {
			RandExam r = (RandExam) s.getAttribute("randexam");
			ModelAndView mv = new ModelAndView("user/exam");
			mv.addObject("EXAM", r);
			return mv;
		}

		// 不存在正在做的试卷的session，又没有传入试卷id，那么直接弹出去
		if (id == null) {
			return new ModelAndView("redirect:/User/");
		}

		// 初次进入本场考试，进行初始化，产生随机题目
		ExamUser eu = examUserService.findById(id);
		User u = (User) s.getAttribute("user");

		// 防止做别人的试卷
		if (eu.getUid() != u.getId()) {
			return new ModelAndView("redirect:/User/");
		}
		// 做过的试卷不准做
		if (eu.isDone()) {
			return new ModelAndView("redirect:/User/");
		}

		// 取得试卷的模板
		Exam exam = examService.findExamById(eu.getEid());
		// 根据试卷模板生成随机题
		List<QSelect> selects = qSelectService.findQSelectByRand(exam.getCSelect());
		List<QMulsel> mulsel = qMulselService.findQMulselByLimitRand(exam.getCMultselect());
		List<QFill> fill = qFillService.findQFillByRand(exam.getCFill());
		List<QJudge> judge = qJudgeService.findQJudgeByRand(exam.getCTf());

		// 分别保存：考试基本信息，随机选择，随机段暄，随机填空。随机判断
		RandExam re = new RandExam(eu, selects, mulsel, fill, judge, eu.getTime());
		s.setAttribute("randexam", re); // session存储当前正在做的试卷
		// 开线程计时！后端安全
		new Thread() {
			@Override
			public void run() {
				// 根据考试时间设定线程沉睡时间
				try {
					while (re.getTime() > 0) {
						// 用户提交
						if (s.getAttribute("randexam") == null) {
							break;
						}
						re.killTime();
						s.setAttribute("randexam", re);
						Thread.sleep(1000);
					}
				} catch (InterruptedException e) {
					e.printStackTrace();
				} finally {
					s.setAttribute("randexam", null);
					System.out.println("时间到，交卷！");
				}
			}
		}.start();
		eu.setDone(true); // 置为已做
		examUserService.updateExamUser(eu); // 刷新数据
		ModelAndView mv = new ModelAndView("user/exam");

		mv.addObject("EXAM", re);
		return mv;
	}

	@ResponseBody
	@RequestMapping("/subExam")
	// 用户唯一提交分数获得成绩的方法，其他情况全部0分处理
	public String subForm(HttpSession s, @RequestParam(value = "select[]") String[] select,
			@RequestParam(value = "fill[]") String[] fill, @RequestParam(value = "mulsel[]") String[] mulsel,
			@RequestParam(value = "judge[]") String[] judge) {

		if (s.getAttribute("user") == null)
			return "nologin";

		RandExam re = (RandExam) s.getAttribute("randexam");
		if (re == null)
			return "lost";

		int score = checkAnswer((RandExam) s.getAttribute("randexam"), select, mulsel, fill, judge);
		ExamUser eu = re.getExamUser();
		eu.setScore(score);		//更新成绩
		examUserService.updateExamUser(eu);
		s.setAttribute("randexam", null);

		return "" + score;
	}

	// 处理答案，计分器，返回分数
	private int checkAnswer(RandExam r, String[] select, String[] mulsel, String[] fill, String[] judge) {
		int c_select = 0;
		int c_mulsel = 0;
		int c_fill = 0;
		int c_judge = 0;
		List<QSelect> rselect = r.getqSelect();
		List<QMulsel> rmulsel = r.getqMulsel();
		List<QFill> rfill = r.getqFill();
		List<QJudge> rjudge = r.getqJudge();

		if (select.length > 0)
			for (int i = 0; i < rselect.size(); i++) {
				if (rselect.get(i).getAnswer().equals(select[i]))
					c_select++;
			}

		if (mulsel.length > 0)
			for (int i = 0; i < rmulsel.size(); i++) {
				if (rmulsel.get(i).getAnswer().equals(mulsel[i]))
					c_mulsel++;
			}

		if (fill.length > 0)
			for (int i = 0; i < rfill.size(); i++) {
				if (rfill.get(i).getAnswer().equals(fill[i]))
					c_fill++;
			}

		if (judge.length > 0)
			for (int i = 0; i < rjudge.size(); i++) {
				if (rjudge.get(i).getAnswer().equals(judge[i]))
					c_judge++;
			}

		return c_select + c_mulsel + c_fill + c_judge;
	}

}
