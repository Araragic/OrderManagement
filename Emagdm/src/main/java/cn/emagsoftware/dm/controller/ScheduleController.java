package cn.emagsoftware.dm.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.emagsoftware.dm.bean.ReturnData;
import cn.emagsoftware.dm.bean.Schedule;
import cn.emagsoftware.dm.dao.ScheduleMapper;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/schedule/*")
public class ScheduleController {
	
	Logger log = Logger.getLogger(ScheduleController.class);
	
	@Autowired
	private ScheduleMapper scheduleMapper;

	@RequestMapping(value = "insert")
	public ModelAndView insertschedule(HttpServletRequest req, int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("id", id);
		mv.setViewName("schedule/insertschedule");
		return mv;
	}

	@RequestMapping(value = "modifi")
	public ModelAndView modifischedule(String schedule_num) {
		ModelAndView mv = new ModelAndView();
		try{
			if(schedule_num != null){
				Schedule schedule = scheduleMapper.getScheduleByNum(schedule_num);
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				schedule.setOnlineDate(sdf.format(schedule.getOnline_date()));
				mv.addObject("schedule", schedule);
				mv.setViewName("schedule/modifischedule");
			}
		}catch(Exception e){
			log.error("从修改需求页面跳修改工单页面报错" + e.toString());
		}
		return mv;
	}
	
	/** 点表格+按钮，查询子表*/
	@RequestMapping(value = "getScheduleListByReID", method = RequestMethod.GET)
	public @ResponseBody
	ReturnData getScheduleListByReID(
			@RequestParam(value = "id", required = true) int id,
			@RequestParam(value = "_search", required = false) boolean search,
			HttpSession session) {

		List<Schedule> scheduleList = null;
		ReturnData returnData = new ReturnData();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		scheduleList = scheduleMapper.getScheduleListByReID(id);
		if (!scheduleList.isEmpty()) {
			for (Schedule schedule : scheduleList) {
				schedule.setOnlineDate(sdf.format(schedule.getOnline_date()));
				schedule.setCreateTime(sdf1.format(schedule.getCreate_time()));
				schedule.setUpdateTime(sdf1.format(schedule.getUpdate_time()));
			}
			returnData.setData(scheduleList);
		} else {
			Schedule s = new Schedule();
			s.setSchedule_num("");
			s.setModuleName("未查到任何数据");
			scheduleList.add(s);
			returnData.setData(scheduleList);
		}
		return returnData;
	}
	
	
	@RequestMapping(value = "/insertSchedule", method = RequestMethod.POST)
	public ModelAndView insertSchedule(
			@ModelAttribute("insertSchedule") Schedule schedule,HttpSession session){
		ModelAndView mv = new ModelAndView();
		String username = (String) session.getAttribute("username");
		schedule.setCreate_user(username);
		Date dt = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		schedule.setCreate_time(dt);
		schedule.setUpdate_user(schedule.getCreate_user());
		schedule.setUpdate_time(schedule.getCreate_time());
		schedule.setDelete_flag(0);
		System.out.println(schedule.getModule_id());
		Schedule sch= scheduleMapper.getScheduleByNum(schedule.getSchedule_num());
		try {
			if (sch == null) {
			schedule.setOnline_date(sdf.parse(schedule.getOnlineDate()));
			scheduleMapper.insertSchedule(schedule);
			log.info("insertSchedule插入成功");
			}
			mv.setViewName("schedule/insertsuc");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			log.error(e.toString()+"insertSchedule插入失败");
			mv.setViewName("other/fail");
		}
		mv.addObject("schedule", schedule);
		return mv;
	}

	@RequestMapping(value = "/modifiSchedule", method = RequestMethod.POST)
	public ModelAndView modifiRequirement(
			@ModelAttribute("modifiSchedule") Schedule schedule,HttpSession session){
		String username = (String) session.getAttribute("username");
		ModelAndView mv = new ModelAndView();
		Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		schedule.setUpdate_user(username);
		try {
			schedule.setOnline_date(sdf.parse(schedule.getOnlineDate()));
			schedule.setUpdate_time(dt);
			scheduleMapper.updateSchedule(schedule);
			mv.setViewName("schedule/modifisuc");
			log.info("modifiSchedule插入成功");
		}catch(Exception e){
			// TODO Auto-generated catch block
			mv.setViewName("other/fail");
			log.error(e.toString()+"modifiSchedule插入失败");
		}	
		return mv;
	}
    
	/**从主页删除 */
	@RequestMapping(value = "deleteSchedule", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteSchedule(int id,HttpServletRequest request) {
		String flag = "";
		int moduleId1 = (Integer)request.getSession().getAttribute("moduleId");
		int moduleId2 = scheduleMapper.getModuleIDByScheduleID(id);
		if(moduleId1 == moduleId2){
			try{
				scheduleMapper.deleteSchedule(id);
				log.info("删除上线工单成功");
				flag =  "index/homepage";
			}catch(Exception e){
				log.error(e.toString() + "删除上线工单失败");
				flag = "other/fail";
			}
		}else{
			flag = "other/fail";
		}
		return flag;
	}
	
	/**从修改需求工单页面删除 */
	@RequestMapping(value = "deleteSchedule2", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteSchedule2(int id,HttpServletRequest request) {
		boolean flag = false;
		int moduleId1 = (Integer)request.getSession().getAttribute("moduleId");
		int moduleId2 = scheduleMapper.getModuleIDByScheduleID(id);
		if(moduleId1 == moduleId2){
			try{
				int result = scheduleMapper.deleteSchedule(id);
				if(result == 1){
					flag = true;
					log.info("删除上线工单成功");
				}
			}catch(Exception e){
				log.error(e.toString() + "删除上线工单失败");
			}
		}
		return flag;
	}
	
	@RequestMapping(value = "checkScheduleNum")
	@ResponseBody
	public boolean ScheduleNumExist(String schedule_num) {
		Schedule schedule= scheduleMapper.getScheduleByNum(schedule_num);
		if (schedule != null) {
			return false;
		} else {
			return true;
		}
	}
	
	
	@RequestMapping(value = "checkScheduleNumAndId")
   	@ResponseBody
   	public boolean checkScheduleNumAndId(String schedule_num,Integer id) {
	    Map<String, Object> map =new HashMap<String, Object>();
	    map.put("schedule_num", schedule_num);
 	    map.put("id",id);
 	    Schedule scheduleQuery =  scheduleMapper.queryScheduleByNumAndId(map);
	   	if (scheduleQuery == null) {
	   		return true;
	   	} else {
	   		return false;
	   	}
   	}
	
	/** 子表快速修改完成*/
	@RequestMapping(value = "finSchedule", method = RequestMethod.POST)
	public String finSchedule(int id, String status,String note,HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();
		String username = (String) session.getAttribute("username");
		map.put("id", id);
		map.put("status", status);
		map.put("update_user", username);
		map.put("update_time", dt);
		try{
		    scheduleMapper.finSchedule(map);
		    log.info("子表快速修改完成状态成功");
		    return "index/homepage";
		}catch(Exception e){
			log.error(e.toString() + "子表快速修改完成状态失败");
			return "other/fail";
		}
	}
}