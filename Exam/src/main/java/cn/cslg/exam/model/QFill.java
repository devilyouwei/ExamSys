package cn.cslg.exam.model;
// Generated 2017-5-30 15:36:00 by Hibernate Tools 5.2.3.Final

/**
 * QFill generated by hbm2java
 */
public class QFill implements java.io.Serializable {

	private Integer id;
	private String ques;
	private String answer;

	public QFill() {
	}

	public QFill(String ques, String answer) {
		this.ques = ques;
		this.answer = answer;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getQues() {
		return this.ques;
	}

	public void setQues(String ques) {
		this.ques = ques;
	}

	public String getAnswer() {
		return this.answer;
	}

	public void setAnswer(String answer) {
		this.answer = answer;
	}

}