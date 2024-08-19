package test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.dao.CommentsDao;
import test.vo.CommentsVo;

@WebServlet("/comm/insert")
public class CommentsInsertController extends HttpServlet{
	//http://localhost:8080/ajax01/comm/insert?mnum=1&id=test&comments=good!
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		int mnum=Integer.parseInt(req.getParameter("mnum"));
		String id=req.getParameter("id");
		System.out.println("id:" + id);
		String comments=req.getParameter("comments");
		CommentsDao dao=CommentsDao.getInstance();
		CommentsVo vo=new CommentsVo(0, mnum, id, comments);
		int n=dao.insert(vo);
		//결과값을 xml로 응답하기
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		if(n>0) {
			pw.print("<code>success</code>");
		}else {
			pw.print("<code>fail</code>");
		}
		pw.print("</result>");
		
	}
}















