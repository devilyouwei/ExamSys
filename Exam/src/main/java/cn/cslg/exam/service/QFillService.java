package cn.cslg.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.QFillDAO;
import cn.cslg.exam.model.QFill;

@Service
public class QFillService{
	@Autowired
	private QFillDAO dao;

	@SuppressWarnings("unchecked")
	public List<QFill> findQFillByRand(int limit) {
		return QService.doFind(dao,limit);
	}

	
}
