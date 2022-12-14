<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <div id="company_wrap">
      <footer id="sri_footer" class="sri_footer">
        <div class="wrap_footer">
          <div
            class="links"
            role="navigation"
            aria-label="4조 서비스 정책 및 이용문의"
          >
            <ul>
              <li class="first">
                <a
                  href=""
                  target="_blank"
                  rel="noopener"
                  title="회사소개 새창열기"
                  >회사소개</a
                >
              </li>
              <li>
                <a
                  href=""
                  target="_blank"
                  rel="noopener"
                  title="인재채용 새창열기"
                  >인재채용</a
                >
              </li>
              <li>
                <a href="" title="회원약관 바로가기">회원약관</a>
              </li>
              <li class="bold">
                <a href="" title="개인정보처리방침 바로가기"
                  >개인정보처리방침</a
                >
              </li>
              <li>
                <a
                  href=""
                  onclick="window.open(this.href, '이메일무단수집거부', 'width=380,height=200,left=0,top=0'); return false;"
                  rel="noopener"
                  title="이메일무단수집거부 바로가기"
                  >이메일무단수집거부</a
                >
              </li>
              <li>
                <a href="" target="_blank" rel="noopener" title="채용정보 API"
                  >채용정보 API</a
                >
              </li>
              <li>
                <a href="" target="_self" rel="noopener" title="제휴문의"
                  >제휴문의</a
                >
              </li>
              <li>
                <a href="" title="고객센터 바로가기">고객센터</a>
              </li>
            </ul>
          </div>
          <div class="copyright">
            <div class="help_list">
              <dl>
                <dt>4조 고객센터</dt>
                <dd>051-111-1111 (평일 09:00~18:00, 주말공휴일 휴무)</dd>
              </dl>
              <dl>
                <dt>이메일</dt>
                <dd>
                  <a href="" target="_blank" title="이메일 바로가기"
                    >4조@naver.com</a
                  >
                </dd>
              </dl>
              <dl>
                <dt>FAX</dt>
                <dd>051-111-1111</dd>
              </dl>
            </div>
          </div>
        </div>
      </footer>
    </div>
  </body>
 <script>
 /* 기업정보 수정*/
 $("#btn_update").click(()=>{
  companyUpdate();
});

function companyUpdate(){

  let companyId = $("#companyId").val();

  let data ={
    companyNumber:$("#companyNumber").val(),
    companyName:$("#companyName").val(),
    companyEmail:$("#companyEmail").val(),
    companyTel:$("#companyTel").val(),
    companyLocation:$("#companyLocation").val(),
    companyUsername:$("#companyUsername").val(),
    companyPassword:$("#companyPassword").val()
  };
  console.log(data);

  $.ajax("/co/companyUpdate/" + companyId, {
      type: "PUT",
      dataType: "json",
      data: JSON.stringify(data),
      headers: {
          "Content-Type": "application/json; charset=utf-8"
      },
  }).done((res) => {
      if (res.code == 1) {
          alert("기업정보수정 완료");
          console.log(res);
          location.reload;
      } else {
          alert("업데이트에 실패하였습니다");
      }
  });          
}

/* 기업회원 탈퇴*/
$("#btn_delete").click(()=>{
  Delete();
});

function Delete(){
  
  console.log("삭제");
  let companyId = $("#companyId").val();

  $.ajax("/co/companyDelete/" + companyId, {
      type: "DELETE",
      dataType: "json"

  }).done((res) => {
      if (res.code == 1) {
          alert("기업회원탈퇴 완료");
          console.log(res);
          location.href="/";
      } else {
          alert("회원탈퇴에 실패하였습니다");
      }
  });          
}
 </script>
</html>
