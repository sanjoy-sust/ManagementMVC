package com.horoppa.management.dao;

import java.util.List;
import com.horoppa.management.domain.User;

public interface UserDAO {
	
	public void saveUser(User user) ;
	public List<User> listUser() ;
	public void update(User user);
	public void delete(User user);
	public User getUserByUserNameAndPassword(String name,String password);
}
