package com.studentDataStore;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/studDisplay")
public class StudDisplay extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		StudService service = new StudService();

		List<Student> list = service.display();

		String str = "<table><tr> <th> Id</th> <th> Name</th> <th> Age</th> <th>Update</th> </tr>";
		for (Student st : list) {
			String s = "<tr> <td> " + st.getId() + "</td> <td>" + st.getName() + "</td><td> " + st.getAge()
					+ "</td><td><a href=\"studEdit.jsp\" class=\"action-btn edit-btn\">Edit</a><a href=\"studDelete.jsp\" class=\"action-btn delete-btn\">Delete</a></td></tr>";
			str += s;
		}
		str += "</table>";

		req.setAttribute("stable", str);
		if (list != null) {

			RequestDispatcher reqDis = req.getRequestDispatcher("studDisplay.jsp");
			reqDis.forward(req, resp);
		} else {
			resp.getWriter().print("<h2>No data available here<h2>");
		}

	}

}
