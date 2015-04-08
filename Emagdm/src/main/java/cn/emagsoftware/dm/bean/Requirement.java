package cn.emagsoftware.dm.bean;

import java.util.Date;

public class Requirement {
	
	private int id;
	private String version;
	private String status;
	private int urgency;
	private int relate_hw;
	private int delete_flag;
	private String requirement_num;
	private String title;
	private String description;
	private String initiator;
	private String manager;
	private Date online_date;
	private String create_user;
	private Date create_time;
	private String update_user;
	private Date update_time;
	private String catchUrgency;
	private String catchRelateHW;
	private String createTime;//用于接收前台String类型的日期，且可以用来返回页面
	private String onlineDate;//用于接收前台String类型的日期，且可以用来返回页面
	private String updateTime;//用于接收前台String类型的日期，且可以用来返回页面
	private int totalRecords;
	private String note;
	
	public Requirement(){
		
	}

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

	public int getUrgency() {
		return urgency;
	}

	public void setUrgency(int urgency) {
		this.urgency = urgency;
	}

	public int getRelate_hw() {
		return relate_hw;
	}

	public void setRelate_hw(int relate_hw) {
		this.relate_hw = relate_hw;
	}

	public int getDelete_flag() {
		return delete_flag;
	}

	public void setDelete_flag(int delete_flag) {
		this.delete_flag = delete_flag;
	}

	public String getRequirement_num() {
		return requirement_num;
	}

	public void setRequirement_num(String requirement_num) {
		this.requirement_num = requirement_num;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getInitiator() {
		return initiator;
	}

	public void setInitiator(String initiator) {
		this.initiator = initiator;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCreate_user() {
		return create_user;
	}

	public void setCreate_user(String create_user) {
		this.create_user = create_user;
	}

	public String getUpdate_user() {
		return update_user;
	}

	public void setUpdate_user(String update_user) {
		this.update_user = update_user;
	}

	public Date getCreate_time() {
		return create_time;
	}

	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}

	public Date getOnline_date() {
		return online_date;
	}

	public void setOnline_date(Date online_date) {
		this.online_date = online_date;
	}

	public Date getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(Date update_time) {
		this.update_time = update_time;
	}

	public String getCreateTime() {
		return createTime;
	}

	public void setCreateTime(String createTime) {
		this.createTime = createTime;
	}

	public String getOnlineDate() {
		return onlineDate;
	}

	public void setOnlineDate(String onlineDate) {
		this.onlineDate = onlineDate;
	}

	public String getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}

	public int getTotalRecords() {
		return totalRecords;
	}

	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}

	public String getCatchUrgency() {
		return catchUrgency;
	}

	public void setCatchUrgency(String catchUrgency) {
		this.catchUrgency = catchUrgency;
	}

	public String getCatchRelateHW() {
		return catchRelateHW;
	}

	public void setCatchRelateHW(String catchRelateHW) {
		this.catchRelateHW = catchRelateHW;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}
	
}
