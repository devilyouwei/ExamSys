package cn.cslg.exam.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.ExamDAO;
import cn.cslg.exam.model.Exam;

@Service
public class ExamService {

	@Autowired
	private ExamDAO dao;

	public Serializable save(Exam e) {
		return dao.save(e);
	}

	public List<Exam> findExamsByPage(int cpage, int rows) {
		return dao.findByPage(cpage, rows);
	}
	public Exam findExamById(int id){
		return dao.findById(id);
	}

	// 总页数
	public int getPages(int rows) {
		int count = dao.count();
		if (count % rows == 0) {
			return count / rows;
		} else {
			return count / rows + 1;
		}
	}
	//删除
	public boolean DelExamById(int id){
		Exam exam = dao.findById(id);
		//找不到用户
		if(exam==null)
			return false;
		try{
			dao.delete(exam);
			return true;
		}catch(Exception e){
			return false;
		}
	}
}
