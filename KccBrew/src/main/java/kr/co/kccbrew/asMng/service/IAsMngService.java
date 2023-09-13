package kr.co.kccbrew.asMng.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.kccbrew.asMng.model.AsMngVo;

public interface IAsMngService {
	/**
	 * @param asMngVo : 검색 조건 들어있는 Vo
	 * @return : 조건으로 검색한 as 리스트
	 */
	public List<AsMngVo>selectASList(AsMngVo asMngVo,int page);
	/**
	 * @return AS 리스트의 총 수
	 */
	public int countASList(AsMngVo asMngVo);
	
	/**
	 * 장비 코드 리스트 조회
	 * @return : 장비 코드 리스트
	 */
	public List<AsMngVo> selectMachineCd();
	/**
	 * AS상태 코드 리스트 조회
	 * @return : AS상태 코드 리스트
	 */
	public List<AsMngVo> selectAsStatusCd();
	
	/**
	 * 점포 정보 조회
	 * @return 로그인한 아이디로 매핑된 점포 정보 
	 */
	public AsMngVo selectStrInfo(String userId);
	
	/**
	 * AS 등록
	 * @param asMngVo AS 정보가 담겨있는 vo
	 */
	public void insertAs(AsMngVo asMngVo);
	/**
	 * AS detail 조회
	 * @param asInfoSeq : seq 번호
	 * @return
	 */
	public AsMngVo selectAsInfoDetail(String asInfoSeq);
	
	/**
	 * AS건에 등록한 파일 정보 조회
	 * @param fileDtlId
	 * @return
	 */
	public List<AsMngVo> selectAsInfoImg(String fileDtlId);
	
	/**
	 * 지역코드 조회
	 * @param locationCd
	 * @return
	 */
	public List<AsMngVo> selectLocationCd();
	
	/**
	 * 지역 상세코드 조회
	 * @param locationCd
	 * @return
	 */
	public List<AsMngVo> selectLocationDtlCd(@Param("locationCd")String locationCd);
	
	/**
	 * 선택한 날짜에 점포 휴일 체크
	 * @param date 선택 날짜
	 * @param userId AS 신청인
	 * @return
	 */
	public int checkStrSchedule(String date,String userId);
	
	/**
	 * 
	 * @param date 방문 선택 날짜
	 * @param locationCd 지역 코드
	 * @return
	 */
	public List<AsMngVo> selectMechList(@Param("date")String date,@Param("locationCd")String locationCd);
	
	/**
	 * 기사 배정
	 * @param asMngVo
	 */
	public void insertAsAssign(AsMngVo asMngVo);
}
