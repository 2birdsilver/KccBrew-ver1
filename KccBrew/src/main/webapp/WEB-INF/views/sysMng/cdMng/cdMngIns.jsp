<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/code/insert.css" />
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!-- jQuery 추가 -->
</head>
<body>
    <section id="notice" class="notice">
        <section class="category">
            <span>코드관리 > 코드등록</span>
        </section>

        <div class="container2">
            <table class="text-center">
                <tr>
                    <th>선택</th>
                    <td>
                        <input type="radio" class="radio-value" name="check" value="yes" /> 그룹코드 등록
                        <input type="radio" class="radio-value" name="check" value="no" /> 상세코드 등록 코드
                    </td>
                </tr>
            </table>

            <div id="grcd1">
                <div class="div">그룹코드 등록</div>
                <hr style="border: solid 1.2px; width: 97%;">
                <form action="/code/insert1" method="post" id="insert1">
                    <table class="text-center">
                        <tr>
                            <th>그룹코드ID</th>
                            <td><input type="text" name="cdId" class="radio-value-detail" disabled="disabled"></td>
                            <!-- 초기에 비활성화 -->
                        </tr>
                        <tr>
                            <th>그룹코드이름</th>
                            <td><input type="text" name="cdNm" class="radio-value-detail" disabled="disabled"></td>
                            <!-- 초기에 비활성화 -->
                        </tr>
                    </table>
                    <div class="savecancle">
                        <input type="button" name="save" class="button" onClick="submitForm1()" value="저장">
                        <input type="button" class="update" value="취소" onclick="window.close()">
                    </div>
                </form>
            </div>
            <div id="grcd2">
                <div class="div">상세코드 등록</div>
                <hr style="border: solid 1.2px; width: 97%;">
                <form action="/code/insert2" method="post" id="insert2">
                    <table class="text-center">
                        <tr>
                            <th>그룹코드선택</th>
                            <td>
                                <select name="cdId" size="3">
                                    <c:forEach items="${List}" var="list">
                                        <option value="${list.cdId}" <c:if test="${codeMng.cdId==list.cdId}">selected</c:if>>${list.cdNm}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <th>상세코드ID</th>
                            <td><input type="text" name="cdDtlId" class="radio-value-detail"></td>
                        </tr>
                        <tr>
                            <th>상세코드이름</th>
                            <td><input type="text" name="cdDtlNm" class="radio-value-detail"></td>
                        </tr>
                    </table>
                    <div class="savecancle" style="text-align: center;">
                        <input type="button" name="save" class="button" onClick="submitForm2()" value="저장">
                        <input type="button" class="update" value="취소" onclick="window.close()">
                    </div>
                </form>
            </div>
        </div>
    </section>

    <script>
        $(document).ready(function() { // 문서가 로드되면 실행
            $('#grcd2').hide();
            $('.radio-value').on('click', function() {
                var valueCheck = $('.radio-value:checked').val();
                if (valueCheck === 'yes') {
                    $('#grcd1').show();// input 보이기
                    $('#grcd2').hide();// input 숨기기
                    $('.radio-value-detail').prop('disabled', false);// input 활성화
                } else if (valueCheck === 'no') {
                    $('.radio-value-detail').val(''); // 값 초기화
                    $('#grcd2').show(); // input 보이기
                    $('#grcd1').hide(); // input 숨기기
                }
            });
        });
        function submitForm1() {
            var form1 = document.getElementById("insert1");

            // AJAX 요청 보내기
            $.ajax({
                type : "POST", 
                url : form1.getAttribute("action"),
                data : $(form1).serialize(), // 폼 데이터 시리얼라이즈하여 전송
                success : function(response) {
                    // 응답 처리 로직 추가
                    var Close = confirm("저장이 완료되었습니다. 창을 닫으시겠습니까?");
                    if (Close) {
                        window.opener.location.reload();
                        window.close(); // 팝업 창 닫기
                    }
                },
                error : function(error) {
                    console.error("AJAX 요청 실패:", error);
                    alert("저장에 실패하였습니다.");
                }
            });
        }
        function submitForm2() {
            var form2 = document.getElementById("insert2");

            // AJAX 요청 보내기
            $.ajax({
                type : "POST", 
                url : form2.getAttribute("action"),
                data : $(form2).serialize(), // 폼 데이터 시리얼라이즈하여 전송
                success : function(response) {
                    // 응답 처리 로직 추가
                    var Close = confirm("저장이 완료되었습니다. 창을 닫으시겠습니까?");
                    if (Close) {
                        window.opener.location.reload();
                        window.close(); // 팝업 창 닫기
                    }
                },
                error : function(error) {
                    console.error("AJAX 요청 실패:", error);
                    alert("저장에 실패하였습니다.");
                }
            });
        }
    </script>
</body>
</html>
