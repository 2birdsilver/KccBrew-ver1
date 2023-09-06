package kr.co.kccbrew.sysMng.cdMng.service;

import java.util.List;

import kr.co.kccbrew.sysMng.cdMng.model.CdMngVo;



 
public interface ICdMngService {
	List<CdMngVo> selectNm();
	List<CdMngVo> filter(CdMngVo codeMng);
	CdMngVo selectCd(String cdId, String cdDtlId);
	CdMngVo selectGrpDetail(String cdId);
	void insert1(CdMngVo codeMng);
	void insert2(CdMngVo codeMng);
	void cdMod(CdMngVo codeMng);
	void grpUpdate(CdMngVo codeMng);

 
}