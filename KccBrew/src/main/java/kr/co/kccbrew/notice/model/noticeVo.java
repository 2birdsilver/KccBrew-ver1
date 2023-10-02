package kr.co.kccbrew.notice.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class noticeVo {
	/**
	 *  공지사항 VO
	 */
	int noticeSeq;			//공지사항 아이디
	String writerId;		//작성자 아이디
	String writerName;		//작성자 이름
	Date writeDate;			//작성일
	Date modDate;			//수정일
	String modUser;			//수정자 아이디
	String noticeTitle;		//공지사항 제목
	String noticeContent;	//공지사항 내용
	int views;				//조회수
	
	/**
	 * 파일 저장 VO
	 **/
	MultipartFile noticeImg;	//공지사항 이미지
	int fileId;					//파일 번호
	String fileOriginalName;	//파일 원본 이름
	String fileDetailLocation; 	//파일 저장 경로
	String fileDetailServerName;//파일 서버 내 이름
	String fileFmt;				//파일 형식
	String localSavePath;
	String serverSavePath;
	
	/**
	 * 그룹 코드 VO
	 */
	String grpCdId;			//그룹 코드 아이디
	String grpCdNm;			//그룹 코드명
	String grpCdDtlId;		//그룹 코드 디테일 아이디
	String grpCdDtlNm;		//그룹 코드 디테일명
}
