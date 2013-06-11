package com.horoppa.management.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import com.horoppa.management.dao.UserDAO;
import com.horoppa.management.domain.User;

@Controller
public class UserController extends MultiActionController {
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/login.html")
	public ModelAndView login(HttpServletRequest request,
			HttpServletResponse response, User user) {
		if ((user.getName() == null || user.getPassword() == null)) {
			ModelAndView ret = new ModelAndView("login");
			ret.addObject("message", "anynomious User");
			ret.addObject("userForm", user);
			return ret;
		} else {
			String userStr = user.getName();
			String password = user.getPassword();
			User newUser = userDAO.getUserByUserNameAndPassword(userStr,
					password);
			ModelAndView ret = new ModelAndView();
			if (newUser.getName() == null) {
				ret = new ModelAndView("employee");
				ret.addObject("message", "User " + userStr);
			} else {
				ret = new ModelAndView("index");
//				ret = new ModelAndView("userList");
//				ret.addObject("user", user);
//				ret.addObject("userList", userDAO.listUser());
			}
			return ret;
		}
	}

	@RequestMapping("/register.html")
	public ModelAndView register(HttpServletRequest request,
			HttpServletResponse response, User user) {
		ModelAndView ret = new ModelAndView("register");

		return ret;
	}

	@RequestMapping("/registerSave.html")
	public ModelAndView registerSave(HttpServletRequest request,
			HttpServletResponse response, User user) {
		userDAO.saveUser(user);
		User u = new User();
		ModelAndView ret = new ModelAndView("userList");
		ret.addObject("user", user);
		ret.addObject("userList", userDAO.listUser());
		return ret;
	}

	@RequestMapping("/add.html")
	public ModelAndView add(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println("Calling Add Employee...");
		return new ModelAndView("employee", "message", "Employee Added");

	}

	@RequestMapping("/delete.html")
	public ModelAndView delete(HttpServletRequest request,
			HttpServletResponse response, User user) throws Exception {
		System.out.println("Calling Delete Employee...");
		userDAO.delete(user);
		ModelAndView ret = new ModelAndView("userList");
		ret.addObject("user", user);
		ret.addObject("userList", userDAO.listUser());
		return ret;

	}

	@RequestMapping("/update.html")
	public ModelAndView update(HttpServletRequest request,
			HttpServletResponse response, User user) throws Exception {
		ModelAndView ret = new ModelAndView("update");
		ret.addObject("user", user);
		return ret;
	}

	@RequestMapping("/updateSave.html")
	public ModelAndView updateSave(HttpServletRequest request,
			HttpServletResponse response, User user) {
		ModelAndView ret = new ModelAndView("update");
		return ret;
	}

	@RequestMapping("/userList.html")
	public ModelAndView userList(HttpServletRequest request,
			HttpServletResponse response,User user) {
		ModelAndView ret = new ModelAndView("userList");
		ret.addObject("user", user);
		ret.addObject("userList", userDAO.listUser());
		return ret;
	}
}