package com.studentDataStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/delete")
public class Delete extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	String idStr=req.getParameter("id");
	if(idStr==null || idStr.isEmpty()) {
		req.setAttribute("invalid", "Enter Data Correctly");
		   
		   RequestDispatcher rs=req.getRequestDispatcher("studDelete.jsp");
		  rs.include(req, resp);
	}
	else {
		
		int id=Integer.parseInt(idStr);
		StudService service=new StudService();
		int res=service.delete(id);
		String success="Delete operation done successfully !!";
		if(res!=0) {
			  RequestDispatcher rs=req.getRequestDispatcher("studWelcome.jsp");
			 req.setAttribute("success", success);
			 rs.forward(req, resp);
		  }
		  else {
			  RequestDispatcher reqDis=req.getRequestDispatcher("studDelete.jsp");
			  reqDis.include(req, resp);
		  }
	}













}
}
