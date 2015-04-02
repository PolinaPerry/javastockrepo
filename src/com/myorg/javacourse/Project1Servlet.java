package com.myorg.javacourse;

import java.io.IOException;
import javax.servlet.http.*;

@SuppressWarnings("serial")
public class Project1Servlet extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/plain");
		int num1 = 4;
		int num2 = 3;
		int num3 = 7;
		resp.getWriter().println( "Result of" + "" + "(" + num1 + "+" + num2 + ")" + "*" + num3 + "=" + ((num1 + num2) * num3));
		
	}
}
