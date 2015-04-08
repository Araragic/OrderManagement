package cn.emagsoftware.dm.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import cn.emagsoftware.dm.bean.User;
import cn.emagsoftware.dm.dao.UserMapper;
import cn.emagsoftware.dm.service.UserService;


@Service
public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userDao;

	public User getUserByName(String username) {
		User user=  new User();
		user.setUsername(username);
		return userDao.getUserByName(user.getUsername()) ;
	}

	public List<User> getUserList() {
		return userDao.getUserList();
	}
	
}
