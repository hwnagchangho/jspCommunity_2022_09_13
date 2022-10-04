<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
Map<String, Object> articleRow = (Map<String, Object>) request.getAttribute("articleRow");
%>

<!doctype html>
<head>
  <meta charset="UTF-8">
  <title>게시물 수정</title>
</head>
<body>
    <h1>게시물 수정</h1>
    <form action="doModify" method="POST">
        <input type="hidden" autocomplete"off" name="id" value="${param.id}">

        <div>번호 :  <%= (int) articleRow.get("id")%></div>
        <div>날짜 :  <%= (String) articleRow.get("regDate")%></div>
        <div>제목 :  <input name="title" placeholder="제목을 입력해주세요." value="<%= (String) articleRow.get("title")%>" type="text"></div>
        <div>내용 :  <textarea name="body" placeholder="내용을 입력해주세요."><%= (String) articleRow.get("body")%></textarea></div>
        <div>
          <button type="submit">수정</button>
          <a href="list">리스트로 돌아가기</a>
        </div>
    </form>
</body>
</html>