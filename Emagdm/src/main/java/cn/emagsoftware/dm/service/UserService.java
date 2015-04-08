package cn.emagsoftware.dm.service;


import java.util.List;

import cn.emagsoftware.dm.bean.User;

public interface UserService {

	/*
	 * fuyingkuo
	 */
	public User getUserByName(String username);
	
	/*
	 * fuyingkuo
	 */
	List<User> getUserList();
}
