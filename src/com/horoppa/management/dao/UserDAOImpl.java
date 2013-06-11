package com.horoppa.management.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate3.HibernateTemplate;
import com.horoppa.management.domain.User;

public class UserDAOImpl implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	private HibernateTemplate hibernateTemplate;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.hibernateTemplate = new HibernateTemplate(sessionFactory);
	}

	@Override
	public void saveUser(User user) {
		hibernateTemplate.saveOrUpdate(user);
	}

	@Override
	public void delete(User user) {
		hibernateTemplate.delete(user);
	}

	@Override
	public void update(User user) {
		hibernateTemplate.update(user);
	}

	public User getUserByUserNameAndPassword(String name, String password) {
		User user = new User();
		String queryName = "userForLogin";
		String[] paramNames = new String[2];
		paramNames[0] = "name";
		paramNames[1] = "password";
		Object[] values = new Object[2];
		values[0] = name;
	    values[1] = password;
		List<User> users = hibernateTemplate.findByNamedQueryAndNamedParam(queryName, paramNames, values);
		return users.get(0);
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<User> listUser() {
		return hibernateTemplate.findByNamedQuery("userList");
	}

}
