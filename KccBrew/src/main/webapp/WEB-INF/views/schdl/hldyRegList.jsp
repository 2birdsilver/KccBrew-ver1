<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ page import="java.time.LocalDateTime"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<!DOCTYPE html>
<html>

<script>
  var usedHolidays = ${15 - usedHolidays};
</script>

<head>
<meta charset="UTF-8">

<!-- css -->
<link rel="stylesheet" href="/resources/css/schdl/schdl-common.css" />
<link rel="stylesheet" href="/resources/css/schdl/myinsertform.css" />
<link rel="stylesheet" href="/resources/css/log/mylogtest.css" />
<link rel="stylesheet" href="/resources/css/log/content-template.css" />

<!-- javascript -->
<script src="<c:url value="/resources/js/schdl/myHldyIns.js"/>"></script>

<!-- font -->
<!-- notoSans -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
	rel="stylesheet">
<!-- notoSans Kr -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Noto+Sans&family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Insert title here</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body>
	<%-- Import the necessary Java classes --%>
	<%@ page import="java.util.Date"%>

	<%-- Get the current date and time --%>
	<%
		Date now = new Date();
	%>

	<%-- Set the "now" variable using JSTL --%>
	<c:set var="now" value="<%=now%>" />


	<div id="page" class="page-nosubmenu">

		<!-- ********** 왼쪽 메뉴 끝 ********** -->


		<div id="page-container" class="">
			<div id="page-content" class="clearfix">
				<!-- ********** 페이지 네비게이션 끝 ********** -->

				<div id="region-main">
					<div role="main">
						<span id="maincontent"></span>
						<div class="user-past">

							<!-- ********** 세은 로그 관련 내용 시작 ********** -->
							<div id="content">
								<h2 class="heading">휴가신청</h2>

								<form id="addForm" action="" method="post">
									<table id="search-box">
										<tr>
											<th>휴가신청일</th>
											<td colspan="4"><c:out
													value="<%=new java.text.SimpleDateFormat(\"yyyy-MM-dd\").format(new java.util.Date())%>" /></td>
										</tr>

										<tr>
											<th>휴가시작일</th>
											<td><input type="date" id="selectedStartDate"
												name="startDate" value="" required></td>
											<th>휴가종료일</th>
											<td><input type="date" id="selectedEndDate"
												name="endDate" value="" required
												onchange="calculateDays(new Date(document.getElementById('selectedStartDate').value), new Date(this.value))"></td>
											<td><span id="usedDays" contenteditable="true"
												oninput="calculateNumbers(this.textContent, document.getElementById('remainingDays').textContent)"></span>
											</td>
										</tr>

										<tr>
											<th>잔여일수/총 휴가일수</th>
											<td colspan="4"><span id="remainingDays"
												style="color: red;"><b><c:out
															value="${ 15 - usedHolidays}" /></b></span> / 15</td>
										</tr>

									</table>
									<div class="notice">
										<ul>
											<li>휴가일수는 연 15일 입니다.</li>
											<li>AS근무가 배정된 날짜에는 휴가신청을 할 수 없습니다.</li>
											<li>현재날짜를 기준으로 이전일은 휴가신청을 할 수 없습니다.</li>
										</ul>
									</div>
									<div class="center-button">
										<button type="submit" id="applyButton">휴가신청</button>
									</div>
								</form>

								<!-- 확인 모달 창 -->
								<div id="confirmModal" class="modal">
									<div class="modal-content">
										<span class="close">&times;</span>
										<p>정말로 휴가를 신청하시겠습니까?</p>
										<button id="applyYes">예</button>
										<button id="applyNo">아니오</button>
									</div>
								</div>

								<!-- 결과 모달 창 -->
								<div id="resultModal" class="modal">
									<div class="modal-content">
										<span class="close">&times;</span>
										<p id="modalMessage"></p>
									</div>
								</div>

								<script>
									// 폼 제출 이벤트 리스너
									$("#addForm")
											.submit(
													function(event) {
														event.preventDefault();

														// 확인 모달 창 열기
														var confirmModal = document
																.getElementById("confirmModal");
														confirmModal.style.display = "block";
													});

									// 확인 모달 창에서 "예" 버튼 클릭 시
									document
											.getElementById("applyYes")
											.addEventListener(
													"click",
													function() {
														// 확인 모달 창 닫기
														var confirmModal = document
																.getElementById("confirmModal");
														confirmModal.style.display = "none";

														// 폼 데이터를 직렬화
														var formData = $(
																"#addForm")
																.serialize();

														// AJAX 요청으로 휴가 등록을 수행하고 결과 메시지를 받아옴
														$
																.ajax({
																	url : "/holiday/add",
																	type : "POST",
																	data : formData,
																	success : function(
																			message) {
																		// 결과 모달 창 열고 메시지 표시
																		var resultModal = document
																				.getElementById("resultModal");
																		var modalMessage = document
																				.getElementById("modalMessage");
																		modalMessage.innerText = message;
																		resultModal.style.display = "block";
																	},
																	error : function() {
																		// 오류 메시지를 결과 모달 창에 표시
																		var resultModal = document
																				.getElementById("resultModal");
																		var modalMessage = document
																				.getElementById("modalMessage");
																		modalMessage.innerText = "오류 발생";
																		resultModal.style.display = "block";
																	}
																});
													});

									// 모달 창 닫기
									var closeBtns = document
											.querySelectorAll(".close");
									closeBtns
											.forEach(function(btn) {
												btn
														.addEventListener(
																"click",
																function() {
																	var modal = btn.parentElement.parentElement;
																	modal.style.display = "none";
																});
											});

									// 모달 창 닫기 함수
									function closeModal() {
										var modal = document
												.getElementById("confirmModal");
										modal.style.display = "none";
									}

									// 아니오 버튼 클릭 이벤트 처리
									document.getElementById("applyNo")
											.addEventListener("click",
													closeModal);
								</script>



							</div>

							<!-- ********** 세은 로그 관련 내용 끝 ********** -->
						</div>
					</div>
				</div>
			</div>

		</div>

	</div>
</body>
</html>