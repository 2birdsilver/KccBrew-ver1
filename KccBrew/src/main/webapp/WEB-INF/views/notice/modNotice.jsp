<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 수정</title>
<style>
	@font-face {
		font-family: 'Noto Sans';
		font-style: normal;
		src: url("${path}/resources/fonts/NotoSansKR-Regular.ttf")
	}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="${path}/resources/js/notice/notice.js"></script>
<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
<link rel="stylesheet" href="${path}/resources/css/notice/notice.css"/>
</head>
<body>
	<div class="body-wrapper">
		<div class="table-wrapper">
			<!-- ********** 페이지 네비게이션 시작 ********** -->
			<div class="page-content-navigation">
				<ol class="breadcrumb">
					<li class="breadcrumb-home">공지사항</li>
					<li class="right-arrow">
						<div class="header-icon-background">
							<img
								src="<c:url value='${path}/resources/img/asMng/free-icon-right-arrow-271228.png' />"
								alt="Check List" class="header-icon" />
						</div>
					</li>
					<li>공지사항</li>
				</ol>
			</div>
			<!-- ********** 페이지 네비게이션 끝 ********** -->
			
			<div class="content-wrapper">
				<h2>공지사항 수정</h2>
				<form method="POST" action="/notice-update" id="updateNoticeForm" name="updateNoticeForm"  enctype="multipart/form-data">
					<table class="insert-notice-table">
						<tbody>
							<tr>
								<th>글 제목</th>
								<td><input type="text" name="noticeTitle" value="<c:out value="${noticeVo.noticeTitle}"/>" placeholder="제목을 입력하세요"  autocomplete="off" required></td>
							</tr>
							<tr>
								<th>글 내용</th>
								<td>
									<textarea id="notice-content" name="noticeContent" maxlength="1000" placeholder="최대 1000자까지 입력 가능합니다."required><c:out value="${noticeVo.noticeContent}"/></textarea>
									<div id="count-text">
										<span id="count">0</span>/1000
									</div>
								</td>
							</tr>
							<tr>
								<th>첨부 파일</th>
								<td>
									<div style="display:flex;">
										<div id="fileCount" style="margin: 0px 5px 0px 0px;">업로드할 파일을 선택해주세요.(최대 3개,기존 이미지도 재등록)</div>
										<div class="file-box">
											<div class="file-label">
												<label for="fileInput" id="fileUploadBtn">파일 선택 </label>
												<input type="file" id="fileInput" name="noticeImg" onchange="addFile(this);" multiple accept=".jpg, .jpeg, .png">
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<th>파일 목록</th>
								<td>
									<div class="file-list">
										<c:out value="${imgTitle.fileOriginalName}"/>								
									</div>
								</td>
							</tr>
							<tr>
								<th>파일 <br>미리보기</th>
								<td>
									<div class="img-list">
									</div>
								</td>
							</tr>
						</tbody>
					</table>
					<input type="hidden" id="writerName" name="writerName" value="<c:out value="${noticeVo.writerName}"/>">
					<input type="hidden" id="noticeSeq" name="noticeSeq" value="<c:out value="${noticeVo.noticeSeq}"/>">
					<input type="hidden" id="fileSeq" name="fileSeq" value="<c:out value="${noticeVo.fileSeq}"/>">
					<div class="modButtons">
						<button type="submit" id="updateNoticeBtn">수정</button>
						<button type="button" class="cancel" onclick="history.back()">취소</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
