package cn.emagsoftware.dm.dao;

import cn.emagsoftware.dm.bean.Schedule;

import java.util.List;
import java.util.Map;


public interface ScheduleMapper {
	
	public List<Schedule> getScheduleListByReID(int ReID);
    
	public int insertSchedule(Schedule schedule);
	
	public int deleteSchedule(int id);
	
	public int updateSchedule(Schedule schedule);
	
	public int deleteScheduleBy_ReId(int requirement_id);
	
	public Schedule getScheduleByNum(String schedule_num);
	
	public Schedule queryScheduleByNumAndId(Map<String, Object> map);
	
	public int finSchedule(Map<String,Object> map);
	
	public Integer getModuleIDByScheduleID(int id);
	
}
