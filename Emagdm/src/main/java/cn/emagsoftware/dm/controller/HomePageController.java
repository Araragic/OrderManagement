package cn.emagsoftware.dm.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.emagsoftware.dm.bean.Requirement;
import cn.emagsoftware.dm.bean.ReturnData;
import cn.emagsoftware.dm.dao.RequirementMapper;
import cn.emagsoftware.dm.dao.ScheduleMapper;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/homepage/*")
public class HomePageController {
	
	Logger log = Logger.getLogger(HomePageController.class);

	@Autowired
	private RequirementMapper requirementMapper;
	
	@Autowired
	private ScheduleMapper schedulMapper;
	
	@RequestMapping(value = "home")
	public String HomePage() {
		return "index/homepage";
	}

	@RequestMapping(value = "search", method = RequestMethod.POST)
	public// @ResponseBody 这个注解可以直接将返回的数据转换成json格式，但是需要特定的jar包
	@ResponseBody ReturnData search(
			// 该方法中的参数都是，首页表格可以主动返回的参数，可以再首页表格配置中进行配置
			@RequestParam(value = "search", required = false) Boolean search,
			@RequestParam(value = "filters", required = false) String filters,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "rows", required = false) Integer rows,
			@RequestParam(value = "sidx", required = false) String sidx,
			@RequestParam(value = "sord", required = false) String sord,
			HttpSession session) {

		ReturnData returnData = new ReturnData();
		List<Requirement> requirementList = new ArrayList<Requirement>();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		if (!search) {// 当search为false的时候是默认查询
			try {
				// 调用主页的默认查询方法
				Map<String, Object> map = new HashMap<String, Object>();
				int startPage = (page - 1) * rows;
				map.put("startPage", startPage);
				map.put("rows", rows);
				map.put("id", sidx);
				map.put("sord", sord);
				requirementList = requirementMapper.defaultSearch(map);
				
				if (!requirementList.isEmpty()) {
					for (Requirement requirement : requirementList) {
						// 从数据库中取到的时间要先转换成string传入bean中，这样页面返回json数据的时候时间才能显示正常
						requirement.setOnlineDate(sdf.format(requirement
								.getOnline_date()));
						requirement.setCreateTime(sdf2.format(requirement
								.getCreate_time()));
						requirement.setUpdateTime(sdf2.format(requirement
								.getUpdate_time()));
					}
					int records = requirementList.get(0).getTotalRecords();
					int totalPage = records % rows == 0 ? records / rows : records / rows + 1;
					returnData.setPage(page);
					returnData.setTotal(totalPage);
					returnData.setRecords(requirementList.get(0).getTotalRecords());
					returnData.setData(requirementList);
				}
			} catch (Exception e) {
				log.error("主页默认查询出错！ " + e.toString());
			}
			return returnData;
		} else {
			// 这里是带条件查询
			try {
				// filters参数(即查询参数)是通过前台传入的，可以进行更改
				String[] stringArray = filters.split(",");
				String requirement_num = stringArray[0].substring(1);
				String manager = stringArray[1];
				String title = stringArray[2];
				String status = stringArray[3];
				int module = Integer.parseInt(stringArray[4]);
				String leftDate = stringArray[5];
				String rightDate = stringArray[6].substring(0,stringArray[6].length() - 1);

				Map<String, Object> map = new HashMap<String, Object>();
				int startPage = (page - 1) * rows;
				map.put("startPage", startPage);
				map.put("rows", rows);
				map.put("requirement_num", requirement_num);
				map.put("manager", manager);
				map.put("title", title);
				map.put("status", status);
				map.put("module", module);
				map.put("leftDate", leftDate);
				map.put("rightDate", rightDate);

				// 调用带条件查询的方法，mybatis中使用动态sql
				requirementList = requirementMapper.searchByConditions(map);
				if (!requirementList.isEmpty()) {
					for (Requirement requirement : requirementList) {
						// 从数据库中取到的时间要先转换成string传入bean中，这样页面返回json数据的时候时间才能显示正常
						requirement.setOnlineDate(sdf.format(requirement
								.getOnline_date()));
						requirement.setCreateTime(sdf2.format(requirement
								.getCreate_time()));
						requirement.setUpdateTime(sdf2.format(requirement
								.getUpdate_time()));
					}
					int records = requirementList.get(0).getTotalRecords();
					int totalPage = records % rows == 0 ? records / rows
							: records / rows + 1;
					returnData.setPage(page);
					returnData.setTotal(totalPage);
					returnData.setRecords(requirementList.get(0)
							.getTotalRecords());
					returnData.setData(requirementList);
				}
			} catch (Exception e) {
				log.error("HomePageController带条件查询报错" + e.toString());
			}
			return returnData;
		}
	}

	@RequestMapping(value = "downloadPage")
	public ModelAndView download(int id) {
		ModelAndView mv = new ModelAndView();
		List<String> fileNameList = requirementMapper.downloadByID(id);
		if (!fileNameList.isEmpty()) {
			mv.addObject("fileNameList", fileNameList);
			mv.setViewName("other/download");
		} else {
			fileNameList.add("还未有人上传任何文档");
			mv.addObject("fileNameList", fileNameList);
			mv.setViewName("other/download");
		}
		return mv;
	}

	@RequestMapping(value = "downloadFile")
	public void downloadFile(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			String fileName = new String(request.getParameter("fileName").getBytes("iso-8859-1"), "utf-8");
			String realPath = request.getSession().getServletContext().getRealPath("/upload");
			File file = new File(realPath + "/" + fileName);
			FileInputStream fileInput = new FileInputStream(file);
			byte[] buffer = new byte[fileInput.available()];
			fileInput.read(buffer);
			fileInput.close();
			response.reset();
			response.addHeader("Content-Disposition", "attachment;filename="
					+ new String(
							fileName.replaceAll(" ", "").getBytes("utf-8"),
							"iso8859-1"));
			response.addHeader("Content-Length", "" + file.length());
			OutputStream os = new BufferedOutputStream(
					response.getOutputStream());
			response.setContentType("application/octet-stream");
			os.write(buffer);
			os.flush();
			os.close();
		} catch (Exception e) {
			log.error("下载文件报错" + e.toString());
			try {
				response.sendRedirect("/Emagdm/homepage/downloadFail");
			} catch (IOException e1) {
			}
		}
	}
	
	@RequestMapping(value = "/downloadFail", method = { RequestMethod.GET })
	public String downloadFail(Model model) {
		return "other/emptyrecords";
	}
}