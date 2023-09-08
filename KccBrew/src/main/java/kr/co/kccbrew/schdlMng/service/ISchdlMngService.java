package kr.co.kccbrew.schdlMng.service;

import java.util.List;

import kr.co.kccbrew.schdlMng.model.SchdlMngVo;
import kr.co.kccbrew.schdlMng.model.SchdlMngVo2;

public interface ISchdlMngService {
	public List<SchdlMngVo> getMechaSchedules(int currentPage, SchdlMngVo searchContent);
	/*public int getMechaScheduleCount(SchdlMngVo serchContent);*/
	
	/*스케줄 리스트 조회*/
	public List<SchdlMngVo2> getSchedules2(int currentPage, SchdlMngVo2 searchContent);
	public int getSchedule2Count(SchdlMngVo2 searchContent);
	
	/*회원 캘린더 조회*/
	public List<SchdlMngVo2> getCalendarSchedule(SchdlMngVo2 schdlMngVo);
}
