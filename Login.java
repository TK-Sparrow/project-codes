package com.pro;

import java.io.IOException;
import java.security.MessageDigest;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;
import java.io.*;

/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
	static String hash(String password) {
		MessageDigest md;
		String enc_pass=null;
		try {
			md=MessageDigest.getInstance("MD5");
			byte[] pass_b=password.getBytes();
			enc_pass=new String (md.digest(pass_b));
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
			return enc_pass;
	}
	
    public Login() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String param=request.getParameter("slct");
		PrintWriter out=response.getWriter();
		out.println(param);
		if(param.equals("Emp")) {
		String name=request.getParameter("user_id");
		String pas=request.getParameter("pass_word");
		
		try {
			//	out.println("enterdsa");
			Connection con=ForConnection.con();
				Statement st=con.createStatement();
				String url="select * from emp_login";
				ResultSet rs=st.executeQuery(url);
				int flag=0;
				//out.println("here"+ rs);
				String pass=hash(pas);
				
				while(rs.next()) {
					
					if( name.equals(rs.getString(1)) && pas.equals(rs.getString(2))){
						out.println("hello welcome");
						Cookie ck=new Cookie("userid",name);
						response.addCookie(ck);
						RequestDispatcher rd=request.getRequestDispatcher("create-profile.html");
						rd.forward(request, response);
						
						
						flag=1;
					}
					
				}
				if(flag==0) {
					out.println("try man");
					RequestDispatcher rd =request.getRequestDispatcher("index.html");
					rd.forward(request, response);
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
		
		
		else {
		String name1=request.getParameter("user_id");
		String pass=request.getParameter("pass_word");
		//String designation=request.getParameter("desig");
		
		
		try {
			//	out.println("enterdsa");
			Connection con=ForConnection.con();
				Statement st=con.createStatement();
				String url="select * from adm_login";
				ResultSet rs1=st.executeQuery(url);
				int flag=0;
				
				String pass1=hash(pass);
				
				//out.println("here"+ rs);
				
				
				while(rs1.next()) {
					//out.println(rs.getString(1)+" "+rs.getString(3));
					//out.println(name+" "+pass);
					//out.println("flag is "+flag);
					if( name1.equals(rs1.getString(1)) && pass1.equals(rs1.getString(2))){
						out.println("hello welcome admin");
						Cookie ck=new Cookie("userid",name1);
						Cookie ck1=new Cookie("desi",rs1.getString(3));
						response.addCookie(ck);
						response.addCookie(ck1);
						RequestDispatcher rd=request.getRequestDispatcher("admin.jsp");
						rd.forward(request, response);
						flag=1;
					}
					
				}
				if(flag==0) {
					out.println("try man admin");
					RequestDispatcher rd =request.getRequestDispatcher("index.html");
					rd.forward(request, response);
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		}
	}
		
		
		
		
		//out.println("atleast here");
		
		
		
		
		
		
	

}
