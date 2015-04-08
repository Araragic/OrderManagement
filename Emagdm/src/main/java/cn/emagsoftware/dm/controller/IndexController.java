package cn.emagsoftware.dm.controller;


import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/index/*")
public class IndexController {
	Logger log=  Logger.getLogger(IndexController.class);
    @RequestMapping(value = "home")
    public String HomePage(HttpSession session) {
        return "index/index";
    }
    
    @RequestMapping(value = "logout")
    public String Logout(HttpSession session) {
        log.info("请求到了logout");
        log.info(session.getAttribute("username")+"退出");
        
        session.removeAttribute("username");
        return "redirect:../login";
    }

}