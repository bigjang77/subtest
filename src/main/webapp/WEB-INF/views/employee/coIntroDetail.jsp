<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ include file="../layout/header.jsp" %>
    <div class="p-5 border text-center">
      <h1>기업소개 상세보기</h1>
    </div>

    <div class="container">
      <div class="row">
        <div class="company_detail">
          <input id="introId" type="hidden" value="${detailDto.introId}" />
          <input id="subscribeId" type="hidden" value="${detailDto.subscribeId}" />
          <input id="principalId" type="hidden" value="${principal.getEmployeeId()}" />
          <span>인증번호${principal.getEmployeeId()}</span>
          <div id="logo_info" class="form">
            <div>구독 <i id="iconSub"
                class='${detailDto.subed ? "fa-solid" : "fa-regular"} fa-heart my_pointer my_red'></i>
            </div>
            <!-- subscribe_btn -->
            <div class="logo_form">
              <div class="info_img">
                <img src="assets/resume/face1.jpg" width="160" height="170" />
              </div>
            </div>
          </div>
          <!-- logo -->

          <div id="basic_info" class="form">
            <div class="form_title">
              <h2 class="title">회사 정보</h2>
            </div>
            <div class="basic_form">
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">회사명</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.companyName}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">설립년도</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introBirth}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">주요업무</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introTask}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">평균연봉</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introSal}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">기업복지</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introWellfare}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">회사소개</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introContent}</span>
                </div>
              </div>
              <div class="basic_row">
                <div class="basic_list">
                  <p class="basic_list_item">회사위치</p>
                </div>
                <div class="basic_input">
                  <span>${detailDto.introLocation}</span>
                </div>
              </div>

            </div>
          </div>
          <!-- basic -->

          <div id="field_info" class="form">
            <div class="form_title">
              <h2 class="title">관심분야</h2>
            </div>
            <div class="field_form">
              <p>${detailDto.jobName}</p>
            </div>
          </div>
          <!-- field -->

        </div>
        <!-- company_detail -->
      </div>
    </div>
    <!-- body -->

    <script>
      //하트를 클릭햇을때 로직
      $("#iconSub").click(() => {
        let principalId = $("#principalId").val();
        if (principalId == "") {
          alert("로그인을하세요");
        } else {
          let isSubedState = $("#iconSub").hasClass("fa-solid");
          console.log($("#introId").val());
          console.log($("#subscribeId").val());
          console.log($("#principalId").val());
          console.log("클릭함");
          if (isSubedState) {
            deleteSub();
          } else {
            insertSub();
          }
        }
      });

      //DB에 insert요청하기
      function insertSub() {
        let introId = $("#introId").val();
        console.log("입력확인용");
        console.log($("#introId").val());
        $.ajax("/emp/companyIntroDetail/" + introId + "/subscribe", {
          type: "POST",
          dataType: "json"
        }).done((res) => {
          if (res.code == 1) {
            renderSub();
            $("#subscribeId").val(res.data.introId);
            console.log(res);
            location.reload();
          } else {
            alert("구독을 실패했습니다");
          }
        });
      }
      //DB에 delete요청하기
      function deleteSub() {
        let introId = $("#introId").val();
        let subscribeId = $("#subscribeId").val();
        console.log("삭제확인용");
        $.ajax("/emp/companyIntroDetail/" + introId + "/subscribe/" + subscribeId, {
          type: "DELETE",
          dataType: "json"
        }).done((res) => {
          if (res.code == 1) {
            renderCancelSub();
          } else {
            alert("구독취소에 실패했습니다")
          }
        });
      }


      //빨강하트 그리기
      function renderSub() {
        $("#iconSub").removeClass("fa-regular");
        $("#iconSub").addClass("fa-solid");
      }
      //검정하트 그리기
      function renderCancelSub() {
        $("#iconSub").removeClass("fa-solid");
        $("#iconSub").addClass("fa-regular");
      }
    </script>

    <%@ include file="../layout/footer.jsp" %>