package com.sbs.exam;

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

    Rq rq = new Rq(req, resp);

    int dan = rq.getIntParam("dan", 0);
    int limit = rq.getIntParam("limit", 0);

    rq.appendBody("<h1>%d단</h1>".formatted(dan));
    for (int i = 1; i <= limit; i++) {
      rq.appendBody("<div>%d * %d = %d</div>\n".formatted(dan, i, dan * i));
    }
  }
}
