package cn.emagsoftware.dm.controller;

import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FileUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import cn.emagsoftware.dm.bean.Requirement;
import cn.emagsoftware.dm.bean.Schedule;
import cn.emagsoftware.dm.dao.RequirementMapper;
import cn.emagsoftware.dm.dao.ScheduleMapper;
import cn.emagsoftware.dm.dao.UploadMapper;

@Controller
@RequestMapping("/requirement/*")
public class RequirementController {

	Logger log = Logger.getLogger(RequirementController.class);

	@Autowired
	private RequirementMapper requirementMapper;

	@Autowired
	private UploadMapper uploadMapper;

	@Autowired
	private ScheduleMapper scheduleMapper;

	@RequestMapping(value = "insert")
	public String inserRequirement() {
		return "requirement/insertrequirement";
	}

	/** 请求到修改页面，并赋参数 */
	@RequestMapping(value = "modifi")
	public ModelAndView modifirequirement(
			@RequestParam(value = "requirement_num", required = false) 
			String requirement_num,int id) {
		ModelAndView mv = new ModelAndView();
		Requirement requirement = requirementMapper.queryRequirementByID(requirement_num);
		List<String> fileNameList = requirementMapper.downloadByID(id);
		List<Schedule> scheduleList = scheduleMapper.getScheduleListByReID(requirement.getId());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		requirement.setOnlineDate(sdf.format(requirement.getOnline_date()));
		if (!scheduleList.isEmpty()) {
			for (Schedule schedule : scheduleList) {
				schedule.setOnlineDate(sdf.format(schedule.getOnline_date()));
				schedule.setCreateTime(sdf1.format(schedule.getCreate_time()));
				schedule.setUpdateTime(sdf1.format(schedule.getUpdate_time()));
			}
		}
		mv.addObject("list", scheduleList);
		mv.addObject("fileNameList", fileNameList);
		mv.addObject("requirement", requirement);
		mv.setViewName("requirement/modifirequirement");
		return mv;
	}

	/** 插入需求form的submit按钮 */
	@RequestMapping(value = "insertRequirement", method = RequestMethod.POST)
	public ModelAndView insertRequirement(Model model,
			@ModelAttribute("insertRequirement") Requirement requirement,
			@RequestParam("uploadFile") List<MultipartFile> file,
			HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时间
		Requirement req = requirementMapper
				.queryRequirementByID(requirement.getRequirement_num());
		try {
			if (req == null) {
			String username = (String) session.getAttribute("username");
			requirement.setCreate_user(username);
			requirement.setCreate_time(dt);
			requirement.setOnline_date(sdf.parse(requirement.getOnlineDate()));
			requirement.setUpdate_time(dt);
			requirement.setUpdate_user(requirement.getCreate_user());
			requirementMapper.insertRequirement(requirement);
			for (MultipartFile multipartFile : file) {
				if (!multipartFile.isEmpty()) {// 文件必定会上传，只是判断是否要更新数据库
					int numOfName = uploadMapper.selectFileByName(multipartFile
							.getOriginalFilename());
					if (numOfName == 0) { // 查询数据库是否已经存在此文件名
						map.put("fileName", multipartFile.getOriginalFilename());
						map.put("requirement_num",
								requirement.getRequirement_num());
						uploadMapper.insertFileName(map);
					}
					String realPath = request.getSession().getServletContext()
							.getRealPath("/upload");
					// 这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
					FileUtils.copyInputStreamToFile(
							multipartFile.getInputStream(),
							new File(realPath, multipartFile
									.getOriginalFilename()));
				}
			}
			log.info(username + " 在 " + sdf.format(dt) + "提交了标题为: " + requirement.getTitle() + " 的需求");
			}
			mv.addObject("requirement", requirement);
			mv.setViewName("requirement/insertsuc");
		} catch (Exception e) {
			log.error("插入需求错误! " + e.toString());
			mv.setViewName("other/fail");
		}
		return mv;
	}

	/** 修改需求submit按钮 */
	@RequestMapping(value = "modifiRequirement", method = RequestMethod.POST)
	public ModelAndView modifiRequirement(Model model,
			@ModelAttribute("modifiRequirement") Requirement requirement,
			@RequestParam("uploadFile") List<MultipartFile> file,
			HttpServletRequest request, HttpSession session)
			throws ParseException {

		ModelAndView mv = new ModelAndView();
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();// 如果不需要格式,可直接用dt,dt就是当前系统时间
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String username = (String) session.getAttribute("username");
		requirement.setUpdate_user(username);
		requirement.setOnline_date(sdf.parse(requirement.getOnlineDate()));
		requirement.setUpdate_time(dt);
		if (requirement.getStatus().equals("已完成")) {
			if (requirement.getNote().equals("")) {
				requirement.setNote(requirement.getNote() + username + "于"
						+ sdf.format(dt) + "将该需求修改为已完成状态");
			} else {
				requirement.setNote(requirement.getNote() + "," + username
						+ "于" + sdf.format(dt) + "将该需求修改为已完成状态");
			}
		}
		try {
			requirementMapper.updateRequirement(requirement);
			for (MultipartFile multipartFile : file) {
				if (!multipartFile.isEmpty()) {
					int num = uploadMapper.selectFileByName(multipartFile
							.getOriginalFilename());
					if (num == 0) {
						map.put("fileName", multipartFile.getOriginalFilename());
						map.put("requirement_num",
								requirement.getRequirement_num());
						uploadMapper.insertFileName(map);
					}
					String realPath = request.getSession().getServletContext()
							.getRealPath("/upload");
					// 这里不必处理IO流关闭的问题，因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉，我是看它的源码才知道的
					FileUtils.copyInputStreamToFile(
							multipartFile.getInputStream(),
							new File(realPath, multipartFile
									.getOriginalFilename()));
				}
			}
			log.info(username + " 在 " + sdf.format(dt) + "修改了了标题为: " + requirement.getTitle() + " 的需求");
			mv.setViewName("requirement/modifisuc");
		} catch (Exception e) {
			log.error("修改需求错误! " + e.toString());
			mv.setViewName("other/fail");
		}
		return mv;
	}

	@RequestMapping(value = "deleteRequirement", method = {RequestMethod.POST,RequestMethod.GET})
	public String deleteRequirement(int id,HttpServletRequest request) {
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		try {
			requirementMapper.deleteRequirementById(id);
			scheduleMapper.deleteScheduleBy_ReId(id);// 对应上线工单也会删除
			deleteFileByNum(id, realPath);
			return "index/homepage";
		} catch (Exception e) {
			log.error("删除需求失败! " + e.toString());
			return "other/fail";
		}
	}

	/** 主表快速修改完成 */
	@RequestMapping(value = "finRequirement", method = RequestMethod.POST)
	public String finRequirement(int id, String status, String note,
			HttpSession session) {
		Map<String, Object> map = new HashMap<String, Object>();
		Date dt = new Date();
		String username = (String) session.getAttribute("username");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		try {
			if (status.equals("已完成")) {
				if (note.equals("")) {
					note = note + username + "于" + sdf.format(dt)
							+ "将该需求修改为已完成状态";
				} else {
					note = note + "," + username + "于" + sdf.format(dt)
							+ "将该需求修改为已完成状态";
				}
			}
			map.put("id", id);
			map.put("status", status);
			map.put("note", note);
			map.put("update_user", username);
			map.put("update_time", dt);
			requirementMapper.finRequirement(map);
			return "index/homepage";
		} catch (Exception e) {
			log.error("快速修改需求错误! " + e.toString());
			return "other/fail";
		}

	}

	@RequestMapping(value = "checkRequirementNum")
	@ResponseBody
	public boolean isExist(String requirement_num) {
		Requirement requirement = requirementMapper
				.queryRequirementByID(requirement_num);
		if (requirement != null) {
			return false;
		} else {
			return true;
		}
	}

	@RequestMapping(value = "checkRequirementNumAndId")
	@ResponseBody
	public boolean checkRequirementNumAndId(String requirement_num, Integer id) {
		Map<String, Object> map = new HashMap<String, Object>();
		Requirement requirementQuery = null;
		map.put("requirement_num", requirement_num);
		map.put("id", id);
		try {
			requirementQuery = requirementMapper
					.queryRequirementByNumAndId(map);
		} catch (Exception e) {
		}
		if (requirementQuery == null) {
			return true;
		} else {
			return false;
		}
	}
	
	@RequestMapping(value = "deleteFile", method = RequestMethod.GET)
	@ResponseBody
	public boolean deleteFile(String fileName,HttpServletRequest request){
		String realPath = request.getSession().getServletContext().getRealPath("/upload");
		boolean flag = false;
		try { 
			String fileName1 = new String(fileName.getBytes("iso-8859-1"), "utf-8");
			realPath = realPath + "/"+ fileName1;
			System.out.println(realPath);
			int result = requirementMapper.deleteFile(fileName1);
			if(result == 1){
				FileUtils.deleteQuietly(new File(realPath));
				flag = true;
			}
		} catch (Exception e) {
			log.error("删除文件失败! " + e.toString());
		}
		return flag;
	}

	private void deleteFileByNum(int id,String realPath) {
		try { 
			List<String> list = requirementMapper.downloadByID(id);
			for(String fileName : list){
			requirementMapper.deleteFile(fileName);
			FileUtils.deleteQuietly(new File(realPath + "/" + fileName));
			}
		} catch (Exception e) {
			log.error("删除文件失败! " + e.toString());
		}
	}
	
}