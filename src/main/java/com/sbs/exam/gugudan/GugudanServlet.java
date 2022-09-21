package com.sbs.exam.gugudan;

import com.sbs.exam.Rq;
import jakarta.servlet.RequestDispatcher;
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

    int dan = rq.getIntParam("dan", 9); // defaultValue 값이 Object로 던져진다.
    int limit = rq.getIntParam("limit", 9);

    req.setAttribute("dan", dan);
    req.setAttribute("limit", limit);

    // gugudan2.jsp 에게 나머지 작업을 토스
    RequestDispatcher requestDispatcher = req.getRequestDispatcher("/gugudan2.jsp");
    requestDispatcher.forward(req, resp);

  }
}
