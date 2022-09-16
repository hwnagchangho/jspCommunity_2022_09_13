<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<%
int dan = Integer.parseInt(request.getAttribute("dan"));
int limit = Integer.parseInt(request.getAttribute("limit"));
%>

<h1><%=dan%></h1>
<% for(int i = 1; i <= limit; i++){ %>
<div> <%=dan%> * <%=i%> = <%=dan * i%> </div>
<% } %>
