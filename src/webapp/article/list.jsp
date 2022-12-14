<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.Map"%>

<%
List<Map<String, Object>> articleRows = (List<Map<String, Object>>) request.getAttribute("articleRows");
int cPage = (int) request.getAttribute("page");
int totalPage = (int) request.getAttribute("totalPage");
%>

<!doctype html>
<head>
  <meta charset="UTF-8">
  <title>게시물 리스트</title>
</head>
<body>
    <h1>게시물 리스트</h1>
    <%@ include file="../part/topBar.jspf"%>

    <div>
      <a href="../home/main">홈으로 이동</a>
      <a href="write">게시물 작성</a>
    </div>
    <table border="1">
      <thead>
      <colgroup>
        <col>
        <col width="200" />
        <col width="80" />
        <col width="80" />
      </colgroup>
        <tr>
          <th>번호</th>
          <th>날짜</th>
          <th>제목</th>
          <th>비고</th>
        </tr>
      </thead>

      <tbody>
         <%
         for(Map<String, Object> articleRow : articleRows){
         %>
        <tr>
         <td><%=articleRow.get("id")%></td>
         <td><%=articleRow.get("regDate")%></td>
         <td><a href="detail?id=<%=articleRow.get("id")%>"><%=articleRow.get("title")%></a></td>
         <td>
           <a href="doDelete?id=<%=articleRow.get("id")%>">삭제</a>
           <a href="modify?id=<%=articleRow.get("id")%>">수정</a>
         </td>
        </tr>
        <%
        }
        %>
      </tbody>
    </table>
    <style type="text/css">
      .page > a.red{
        color:red;
      }
      a{text-decoration:none;}
    </style>
    <div class="page" style="display:inline-block;">
      <% if ( cPage > 1){ %>
           <a href="list?page=1">◀</a>
      <%}%>
      <%
       int pageMenuSize = 4;
       int from = cPage;
       if( from < 1 ) {
        from = 1;
       }
       int end = cPage + pageMenuSize;
       if( end > totalPage ) {
        end = totalPage;
       }
       for(int i = from; i <= end; i++) {
      %>
        <a class="<%=cPage == i ? "red" : "" %>" href="list?page=<%=i%>"><%=i%></a>
      <%}%>
    </div>
    <% if ( cPage < totalPage){ %>
    <a href="list?page=<%=totalPage%>">▶</a>
    <%}%>
</body>
</html>