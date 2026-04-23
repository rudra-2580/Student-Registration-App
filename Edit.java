package com.studentDataStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/edit")
public class Edit extends HttpServlet{
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	 String idStr=req.getParameter("id");
	   String nameStr=req.getParameter("name");
	   String ageStr=req.getParameter("age");
	   if(idStr==null || idStr.isEmpty()|| ageStr==null||ageStr.isEmpty()||nameStr.isEmpty()) {
		req.setAttribute("invalid", "You are Entering wrong data");
		   
		   RequestDispatcher rs=req.getRequestDispatcher("studEdit.jsp");
		  rs.include(req, resp);
	   }
	   else {
		   int id=Integer.parseInt(idStr);
		   String name=nameStr;
		   int age=Integer.parseInt(ageStr);
		   
		   StudService service=new StudService();
			 int res= service.update(name, age, id);
			 String success="Edit operation done Successfully !!!";
			 if(res!=0) {
				  RequestDispatcher rs=req.getRequestDispatcher("studWelcome.jsp");
				 req.setAttribute("success", success);
				 rs.forward(req, resp);
			  }
			  else {
				  RequestDispatcher reqDis=req.getRequestDispatcher("studEdit.jsp");
				  reqDis.include(req, resp);
			  }
	   }













}
}
