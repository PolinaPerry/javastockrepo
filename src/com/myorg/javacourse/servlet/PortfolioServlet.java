package com.myorg.javacourse.servlet;

import java.io.IOException;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;

import com.myorg.javacourse.model.Portfolio;
import com.myorg.javacourse.service.PortfolioManager;

/*
 * This servlet handles user portfolio management requests
 */
public class PortfolioServlet extends HttpServlet {
	
	/*
	 * Gets request handler for this servlet
	 */
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		resp.setContentType("text/html");
		String respString = "";
		PortfolioManager portfolioManager = new PortfolioManager();
		Portfolio portfolio = portfolioManager.getPortfolio();
		Portfolio portfolio2= new Portfolio (portfolio);
		portfolio2.title = "portfolio#2";
		respString = "<h1>First print</h1>";
		respString += portfolio.getHtmlString() + portfolio2.getHtmlString();
		portfolio.removeStock(0);
		respString += "<h1>Second Print</h1>";
		respString += portfolio.getHtmlString() + portfolio2.getHtmlString();
		portfolio2.getLastStock().setBid((float)55.55);
		respString += "<h1>Third Print</h1>";
		respString += portfolio.getHtmlString() + portfolio2.getHtmlString();
		resp.getWriter().println( respString);
		
	}
}
