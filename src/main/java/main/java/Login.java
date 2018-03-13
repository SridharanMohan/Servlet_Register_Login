package main.java;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.http.cookie.Cookie;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println(userName + "  " + password);
		ArrayList<User> list = new ArrayList<User>();
		list = (ArrayList<User>) request.getServletContext().getAttribute("Data");

		if (list == null) {
			request.setAttribute("unauthorized", "Please Register Not Authorized");
			RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
			dispatcher.forward(request, response);
		}

		else {

			for (User lists : list) {
				System.out.println("List of User " + lists.getUserName() + " " + lists.getPassword());

			}

			// System.out.println("UserPassword " + list.get(1).password.toString());

			// Authentication

			for (int i = 0; i < list.size(); i++) {
				if (list.get(i).userName.equals(userName)) {
					if (list.get(i).password.equals(password)) {
						// Authorized
						session.setAttribute("userName", userName);
						RequestDispatcher dispatcher = request.getRequestDispatcher("WelcomePage.jsp");
						dispatcher.forward(request, response);

					} else {
						// Incorrect password
						request.setAttribute("incorrectPassword", "Incorrect password");
						RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
						dispatcher.forward(request, response);
					}
				}
			}
			// Please Register Not Authorized
			request.setAttribute("unauthorized", "Please Register Not Authorized");
			RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
			dispatcher.forward(request, response);

		}

	}

}
