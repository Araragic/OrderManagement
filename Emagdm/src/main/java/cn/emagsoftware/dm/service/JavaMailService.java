package cn.emagsoftware.dm.service;


public interface JavaMailService {
	public boolean checkMail(String userName, String password);

	public void sendEveryWeek();
	
	public void sendEveryMonth();

	

}
