package cn.cslg.exam.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.LockOptions;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Example;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import cn.cslg.exam.model.QMulsel;

@SuppressWarnings("all")
@Repository
public abstract class BaseDAO<T> {
	@Autowired
	private SessionFactory sessionFactory;

	@Autowired
	private HibernateTemplate hibernateTemplate;

	@Autowired
	private JdbcTemplate jdbcTemplate;

	protected Class entityClass;
	protected String entityClassName;

	public BaseDAO() {
		Type genType = getClass().getGenericSuperclass();
		Type[] params = ((ParameterizedType) genType).getActualTypeArguments();
		entityClass = (Class) params[0];
		entityClassName = entityClass.getSimpleName();
	}

	@Transactional
	public List<T> findAll() {
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + entityClassName;
		List<T> list = session.createQuery(hql).getResultList();
		return list;
	}

	// 新增分页功能
	// 传入当前页，每页行数
	@Transactional
	public List<T> findByPage(int cPage, int rows) {
		int start = cPage*rows;
		int limit = rows;
		Session session = sessionFactory.getCurrentSession();
		String hql = "from " + entityClassName;
		Query query = session.createQuery(hql);
		query.setFirstResult(start);
		query.setMaxResults(rows);
		return query.getResultList();
	}

	@Transactional
	public int count() {
		String hql = "select count(*) from " + entityClassName;
		Long count = (Long) sessionFactory.getCurrentSession().createQuery(hql).uniqueResult();
		return count.intValue();
	}

	@Transactional
	public T findById(Serializable id) {
		return (T) sessionFactory.getCurrentSession().get(entityClass, id);
	}

	@Transactional
	//传入随机的id数组
	public List<T> findByRandId(int[] ids) {
		List<Integer> list = new ArrayList<Integer>();
		for (int i : ids)
			list.add(i);
		String hql = "from " + entityClassName + " as model where model.id in(:ids)";
		return getSessionFactory().getCurrentSession().createQuery(hql).setParameter("ids", list).getResultList();
	}

	@Transactional
	public List<T> findByProperty(String propertyName, Object value) {
		String hql = "from " + entityClassName + " as model where model." + propertyName + "= :value";
		Query query = sessionFactory.getCurrentSession().createQuery(hql);
		query.setParameter("value", value);
		List list = query.getResultList();
		return list;
	}

	@Transactional
	public List<T> findByExample(T instance) {
		Example example = Example.create(instance);
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(entityClass).add(example);
		List results = criteria.list();
		return results;
	}

	@Transactional
	public Serializable save(T entity) {
		return sessionFactory.getCurrentSession().save(entity);
	}

	@Transactional
	public void update(T entity) {
		sessionFactory.getCurrentSession().update(entity);
	}

	@Transactional
	public void delete(T entity) {
		sessionFactory.getCurrentSession().delete(entity);
	}

	@Transactional
	public T merge(T entity) {
		return (T) sessionFactory.getCurrentSession().merge(entity);
	}

	@Transactional
	public void attachDirty(T entity) {
		sessionFactory.getCurrentSession().saveOrUpdate(entity);
	}

	@Transactional
	public void attachClean(T entity) {
		sessionFactory.getCurrentSession().buildLockRequest(LockOptions.NONE).lock(entity);
	}

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public HibernateTemplate getHibernateTemplate() {
		return hibernateTemplate;
	}

	public JdbcTemplate getJdbcTemplate() {
		return jdbcTemplate;
	}

}
