package test.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import test.dao.CommentsDao;
import test.vo.CommentsVo;

@WebServlet("/comm/list")
public class CommentsListController extends HttpServlet{
	//http://localhost:8080/ajax01/comm/list?mnum=1
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//영화번호 얻어오기
		int mnum=Integer.parseInt(req.getParameter("mnum"));
		CommentsDao dao=CommentsDao.getInstance();
		//영화번호에 대한 댓글 목록 DB에서 얻어오기
		ArrayList<CommentsVo> list=dao.cList(mnum);
		//XML로 응답하기
		resp.setContentType("text/xml;charset=utf-8");
		PrintWriter pw=resp.getWriter();
		pw.print("<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		pw.print("<result>");
		//ArrayList에 담긴 댓글정보를 xml형식으로 응답하기
		for(CommentsVo vo:list) {
			pw.print("<comm>");
			pw.print("<num>" + vo.getNum() +"</num>");
			pw.print("<mnum>" + vo.getMnum() +"</mnum>");
			pw.print("<id>" + vo.getId() +"</id>");
			pw.print("<comments>" + vo.getComments() +"</comments>");
			pw.print("</comm>");
		}		
		pw.print("</result>");
		pw.close();
	}
}












