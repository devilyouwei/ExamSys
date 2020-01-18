package cn.cslg.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.cslg.exam.dao.QMulselDAO;
import cn.cslg.exam.model.QMulsel;

@Service
public class QMulselService {
	@Autowired
	private QMulselDAO dao;

	@SuppressWarnings("unchecked")
	public List<QMulsel> findQMulselByLimitRand(int limit) {
		return QService.doFind(dao, limit);
	}

}
