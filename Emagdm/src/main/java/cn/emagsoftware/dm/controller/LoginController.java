package cn.emagsoftware.dm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.emagsoftware.dm.bean.User;
import cn.emagsoftware.dm.dao.UserMapper;
import cn.emagsoftware.dm.service.impl.JavaMailServiceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;
import org.apache.log4j.Logger;

@Controller
public class LoginController {
    Logger log = Logger.getLogger(LoginController.class);
	
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private JavaMailServiceImpl javaMailServiceImpl;

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login(Model model) {
		if (!model.containsAttribute("contentModel"))
			model.addAttribute("contentModel", new User());
		return "index/login";
	}

	@RequestMapping(value = "/login")
	public String valit(HttpServletRequest request, Model model,
			@ModelAttribute("contentModel") User userGetFromInput,
			BindingResult result) {
		HttpSession session = request.getSession();
		session.setMaxInactiveInterval(3600);
		User user = userMapper.getUserByName(userGetFromInput.getUsername());
		session.setAttribute("username", userGetFromInput.getUsername());
		session.setAttribute("moduleId", user.getModuleId());
		boolean connected = javaMailServiceImpl.checkMail(
				userGetFromInput.getUsername(), userGetFromInput.getPassword());
		if (connected) {
			Date date =  new Date();
	    	SimpleDateFormat sdf= new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	    	sdf.format(date);
	    	log.info(session.getAttribute("username")+"在"+sdf.format(date)+"成功登录");
			return "redirect:/index/home";
		} else {
			result.addError(new FieldError("contentModel", "password",
					"输入的密码错误!"));
			log.error("输入密码错误"); 
			return login(model);
		}
	}

	@RequestMapping(value = "checkUser")
	@ResponseBody
	public boolean isExist(String username) {
		log.info("判断用户"+username+"是否存在");
		User user = userMapper.getUserByName(username);
		if (user != null) {
			log.info("用户存在");
			return false;
		} else {
			log.error("用户不存在");
			return true;
		}
	}
}
