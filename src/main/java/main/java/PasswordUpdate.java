package main.java;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/PasswordUpdate")
public class PasswordUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String updatedPassword = request.getParameter("updatedPassword");
		System.out.println("UpdatedPassword - " + updatedPassword);
		ArrayList<User> list = (ArrayList<User>) getServletContext().getAttribute("Data");
		HttpSession session = request.getSession();
		String userName = session.getAttribute("userName").toString();
		
		//Password Update
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).userName.equals(userName)) {
				//Updating the password
				list.get(i).setPassword(updatedPassword);
				ServletContext context = getServletContext();
				context.setAttribute("Data", list);
				System.out.println("User Password Updated");
				request.setAttribute("updated", "Password Updated");
				RequestDispatcher dispatcher = request.getRequestDispatcher("WelcomePage.jsp");
				dispatcher.forward(request, response);
			}
		}
	}

}
