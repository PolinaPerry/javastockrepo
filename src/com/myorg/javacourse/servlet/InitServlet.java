package com.myorg.javacourse.servlet;

import javax.servlet.ServletException;

import org.algo.service.ServiceManager;

import com.myorg.javacourse.service.PortfolioManager;


public class InitServlet extends javax.servlet.http.HttpServlet{

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		PortfolioManager pm = new PortfolioManager();
		ServiceManager.setPortfolioManager(pm);

	}

}
