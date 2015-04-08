package cn.emagsoftware.dm.dao;

import cn.emagsoftware.dm.bean.Requirement;

import java.util.List;
import java.util.Map;



public interface RequirementMapper {
	/** 登陆主页的默认查询方法*/
	public List<Requirement> defaultSearch(Map<String,Object> map);
	
	/** 主页的待条件查询方法查询方法*/
	public List<Requirement> searchByConditions(Map<String,Object> map);
	
	public Requirement queryRequirementByID(String requirement_num);
	
	public int insertRequirement(Requirement requirement);
	
	public int deleteRequirementById(int id);
	
	public int updateRequirement(Requirement requirement);
	
	public int finRequirement(Map<String,Object> map);
	
	public List<String> downloadByID(int id);
	
	public Requirement queryRequirementByNumAndId(Map<String, Object> map);
	
	public int deleteFile(String fileName);
	
	public int deleteFileByNum(String requirement_num);
	
}
