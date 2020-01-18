package cn.cslg.exam.service;

import cn.cslg.exam.dao.UserDAO;
import cn.cslg.exam.model.User;
import cn.cslg.exam.security.MD5;

import java.io.Serializable;
import java.io.UnsupportedEncodingException;
import java.security.NoSuchAlgorithmException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

	@Autowired
	private UserDAO dao;

	// 判断用户是否存在
	public boolean exsits(String username) {
		List<User> users = dao.findByProperty("username", username);
		if (users.size() > 0)
			return true;
		else
			return false;
	}

	//保存用户
	public Serializable save(User u) throws UnsupportedEncodingException, NoSuchAlgorithmException {
		//加密密码
		u.setPassword(MD5.md5(u.getPassword()));
		return dao.save(u);
	}

	public User findByName(String username){
		List<User> users = dao.findByProperty("username", username);
		if(users.size()==0)
			return null;
		else
			return users.get(0);
	}
	public User findUserById(int id){
		return dao.findById(id);
	}

	public boolean delUserById(int id){
		User u = dao.findById(id);
		//找不到用户
		if(u==null)
			return false;
		try{
			dao.delete(u);
			return true;
		}catch(Exception e){
			return false;
		}
	}

	//管理员才能使用
	public List<User> findAllUsers(){
		List<User> users = dao.findAll();
		return users;
	}

	//按照页码查询
	public List<User> findUsersByPage(int cpage,int rows){
		return dao.findByPage(cpage, rows);
		
	}

	//总页数
	public int getPages(int rows){
		int count = dao.count();
		if(count%rows==0){
			return count/rows;
		}else{
			return count/rows+1;
		}
	}

}
