package com.pro;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Insert_comment")
public class Insert_comment extends HttpServlet {
		
	public void doPost(HttpServletRequest request,HttpServletResponse response){
		
		String adm_id="";
		String emp_id=request.getParameter("id");
		String comments=request.getParameter("comments");
		String rating=request.getParameter("rating");
		String status=request.getParameter("status");
		Cookie[] ck=request.getCookies();
		for(int i=0;i<ck.length;i++){
			if(ck[i].getName().equals("emp_userid")){
				adm_id=ck[i].getValue();
			}
		}
		System.out.println(adm_id +"done : "+emp_id + " : "+comments +" : " + rating);
		
		try {
			Connection con=ForConnection.con();
			Statement st=con.createStatement();
			st.executeQuery(" insert into comments values ('"+emp_id+"','"+adm_id+"','"+rating+"','"+comments+"')");
			
			
			
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
