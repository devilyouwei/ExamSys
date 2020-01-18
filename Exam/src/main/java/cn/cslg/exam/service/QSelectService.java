package cn.cslg.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.QSelectDAO;
import cn.cslg.exam.model.QSelect;

@Service
public class QSelectService{
	@Autowired
	private QSelectDAO dao;

	@SuppressWarnings("unchecked")
	public List<QSelect> findQSelectByRand(int limit) {
		return QService.doFind(dao,limit);

	}

	
}
