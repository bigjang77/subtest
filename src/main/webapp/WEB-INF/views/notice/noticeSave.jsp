<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ include file="../layout/headerCompany.jsp"%>
<div class="p-5 border text-center">
  <h1>공고 등록</h1>
</div>
<form>
  <input type="hidden" id="companyId" value="${principal.companyId}">
<div class="container">
  <div class="row">
    <div class="notice_save">  
      <div id="notice_info" class="form">
        <div class="notice_form">
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">공고명</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeTitle" class="box_input" placeholder="공고명을 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">회사명</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeConame" class="box_input" placeholder="회사명을 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">분야</p>
            </div>
            <div class="notice_input">
              <c:forEach var="jobPS" items="${jobPS}">
                <input type='radio' id='jobId' name='jobId' value="${jobPS.jobId}" />${jobPS.jobName}
                <br>
              </c:forEach>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">공고마감일</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticePeriod" class="box_input" placeholder="공고 마감일"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">채용부서</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeDept" class="box_input" placeholder="부서명을 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">채용직급</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticePosition" class="box_input" placeholder="직급을 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">주요업무</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeTask" class="box_input" placeholder="업무를 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">평균연봉</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeSal" class="box_input" placeholder="연봉를 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">자격요건</p>
            </div>
            <div class="notice_input">
              <div class="form-check">
                <input type="radio" id="noticeQual" name="noticeQual" value="대졸">대졸
              </div>
              <div class="form-check">
                <input type="radio" id="noticeQual" name="noticeQual" value="고졸">고졸
              </div>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">경력기간</p>
            </div>
            <div class="notice_input">
              <input type="text" id="noticeCareer" class="box_input" placeholder="경력 기간을 입력하세요"/>
            </div>
          </div>
          <div class="notice_row">
            <div class="notice_list">
              <p class="notice_list_item">복리후생</p>
            </div>
            <div class="notice_input">
              <textarea id="noticeWellfare" cols="40" rows="5" placeholder="복리 후생"></textarea>
            </div>
          </div>
        </div>
      </div>
      <!-- notice -->
          <button type="button" class="btn btn-primary" onclick="btnInsertNotice()">공고등록</button>
      <!-- btn -->
    </form>
    </div>
    <!-- notice_save -->
  </div>
</div>
<!-- body -->

<div class="mt-5 p-4 bg-dark text-white text-center">
  <p>Footer</p>
</div>
<!-- footer -->

</body>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    // function sample6_execDaumPostcode() {
    //     new daum.Postcode({
    //         oncomplete: function(data) {
    //             var addr = ''; 
    //             var extraAddr = '';

    //             if (data.userSelectedType === 'R') {
    //                 addr = data.roadAddress;
    //             } else {
    //                 addr = data.jibunAddress;
    //             }

    //             if(data.userSelectedType === 'R'){
    //                 if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
    //                     extraAddr += data.bname;
    //                 }
    //                 if(data.buildingName !== '' && data.apartment === 'Y'){
    //                     extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
    //                 }
    //                 if(extraAddr !== ''){
    //                     extraAddr = ' (' + extraAddr + ')';
    //                 }
    //                 document.getElementById("sample6_extraAddress").value = extraAddr;
    //             } else {
    //                 document.getElementById("sample6_extraAddress").value = '';
    //             }

    //             document.getElementById('sample6_postcode').value = data.zonecode;
    //             document.getElementById("sample6_address").value = addr;
    //             document.getElementById("sample6_detailAddress").focus();
    //         }
    //     }).open();
    // }

    function btnInsertNotice(){
    let data = {
      companyId : $("#companyId").val(),
      noticeTitle : $("#noticeTitle").val(),
      noticeConame : $("#noticeConame").val(),
      noticePeriod : $("#noticePeriod").val(),
      noticeDept : $("#noticeDept").val(),
      noticePosition : $("#noticePosition").val(),
      noticeTask : $("#noticeTask").val(),
      noticeSal : $("#noticeSal").val(),
      noticeQual : $('input[id=noticeQual]:checked').val(),
      noticeCareer : $("#noticeCareer").val(),
      noticeWellfare : $("#noticeWellfare").val(),
      jobId: $('input[id=jobId]:checked').val()
		};
    console.log(data);
	$.ajax("/co/noticeSave", {
		type: "POST",
		dataType: "json",
		data: JSON.stringify(data),
		headers: {
			"Content-Type": "application/json; charset=utf-8"
		}
	}).done((res) => {
		if (res.code == 1) {
            alert("공고등록에 성공하였습니다.");
			location.href="/co/mainCompany";
		} else {
            alert("공고등록에 실패하였습니다.");
		}
	});
}
</script>
<%@ include file="../layout/footerCompany.jsp"%>