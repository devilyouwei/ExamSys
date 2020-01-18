package cn.cslg.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.QJudgeDAO;
import cn.cslg.exam.model.QJudge;

@Service
public class QJudgeService{
	@Autowired
	private QJudgeDAO dao;

	@SuppressWarnings("unchecked")
	public List<QJudge> findQJudgeByRand(int limit) {
		return QService.doFind(dao,limit);

	}

	
}
