package com.myorg.javacourse;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class StockDetailsServlet extends HttpServlet {
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			resp.setContentType("text/html");
			Date date1 = new Date();
			Date date2 = new Date();
			Date date3 = new Date();

			Stock stock1 = new Stock ("PIH",(float)13.1,(float)12.4,date1);
			Stock stock2 = new Stock ("AAL",(float)5.78,(float)5.5,date2);
			Stock stock3 = new Stock ("CAAS",(float)32.2,(float)31.5,date3);
			
			  resp.getWriter().println(stock1.getHtmlDescription());            
	            resp.getWriter().println(stock2.getHtmlDescription());            
	            resp.getWriter().println(stock3.getHtmlDescription());  
}
}
