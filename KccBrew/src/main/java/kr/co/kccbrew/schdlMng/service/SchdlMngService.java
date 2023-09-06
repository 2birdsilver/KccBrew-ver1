package kr.co.kccbrew.schdlMng.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.kccbrew.schdlMng.dao.ISchdlMngRepository;
import kr.co.kccbrew.schdlMng.model.SchdlMngVo;
import kr.co.kccbrew.schdlMng.model.SchdlMngVo2;

@Service
public class SchdlMngService implements ISchdlMngService {
	
	@Autowired
	private ISchdlMngRepository schdlMngRepository;

	@Override
	public List<SchdlMngVo> getMechaSchedules(int currentPage, SchdlMngVo searchContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchContent", searchContent);
		map.put("firstRowNum", currentPage*10-9);
		map.put("lastRowNum", currentPage*10);
		
		return schdlMngRepository.selectMechaSchedules(map);
	}

/*	@Override
	public int getMechaScheduleCount(SchdlMngVo serchContent) {
		return 0;
	}*/
	
	
	/*테스트2*/
	@Override
	public List<SchdlMngVo2> getMechaSchedules2(int currentPage, SchdlMngVo2 searchContent) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchContent", searchContent);
		map.put("firstRowNum", currentPage*10-9);
		map.put("lastRowNum", currentPage*10);
		
		return schdlMngRepository.selectMechaSchedules2(map);
	}
 
	
}
