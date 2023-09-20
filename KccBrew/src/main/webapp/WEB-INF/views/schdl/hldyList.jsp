<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ page import="kr.co.kccbrew.comm.util.ObjectUtilController"%>
<%@ page import="kr.co.kccbrew.comm.security.model.UserVo"%>
<%@ page import="javax.servlet.http.HttpSession"%>


<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- css -->
<link rel="stylesheet" href="/resources/css/schdl/schdl-common.css" />
<link rel="stylesheet" href="/resources/css/log/mylogtest.css" />
<link rel="stylesheet" href="/resources/css/log/content-template.css" />
<link rel="stylesheet" href="/resources/css/schdl/myschedulelist.css" />
<link rel="stylesheet" href="/resources/css/schdl/myHldyList.css" />


<!-- javascript -->
<script src="<c:url value="/resources/js/schdl/schdl-common.js"/>"></script>
<script src="<c:url value="/resources/js/schdl/board.js"/>"></script>
<script src="<c:url value="/resources/js/schdl/search.js"/>"></script>
<script src="<c:url value="/resources/js/schdl/holidayList.js"/>"></script>

<meta charset="UTF-8">
<title>Insert title here</title>

</head>

<body>
	<c:set var="user" value="${sessionScope.user}" />

	<!-- 자바스크립트에서 session사용 -->
	<script>
    var equipmentCodeValue = "<c:out value='${user.eqpmnCd}' />";
</script>

	<script>
    var locationCodeValue = "<c:out value='${user.locationCd}' />";
</script>

	<script>
    var userTypeCd = "<c:out value='${user.userTypeCd}' />";
</script>



	<div id="page" class="page-nosubmenu">
		<!-- ********** header영역 시작********** -->
		<div id="page-header">
			<nav
				class="navbar navbar-default navbar-fixed-top headroom animated slideDown">
				<div class="container-fluid">

					<!-- 브랜드 로고 -->
					<div class="navbar-brand">
						<a href="" class="logo"> <img src="/resources/img/kcc.png"
							style="height: 100%; background: white;" />
						</a>
					</div>

					<!-- ********** header메뉴 시작********** -->
					<div class="usermenu">
						<ul class="nav nav-pills" role="tablist">
							<!-- 사용자 이름 -->
							<li class="user_department hidden-xs">이세은</li>

							<!-- 사용자 프로필 사진 -->
							<li class="user-info-menu"><a class="user-info-popover"
								tabindex="0" role="button" data-toggle="popover"
								data-placement="bottom" data-original-title="" title=""> <img
									src="/resources/img/log/f2.png" />
							</a>
								<div class="user-info-box popover-box">
									<div class="user-info-picture">
										<h4>이세은</h4>
										<p class="department">화학과</p>
									</div>
									<ul class="user-info-submenu clearfix">
										<li class="items"><a
											href="https://cyber.inu.ac.kr/user/edit.jsp?id=86992">개인정보
												수정</a></li>
										<li class="items"><a
											href="https://cyber.inu.ac.kr/login/logout.jsp?sesskey=RWLqOGp4Jq">로그아웃</a></li>
									</ul>
									<ul class="user-info-shortcut">
										<li><a href="https://cyber.inu.ac.kr/user/files.jsp">파일
												관리</a></li>
									</ul>
								</div></li>

							<!-- 사용자 할일 -->
							<li class="user-courses"><a
								class="user-courses-popover icon-a" tabindex="0" role="button"
								data-toggle="popover" data-placement="bottom"
								data-original-title="" title=""> </a>
								<div class="user-courses-box popover-box">
									<div class="popover-header">진행중인 강좌 (0)</div>
									<ul class="my-course-lists">
										<li class="nocourses">Loading...</li>
									</ul>
									<div class="popover-footer">
										<a href="https://cyber.inu.ac.kr/">MY COURSES</a>
									</div>
								</div></li>

							<!-- 알림 -->
							<li class="user-notification"><a
								class="icon-a user-noti-popover" tabindex="0" role="button"
								data-toggle="popover" data-placement="bottom"
								data-original-title="" title=""> </a>
								<div class="user-noti-box popover-box">
									<div class="popover-header">
										<span>전체 알림</span>
									</div>
									<div class="user-noti-lists">
										<div class="nomessage">Loading...</div>
									</div>
									<div class="popover-footer">
										<a href="https://cyber.inu.ac.kr/local/ubnotification/">모두
											보기</a>
									</div>
								</div></li>

							<!-- 마이 메뉴 -->
							<li class="user-product"><a class="user-menu-product icon-a"
								tabindex="0" role="button" data-toggle="popover"
								data-original-title="" title=""></a>
								<div class="hide menu-product">
									<div class="menu-product-itl">
										<h5>
											교육혁신원 홈페이지 <a href="http://ctl.inu.ac.kr/" target="_blank">
											</a>
										</h5>
										<ul>
											<li><a href="http://www.inu.ac.kr/" target="_blank">인천대학교
													홈페이지</a></li>
											<li><a href="http://www.kocw.net/home/index.do"
												target="_blank">KOCW 강의공개 서비스</a></li>
											<li><a href="http://starinu.inu.ac.kr/" target="_blank">학생역량관리시스템(STARinU)</a></li>
											<li><a href="http://lib.inu.ac.kr/" target="_blank">도서관</a></li>
											<li><a href="http://job.inu.ac.kr/" target="_blank">취업경력개발원</a></li>
											<li><a
												href="http://rnd.inu.ac.kr/user/indexMain.do?siteId=rnd"
												target="_blank">산학협력단</a></li>
											<li><a href="http://scc.inu.ac.kr/" target="_blank">학생생활상담소</a></li>
										</ul>
									</div>
								</div></li>


						</ul>
					</div>
					<!-- ********** header메뉴 끝********** -->


				</div>
			</nav>
		</div>
		<!-- ********** header영역 끝********** -->

		<!-- ********** 왼쪽 메뉴 끝 ********** -->

		<div id="page-mask">
			<div id="page-container" class="">
				<div id="page-content" class="clearfix">
					<div id="page-content-wrap">

						<!-- ********** 페이지 네비게이션 시작 ********** -->
						<div class="page-content-navigation">
							<ol class="breadcrumb">
								<li class="breadcrumb-home"><a href="">스케줄관리</a></li>
								<li>
									<div class="header-icon-background">
										<img
											src="<c:url value='/img/log/free-icon-right-arrow-271228.png' />"
											alt="Check List" class="header-icon" />
									</div>
								</li>
								<li><a href="<c:url value='/holiday' />">휴가사용현황</a></li>
							</ol>
						</div>
						<!-- ********** 페이지 네비게이션 끝 ********** -->

						<div id="region-main">
							<div role="main">
								<div class="user-past">

									<!-- ********** 세은 로그 관련 내용 시작 ********** -->
									<div id="content">

										<h2 class="heading">휴가사용현황</h2>

										<div class="tabNav">
											<ul class="tab-ul">
												<li class="active"><a href=""><span>휴가사용현황</span></a></li>
												<sec:authorize
													access="hasAnyRole('ROLE_MANAGER', 'ROLE_MECHA')">
													<li class="last"><a href="/schedule/calendar"><span>나의캘린더</span></a></li>
												</sec:authorize>
												<sec:authorize access="hasRole('ROLE_ADMIN')">
													<li class="last"><a href="/schedule"><span>근태현황</span></a></li>
												</sec:authorize>
											</ul>
										</div>

										<!-- 로그 검색 -->
										<sec:authorize access="hasRole('ROLE_ADMIN')">
											<form name="srhForm" action="/admin/holiday/search"
												method="post">

												<input type="hidden" name="currentPage" value="1"> <input
													type="hidden" name="startDate" value=""> <input
													type="hidden" name="endDate" value="">

												<div>
													<span> 사용자검색 </span>
												</div>

												<div class="search-info">
													<fieldset>
														<legend class="blind">사용자검색</legend>
														<table id="search-box">
															<tr>
																<th>위치<span style="color: red;">(필수)</span></th>
																<td><select class="tx2" name="location"
																	onchange="changeLocationCd()">
																		<option value="">지역 대분류</option>
																		<c:forEach var="location" items="${locationList}">
																			<c:if test="${location.grpCdId eq 'L'}">
																				<option value="${location.grpCdDtlId}"
																					${param.superGrpCdDtlId == location.grpCdDtlId ? 'selected' : ''}>
																					${location.grpCdDtlNm}</option>
																			</c:if>
																		</c:forEach>
																</select></td>

																<td><select class="tx2" name="locationCd">
																		<option value="">지역 소분류</option>
																</select></td>

																<th>유형</th>
																<td><select class="tx2" name="userType"
																	id="selectUserType"
																	onchange="updateUserType(); inputDisableSetting('selectUserType', 'selectKeyword');">
																		<option value="">사용자 유형</option>
																		<option value="기사"
																			${param.userType == '기사' ? 'selected' : ''}>기사</option>
																		<option value="점주"
																			${param.userType == '점주' ? 'selected' : ''}>점주</option>
																</select></td>

																<th>검색어</th>
																<td><select class="tx2" name="searchKeword"
																	id="selectKeyword" onchange="chgName(this)" disabled>
																		<option value="">검색어</option>
																		<option value="userId"
																			${param.searchKeword == '회원ID' ? 'selected' : ''}>회원ID</option>
																		<option value="userName"
																			${param.searchKeword == '회원이름' ? 'selected' : ''}>회원이름</option>
																		<option value="storeId"
																			${param.searchKeword == '지점ID' ? 'selected' : ''}>지점ID</option>
																		<option value="storeName"
																			${param.searchKeword == '지점명' ? 'selected' : ''}>지점명</option>
																</select></td>
																<td><input type="text" id="search-word"
																	name="searchKeword" placeholder="키워드 선택 후 입력해주세요"
																	required disabled></td>
															</tr>

														</table>
														<div class="form-btn-box">
															<fieldset>
																<button type="button" class="form-btn"
																	onClick="performSearch();">검색</button>
																<button type="reset" class="form-btn">초기화</button>
															</fieldset>
														</div>
													</fieldset>
												</div>
											</form>
										</sec:authorize>




										<!-- 검색어 선택한 것이 input요소의 name으로 설정 -->
										<script>
											function chgName(selectElement) {
												const selectedValue = selectElement.value; // 선택한 값
												const inputElement = document
														.getElementById('search-word'); // 검색어 입력 필드

												if (selectedValue === '') {
													// 선택한 값이 빈 문자열인 경우, input 요소를 비활성화
													inputElement.disabled = true;
												} else {
													// 선택한 값이 빈 문자열이 아닌 경우, input 요소를 활성화
													inputElement.disabled = false;
													inputElement.name = selectedValue;
												}
											}
										</script>


										<!-- 사용자 유형 선택에 따른 검색어 추출 -->
										<script>
											function updateUserType() {

												const userTypeSelect = document
														.getElementsByName('userType')[0]; 
												const searchSelect = document
														.getElementsByName('searchKeword')[0]; 

												if (userTypeSelect.value === '기사') {
													removeAllOptions(searchSelect);
													addOption(searchSelect,
															'검색어', '');
													addOption(searchSelect,
															'회원ID', 'userId');
													addOption(searchSelect,
															'회원이름', 'userName');
												} else {
													removeAllOptions(searchSelect);
													addOption(searchSelect,
															'검색어', '');
													addOption(searchSelect,
															'회원ID', 'userId');
													addOption(searchSelect,
															'회원이름', 'userName');
													addOption(searchSelect,
															'지점ID', 'storeId');
													addOption(searchSelect,
															'지점명', 'storeName');
												}

												if (typeof searchSelect.onchange === 'function') {
													searchSelect.onchange();
												}
											}

											function removeAllOptions(
													selectElement) {
												while (selectElement.options.length > 0) {
													selectElement.remove(0);
												}
											}

											function addOption(selectElement,
													text, value) {
												const option = new Option(text,
														value);
												selectElement.add(option);
											}
										</script>

										<div class="info-box">

											<sec:authorize access="hasRole('ROLE_MANAGER')">

												<form name="srhForm" action="/user/holiday/search"
													method="post" style="display: none;">
													<input type="hidden" name="startDate" value=""> <input
														type="hidden" name="endDate" value=""> <input
														type="hidden" name="currentPage" value="1">
												</form>

												<!-- 점포일 경우 -->
												<div class="subtitle">점포</div>
												<table id="search-box">
													<!-- 점주정보 -->
													<tr>
														<th>유형</th>
														<td><c:out value="점주" /></td>

														<th>ID</th>
														<td><c:out value="${user.userId}" /></td>

														<th>이름</th>
														<td><c:out value="${user.userNm}" /></td>

														<th>이메일</th>
														<td><c:out value="${user.userEmail}" /></td>

														<th>연락처</th>
														<td><c:out value="${user.userTelNo}" /></td>

													</tr>

													<!-- 점포정보 -->
													<tr>
														<th>점포ID</th>
														<td><c:out value="${store.storeSeq}" /></td>

														<th>점포명</th>
														<td><c:out value="${store.storeNm}" /></td>

														<th>점포주소</th>
														<td colspan="3"><c:out
																value="${store.storeAddr} ${store.storeAddrDtl}" /></td>

														<th>점포연락처</th>
														<td><c:out value="${store.storeTelNo}" /></td>

													</tr>
												</table>
											</sec:authorize>

											<sec:authorize access="hasRole('ROLE_MECHA')">

												<form name="srhForm" action="/user/holiday/search"
													method="post" style="display: none;">
													<input type="hidden" name="startDate" value=""> <input
														type="hidden" name="endDate" value=""> <input
														type="hidden" name="currentPage" value="1">
												</form>

												<div class="subtitle">회원정보</div>
												<table id="search-box">
													<tr>
														<th>유형</th>
														<td>수리기사</td>

														<th>ID</th>
														<td><c:out value="${user.userId}" /></td>

														<th>이름</th>
														<td><c:out value="${user.userNm}" /></td>

														<th>연락처</th>
														<td><c:out value="${user.userTelNo}" /></td>

													</tr>

													<tr>
														<th>사용장비코드</th>
														<td id="equipmentCode"><c:out value="${user.eqpmnCd}" /></td>

														<th>장비명</th>
														<td id="equipmentName"></td>

														<th>지역코드</th>
														<td id="locationCode"><c:out
																value="${user.locationCd}" /></td>

														<th>지역명</th>
														<td id="locationName"></td>

													</tr>
												</table>
											</sec:authorize>
										</div>

										<div id="logTable">

											<div class="board-info">
												<span class="data-info"> 전체<b><span
														id="totalDataNumber"><c:out
																value="${totalDataNumber}" /></span></b>건<span id="text-separator">
														| </span> <b><span id="currentPage"><c:out
																value="${currentPage}" /></span></b>/<b><span id="totalPage"><c:out
																value="${totalPage}" /></span></b>쪽
												</span>

												<fieldset>
													<legend class="blind">날짜 검색</legend>
													<label>휴가일</label> <input type="date"
														id="selectedStartDate" name="selectedStartDate" value=""
														required> <input type="date" id="selectedEndDate"
														name="selectedEndDate" value="" required> <input
														type="button" value="검색" onclick="goDate(); return false;">
												</fieldset>
											</div>

											<table id="holiday-info-table">
												<thead>
													<tr>
														<th>순번</th>
														<sec:authorize access="hasRole('ROLE_ADMIN')">
															<th>사용자분류</th>
															<th>ID</th>
														</sec:authorize>
														<th>휴가번호</th>
														<th>신청일</th>
														<th>시작일</th>
														<th>종료일</th>
														<th>휴가취소</th>
														<th>사용여부</th>
													</tr>
												</thead>
												<tbody id="holiday-list-tbody">
													<c:choose>
														<c:when test="${empty schedules}">
															<tr>
																<td colspan="10">데이터가 없습니다.</td>
															</tr>
														</c:when>
														<c:otherwise>
															<c:forEach var="schedule2" items="${schedules}">
																<tr>
																	<td><c:out value="${schedule2.rowNumber}" /></td>
																	<sec:authorize access="hasRole('ROLE_ADMIN')">
																		<td><c:out value="${schedule2.userType}" /></td>
																		<td><c:out value="${schedule2.userId}" /></td>
																	</sec:authorize>
																	<td><c:out value="${schedule2.scheduleId}" /></td>
																	<td><c:out value="${schedule2.appDate}" /></td>
																	<td><c:out value="${schedule2.startDate}" /></td>
																	<td><c:out value="${schedule2.endDate}" /></td>
																	<td><button>취소</button></td>
																	<td><c:out value="${schedule2.actualUse}" /></td>
																</tr>
															</c:forEach>
														</c:otherwise>
													</c:choose>
												</tbody>
											</table>
										</div>

										<!-- 페이징 -->
										<div class="paging pagination">

											<!-- 맨 앞 버튼 -->
											<a href="" onclick="goPage(1); return false;"
												class="pageFirst"> <img
												src="/resources/img/log/free-icon-left-chevron-6015759.png"
												alt="처음" />
											</a>

											<!-- 이전 버튼 -->
											<c:choose>
												<c:when test="${currentPage > 1}">
													<a href=""
														onclick="goPage(${currentPage - 1}); return false;"
														class="pagePrev"> <img
														src="/resources/img/log/free-icon-left-arrow-271220.png"
														alt="이전" />
													</a>
												</c:when>
												<c:otherwise>
													<a href="" class="disabled-link pagePrev"> <img
														src="/resources/img/log/free-icon-left-arrow-271220.png"
														alt="이전" />
													</a>
												</c:otherwise>
											</c:choose>

											<!-- 리스트 목록 나열 -->
											<div id="number-list">
												<div class="page-btn">
													<c:forEach var="page" begin="${sharePage * 10 + 1}"
														end="${(sharePage + 1) * 10}" step="1">
														<c:if test="${page <= totalPage}">
															<a href="" onclick="goPage(${page}); return false;"
																class="pageNow pagination page-btn ${currentPage == page ? 'selected' : ''}">
																${page} </a>




														</c:if>
													</c:forEach>
												</div>
											</div>

											<!-- 뒤로 버튼 -->
											<c:if test="${currentPage < totalPage}">
												<a href=""
													onclick="goPage(${currentPage + 1}); return false;"
													class="pageNext"> <img
													src="/resources/img/log/free-icon-right-arrow-271228.png"
													alt="다음" />
												</a>
											</c:if>
											<c:if test="${currentPage == totalPage}">
												<a href="" class="disabled-link pageNext"> <img
													src="/resources/img/log/free-icon-right-arrow-271228.png"
													alt="다음" />
												</a>
											</c:if>

											<!-- 맨 뒤로 버튼 -->
											<a href="" onclick="goPage(${totalPage}); return false;"
												class="pageLast"> <img
												src="/resources/img/log/free-icon-fast-forward-double-right-arrows-symbol-54366.png"
												alt="마지막" />
											</a>
										</div>

										<sec:authorize
											access="hasAnyRole('ROLE_MANAGER', 'ROLE_MECHA')">
											<div class="right-buttons">
												<button type="button" id="" onclick="postPopup();">휴가신청</button>
											</div>
										</sec:authorize>
									</div>
									<!-- ********** 세은 로그 관련 내용 끝 ********** -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>