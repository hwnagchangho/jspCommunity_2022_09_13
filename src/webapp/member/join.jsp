<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!doctype html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
</head>
<body>
    <h1>회원가입</h1>

    <script>
      let JoinForm__submitDone = false;

      function JoinForm__submit(form){
        if( JoinForm__submitDone ) {
            alert('처리중 입니다');
            return;
        }

        if (form.loginId.value == 0 ) {
            alert('로그인 아이디를 입력해주세요');
            form.loginId.focus();

            return;
        }

        form.loginId.value = form.loginId.value.trim();
        if (form.loginPw.value == 0 ) {
            alert('로그인 비밀번호를 입력해주세요');
            form.loginPw.focus();

            return;
        }

        form.loginId.value = form.loginId.value.trim();
        if (form.loginPwConfirm.value == 0 ) {
            alert('로그인 비밀번호 확인을 입력해주세요');
            form.loginPwConfirm.focus();

            return;
         }

        form.loginId.value = form.loginId.value.trim();
        if (form.name.value == 0 ) {
            alert('이름을 입력해주세요');
            form.name.focus();

            return;
         }

         form.submit();
         joinForm__submitDone = true;
      }
    </script>

    <form action="doJoin" method="POST" onsubmit="JoinForm__submit(this); return false;">
        <div>아이디 : <input autocomplete="on" placeholder="아이디를 입력해주세요." name="loginId" type="text"></div>
        <div>비밀번호 : <input autocomplete="on" placeholder="비밀번호를 입력해주세요." name="loginPw" type="password"></div>
        <div>비밀번호 확인 : <input autocomplete="on" placeholder="비밀번호 확인 입력해주세요." name="loginPwConfirm" type="password"></div>
        <div>이름 : <input autocomplete="on" placeholder="이름 입력해주세요." name="name" type="text"></div>

        <div>
          <button type="submit">가입</button>
          <button type="submit">
            <a href="../home/main">취소</a>
          </button>
        </div>
    </form>
</body>
</html>