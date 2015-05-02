package com.myorg.javacourse;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MathCalculations extends HttpServlet{
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
			resp.setContentType("text/html");
			int radius= 50;
			double angleB = (Math.PI)/6 ;
			double length = angleB / radius ;
			int base= 20;
			int exp= 13;
			double result= Math.pow(base, exp) ;		
			double area= radius * radius * (Math.PI);
			String line1 = new String ("Calculation 1: Area of circle with radius" + " " + radius + " " + "is:" + " " + area + " " + "square cm." );
			
			String line2 = new String ("Calculation 2: Length of opposite where angle B is" + " " + angleB + " " + "degrees and Hypotenuse length is" + " " + radius + " " + "cm is:" + " " + length);
			
			String line3 = new String ("Calculation 3:  Power of" + " " + base + " " + "with exp of" + " " + exp + " " + "is" + " " + result);
			
			
			resp.getWriter().println(line1 + "<br>" + line2 + "<br>" +line3);
			
	}
}
			
		
	
	
	
	



