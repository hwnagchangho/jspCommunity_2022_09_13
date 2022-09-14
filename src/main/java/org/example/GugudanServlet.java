package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/gugudan") // WebServlet이라는 annotation(주석)을 붙혀주어야지 gugudan이라는 url을 사용할 수 있다.
public class GugudanServlet extends HttpServlet { // extends HttpServlet을 해주어야 doget 오바라이드 사용가능
  @Override
  protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException { //alt + insert => override => doget
    req.setCharacterEncoding("UTF-8"); // 들어오는 데이터를 UTF-8로 해석하겠다.
    resp.setCharacterEncoding("UTF-8"); // 완성되는 HTML의 인코딩을 UTF-8로 하겠다.
    resp.setContentType("text/html; charset-utf-8"); // 브라우저에게 우리가 만든 결과물이 UTF-8이라고 알리는 의미

    int dan = Integer.parseInt(req.getParameter("dan")); // parameter를 써주면 /gugudan?dan=숫자 입력해야한다.
    int limit = Integer.parseInt(req.getParameter("limit"));

    resp.getWriter().append("<h1>%d단</h1>".formatted(dan)); //<h1></h1> 제목태그 (마크업이라한다.)
    for (int i = 1; i <= limit; i++) {
      resp.getWriter().append("<div>%d * %d = %d</div>\n".formatted(dan, i, dan * i)); // 기본적으로 div 태그를 많이쓴다.
    }
  }
}
