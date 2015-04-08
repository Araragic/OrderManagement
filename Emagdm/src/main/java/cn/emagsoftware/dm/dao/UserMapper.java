package cn.emagsoftware.dm.dao;

import cn.emagsoftware.dm.bean.User;

import java.util.List;



public interface UserMapper {


	public User getUserByName(String username);
	

	public List<User> getUserList();
	
}
