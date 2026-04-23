package com.studentDataStore;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/studRegister")
public class StudRegister extends HttpServlet{
  @Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	   String idStr=req.getParameter("id");
	   String nameStr=req.getParameter("name");
	   String ageStr=req.getParameter("age");
	   if(idStr==null || idStr.isEmpty()|| ageStr==null||ageStr.isEmpty()||nameStr.isEmpty()) {
		req.setAttribute("invalid", "You are Entering wrong data");
		   
		   RequestDispatcher rs=req.getRequestDispatcher("studRegister.jsp");
		  rs.include(req, resp);
	   }
	   else {
	  int id=Integer.parseInt(req.getParameter("id"));
	  String name=req.getParameter("name");
	  int age=Integer.parseInt(req.getParameter("age"));
	  System.out.println(id+" ,"+name+" ,"+age);
	  
	  Student st=new Student();
	  st.setId(id);
	  st.setName(name);
	  st.setAge(age);
	  
	  StudService service=new StudService();
	 int res= service.save(st);
	  String success="Student Registration Successful !!!";
	  if(res!=0) {
		  RequestDispatcher rs=req.getRequestDispatcher("studWelcome.jsp");
		 req.setAttribute("success", success);
		 rs.forward(req, resp);
	  }
	  else {
		  RequestDispatcher reqDis=req.getRequestDispatcher("studRegister.jsp");
		  reqDis.include(req, resp);
	  }
	  
	   }  
	 
	  
}
}
