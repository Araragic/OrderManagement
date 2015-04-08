package cn.emagsoftware.dm.bean;

import java.util.Date;

public class Schedule {
	
	private int id;
	private String version;
	private String status;
	private int requirement_id;
	private int module_id;
	private Date online_date;
	private String onlineDate;
	private String create_user;
	private Date create_time;
	private String createTime;
	private String update_user;
	private Date update_time;
	private String updateTime;
	private String schedule_num;
	private int delete_flag;
	private String moduleName;
	
	public String getSchedule_num() {
		return schedule_num;
	}

	public void setSchedule_num(String schedule_num) {
		this.schedule_num = schedule_num;
	}

	public int getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(int delete_flag) {
		this.delete_flag = delete_flag;
	}

	public Schedule(){}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public int getRequirement_id() {
		return requirement_id;
	}

	public void setRequirement_id(int requirement_id) {
		this.requirement_id = requirement_id;
	}

	public int getModule_id() {
		return module_id;
	}

	public void setModule_id(int module_id) {
		this.module_id = module_id;
	}

	public Date getOnline_date() {
		return online_date;
	}

	public void setOnline_date(Date online_date) {
		this.online_date = online_date;
	}

	public String getOnlineDate() {
		return onlineDate;
	}

	public void setOnlineDate(String onlineDate) {
		this.onlineDate = onlineDate;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public String getModuleName() {
		return moduleName;
	}

	public void setModuleName(String moduleName) {
		this.moduleName = moduleName;
	}

}
