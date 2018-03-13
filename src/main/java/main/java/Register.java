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

@WebServlet("/Register")

public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static ArrayList<User> list = new ArrayList<User>();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("outside condition " + userName);
		//User Registration 
		if (userName.length() > 4) {
			System.out.println("list invoked");
			
			User a = new User("userName", "password");
			a.setUserName(userName);
			a.setPassword(password);
			list.add(a);
			ServletContext context = getServletContext();
			context.setAttribute("Data", list);
			System.out.println("User Registered");
			request.setAttribute("Registered", "Registered Successfully");
			RequestDispatcher dispatcher = request.getRequestDispatcher("LoginPage.jsp");
			dispatcher.forward(request, response);

		} else {
			System.out.println("list is not invoked");
			request.setAttribute("Invalid", "username and password is required");
			RequestDispatcher dis = request.getRequestDispatcher("Register.jsp");
			dis.forward(request, response);
		}
	}

}
