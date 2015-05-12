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
		PortfolioManager portfolioManager = new PortfolioManager();
		Portfolio portfolio = portfolioManager.getPortfolio();

		resp.getWriter().println( portfolio.getHtmlString());
		
	}
}
