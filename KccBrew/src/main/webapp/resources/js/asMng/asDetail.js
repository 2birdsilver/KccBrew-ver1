//대분류 지역 조건 변경 시 소분류 지역값들 변경 함수
function changeLosctionDtlCd(data){
	var locOption=$("select[name=locationCd]");
	var content='<option value="">지역 상세 선택</option>';
	
	for(var i=0;i<data.length;i++){
		content +='<option value="'+data[i].grpCdDtlId+'" >'+data[i].grpCdDtlNm+'</option>'
	}
	locOption.html(content);
}
//대분류 지역 선택한 값에 맞춰서 소분류 지역 값 조회
function changeLocationCd(){
	var locCd = $("select[name=location] option:selected").val();
	$.ajax({
	    type : "GET",           // 타입 (get, post, put 등등)
	    url : "/search-location-cd",           // 요청할 서버url
	    dataType : "json",       // 데이터 타입 (html, xml, json, text 등등)
	    data : {
			'locCd' : locCd,
		},
	    success : function(data) { // 결과 성공 콜백함수
			changeLosctionDtlCd(data);
	    }
	});
}
//해당 일정에 근무 할 수 있는 수리기사 조회
function changeMach(){
	var locationCd=$("select[name=locationCd] option:selected").val();
	var visitDttm=$("input[name=visitDttm]").val();
	$.ajax({
		type : "GET",           // 타입 (get, post, put 등등)
	    url : "/search-mecha",           // 요청할 서버url
	    dataType : "json",       // 데이터 타입 (html, xml, json, text 등등)
	    data : {
			'locationCd' : locationCd,
			'visitDttm' : visitDttm
		},
	    success : function(data) { // 결과 성공 콜백함수
	    	insertMechaList(data)
	    }
	})
}

function insertMechaList(data){
	var html="<select name='mechanicId' class='selectMcha' required>"+"<option value=''>수리 기사 선택</option>";
	for(var i=0;i<data.mechaList.length;i++){
		html+="<option value="+data.mechaList[i].userId+">"+data.mechaList[i].userNm+"</option>";
	}
	html+="</select>"
	$("select[name=mechanicId]").html(html);
}
function selectLocation(){changeMach()}
function selectDate(){
	var strMngId=$("input[name=strMngId]").val();
	var visitDttm=$("input[name=visitDttm]").val();
	$.ajax({
		type : "GET",           // 타입 (get, post, put 등등)
	    url : "/check-str-schedule",           // 요청할 서버url
	    dataType : "json",       // 데이터 타입 (html, xml, json, text 등등)
	    data : {
	    	'strMngId'	: strMngId,
			'visitDttm' : visitDttm
		},
	    success : function(data) { // 결과 성공 콜백함수
	    	if(data.count>0){
	    		$("input[name=visitDttm]").val("");
	    		alert("해당 날짜는 점포 휴무일입니다.");
	    		return;
	    	}
	    }
	})
	changeMach()
	
}

function rejectAs(userTypeCd){
	$("body").css("overflow","hidden");
	$(".modal").css("display","block");
}

function cancelModal(){
	$("body").css("overflow","auto");
	$(".modal").css("display","none");
}

function reject(){
	
}