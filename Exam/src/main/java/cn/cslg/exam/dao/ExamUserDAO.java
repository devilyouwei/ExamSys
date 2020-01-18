package cn.cslg.exam.dao;

import java.util.List;

import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.cslg.exam.model.ExamUser;


@Repository
public class ExamUserDAO extends BaseDAO<ExamUser>{

	@Transactional
	public List<ExamUser> findByUidEid(int uid,int eid){
		String hql = "from " + entityClassName + " as model where model.uid="+uid+" and model.eid="+eid;
		@SuppressWarnings("unchecked")
		Query<ExamUser> query = getSessionFactory().getCurrentSession().createQuery(hql);
		List<ExamUser> list = query.getResultList();
		return list;
	}
}
