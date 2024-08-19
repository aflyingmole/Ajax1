package test.controller;

import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.dao.MovieDao;
import test.vo.MovieVo;

@WebServlet("/detail")
public class MovieController extends HttpServlet {
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mnum=Integer.parseInt(request.getParameter("mnum"));
		MovieDao dao=MovieDao.getInstance();
		MovieVo vo= dao.select(mnum);
		request.setAttribute("vo", vo);
		request.getRequestDispatcher("/5/movie.jsp").forward(request, response);
	}
}









