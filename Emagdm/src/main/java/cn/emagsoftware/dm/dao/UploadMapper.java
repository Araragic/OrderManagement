package cn.emagsoftware.dm.dao;

import java.util.Map;

public interface UploadMapper {
	
	public int insertFileName(Map<String,Object> map);
	
	public int selectFileByName(String fileName);
	
	public int updateRequirement_num(Map<String,Object> map);

}
