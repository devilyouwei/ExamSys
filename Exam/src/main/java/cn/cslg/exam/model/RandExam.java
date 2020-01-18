package cn.cslg.exam.model;

import java.util.List;

public class RandExam {
	private ExamUser examUser;		//考试基本信息
	//考试产生的临时随机
	private List<QSelect> qSelect;
	private List<QMulsel> qMulsel;
	private List<QFill> qFill;
	private List<QJudge> qJudge;
	private int time;

	public RandExam() {
	}

	public RandExam(ExamUser examUser, List<QSelect> qSelect, List<QMulsel> qMulsel, List<QFill> qFill,
			List<QJudge> qJudge, int time) {
		super();
		this.examUser = examUser;
		this.qSelect = qSelect;
		this.qMulsel = qMulsel;
		this.qFill = qFill;
		this.qJudge = qJudge;
		this.time = time;
	}

	public ExamUser getExamUser() {
		return examUser;
	}

	public void setExamUser(ExamUser examUser) {
		this.examUser = examUser;
	}

	public List<QSelect> getqSelect() {
		return qSelect;
	}

	public void setqSelect(List<QSelect> qSelect) {
		this.qSelect = qSelect;
	}

	public List<QMulsel> getqMulsel() {
		return qMulsel;
	}

	public void setqMulsel(List<QMulsel> qMulsel) {
		this.qMulsel = qMulsel;
	}

	public List<QFill> getqFill() {
		return qFill;
	}

	public void setqFill(List<QFill> qFill) {
		this.qFill = qFill;
	}

	public List<QJudge> getqJudge() {
		return qJudge;
	}

	public void setqJudge(List<QJudge> qJudge) {
		this.qJudge = qJudge;
	}

	public int getTime() {
		return time;
	}

	public void setTime(int time) {
		this.time = time;
	}

	//时间减少
	public void killTime(){
		this.time--;
	}

}