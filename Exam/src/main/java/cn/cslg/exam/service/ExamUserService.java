package cn.cslg.exam.service;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.ExamUserDAO;
import cn.cslg.exam.model.ExamUser;

@Service
public class ExamUserService {

	@Autowired
	private ExamUserDAO dao;

	public boolean exists(ExamUser eu){
		//如果该试卷已经有该用户！
		List<ExamUser> eus = dao.findByUidEid(eu.getUid(), eu.getEid());
		if(eus.size()==0)
			return false;
		return true;
	}

	public Serializable save(ExamUser eu) {
		return dao.save(eu);
	}
	public ExamUser findById(int id) {
		return dao.findById(id);
	}
	public List<ExamUser> findByEid(Object id) {
		return dao.findByProperty("eid", id);
	}
	public List<ExamUser> findByUid(Object id) {
		return dao.findByProperty("uid", id);
	}
	public void updateExamUser(ExamUser eu){
		dao.update(eu);
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
	public boolean delExamUserById(int id){
		ExamUser eu = dao.findById(id);
		//找不到用户
		if(eu==null)
			return false;
		try{
			dao.delete(eu);
			return true;
		}catch(Exception e){
			return false;
		}
	}

}
