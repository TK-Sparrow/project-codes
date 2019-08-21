package com.pro;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import java.util.Date;



/**
 * Servlet implementation class Insertion
 */
@WebServlet("/Insertion")
public class Insertion extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Insertion() {
        super();
        // TODO Auto-generated constructor stub
    }

		protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
			
			
			PrintWriter out=res.getWriter();
					res.setContentType("text/html");
					PrintWriter pw=res.getWriter();
					
					Cookie[] ck=req.getCookies();
					String id="";
					for(int i=0;i<ck.length;i++){
						if(ck[i].getName().equals("userid")){
							id=ck[i].getValue();
						}
					}
					System.out.println("id : "+id);
					String fullname=req.getParameter("fullname");
					String  dob=req.getParameter("dob");
					
					Date date=null;
					try {
						date = getDate(dob);
					} catch (ParseException e2) {
						// TODO Auto-generated catch block
						e2.printStackTrace();
					}
					String gender=req.getParameter("gender");
					String maritial=req.getParameter("maritial");
					String phone1=req.getParameter("phone");
					long phone = number(phone1);
					String  email=req.getParameter("email");
					String address=req.getParameter("address");
					String path="";
					
				try {
					Personal(id, fullname, date, gender, maritial, phone, email, address, path);
				} catch (ClassNotFoundException | SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
					
					String designation=req.getParameter("designation");
					String currentctc1=req.getParameter("currentctc");
					long ctc=number(currentctc1);
					String currentlocation=req.getParameter("currentlocation");
					String requiredlocation =req.getParameter("requiredlocation");
					String experiance=req.getParameter("experience");
					long exp=number(experiance);
					String appliedjob=req.getParameter("appliedjob");
					String skills=req.getParameter("skills");
				
				try {
					work(id, designation, ctc, currentlocation, requiredlocation, exp, appliedjob, skills);
				} catch (ClassNotFoundException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				} catch (SQLException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}	
					
					String projecttitle[]=req.getParameterValues("title[]");
					String startdate[]=req.getParameterValues("startdate[]");
					String enddate[]=req.getParameterValues("enddate[]");
					String projectdesc[]=req.getParameterValues("projects[]");
					String acheivements[]=req.getParameterValues("Acheivements[]");
					
			try {
				projects(id, projecttitle, startdate, enddate, projectdesc);
			} catch (ClassNotFoundException | SQLException | ParseException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}		
					
					String schoolname=req.getParameter("schoolname");
					String schoolper=req.getParameter("schoolper");
					String schoolpassyear=req.getParameter("schoolpassyear");
					String Board=req.getParameter("Board");
					String stage="10";
					if(schoolname.equals("") || schoolname.isEmpty() || schoolpassyear.isEmpty() || schoolper.isEmpty() ){
						
					}
					else{
					
			try {
				education(id,stage,schoolname,"JL",schoolper,schoolpassyear );
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
					String collegename=req.getParameter("collegename");
					String collegeper=req.getParameter("collegeper");
					String collegepassyear=req.getParameter("collegepassyear");
					stage="12";
					if(collegename.equals("") || collegename.isEmpty() || collegeper.isEmpty() || collegepassyear.isEmpty() ){
						
					}
					else{
			try {
				education(id,stage,collegename,"KL",collegeper,collegepassyear );
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
					}
					String gradcoursetype=req.getParameter("Coursetype");
					String gradcollegename=req.getParameter("gradcollegename");
					String gradcollegeper=req.getParameter("gradcollegeper");
					String gradcollegepassyear=req.getParameter("gradcollegepassyear");
					stage="14";
					if(gradcollegename.equals("") || gradcollegename.isEmpty() || gradcollegeper.isEmpty() || gradcollegepassyear.isEmpty() ){
						
					}
					else{
			try {
				education(id,stage,gradcollegename,gradcoursetype,gradcollegeper,gradcollegepassyear );
			} catch (ClassNotFoundException | SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
					}
					String postCoursetype=req.getParameter("postCoursetype");
					String postgradcollegename=req.getParameter("postgradcollegename");
					String postgradcollegeper=req.getParameter("postgradcollegeper");
					String postgradcollegepassyear=req.getParameter("postgradcollegepassyear");
					stage="18";
					if(postgradcollegename.equals("") || postgradcollegename.isEmpty() || postgradcollegepassyear.isEmpty() || postgradcollegeper.isEmpty() ){
						
					}
					else{
						try {
							education(id,stage,postgradcollegename,postCoursetype,postgradcollegeper,postgradcollegepassyear );
						} catch (ClassNotFoundException | SQLException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}pw.println(fullname+" <br>  "+dob+" <br> "+gender+"  <br> "+maritial+"<br> "+phone+"  <br> "
							+ "  <br>"+email+" <br>  "+address+"  <br> "+designation+" <br>  "+" <br>  "+currentlocation+" <br>  "+requiredlocation+"<br>"
									+ "  <br> "+experiance+"  <br> "+appliedjob+" <br>  "+skills+" <br> "
											+ " <br>"+schoolname+"<br>   "+schoolper+" <br>  "+schoolpassyear+"  <br> "+Board+" <br>  "+collegename+" <br>  "+collegeper+"  <br> "+
									collegepassyear+"   "+gradcoursetype+"  <br> "+gradcollegename+" <br> "
											+"<br> "
													+ " <br> "+gradcollegeper+"   <br> "+gradcollegepassyear+"   <br>  "+postCoursetype+"  <br> "+postgradcollegename+"  <br> "+postgradcollegeper+" <br>   "+postgradcollegepassyear+"<br>");
					
					for(int i=0;i<projecttitle.length;i++)
					{
						pw.println(projecttitle[i]+" <br>");
						pw.println(startdate[i]+" <br>");
						pw.println(enddate[i]+" <br>");
						pw.println(projectdesc[i]+" <br>");
					}
					
					for(int i=0;i<acheivements.length;i++)
						pw.println(acheivements[i]+" <br>");	}
		
		static long number(String str) {
			if(str.equals("")){
				str="0";
			}
			long n=Long.parseLong(str);
			return n;
		}

		static Date getDate(String dob) throws ParseException {
			System.out.println(dob);
			System.out.println("hell");
			Date  date1=(Date) new SimpleDateFormat("yyyy-MM-dd").parse(dob);
			return date1;
		}
			
			
			
			
			
		
		static void Personal(String id,String fullname,Date date1,String gender,String maritial,long phone,String address,String  email,String path) throws ClassNotFoundException, SQLException {
			Connection con=ForConnection.con();
			Statement st=con.createStatement();
			String url="insert into personal values(?,?,?,?,?,?,?,?,?)";
			System.out.println("error");
			PreparedStatement ps=con.prepareStatement(url);
			ps.setString(1, id);
			ps.setString(2,fullname);
			ps.setDate(3, new java.sql.Date(date1.getTime()));
			if(gender.equalsIgnoreCase("male")){
				ps.setString(4,"m");
			}
			else{
				ps.setString(4,"f");
			}
			if(maritial.equalsIgnoreCase("single")){
				ps.setString(5,"s");
			}
			else{
				ps.setString(5,"m");
			}
			ps.setLong(6, phone);
			ps.setString(7,email);
			ps.setString(8,address);
			ps.setString(9, path);
			
			int row=ps.executeUpdate();
			System.out.println("error2");
			
		}
		
		static void work(String id,String designation,long ctc,String c_loc,String r_loc,long exp,String tier,
				String skills) throws ClassNotFoundException, SQLException {
			Connection con=ForConnection.con();
			Statement st=con.createStatement();
			String url="insert into work values(?,?,?,?,?,?,?,?)";
			
			PreparedStatement ps=con.prepareStatement(url);
			ps.setString(1,id);
			ps.setString(2,designation);
			ps.setLong(3, ctc);
			ps.setString(4,c_loc);
			ps.setString(5,r_loc);
			ps.setLong(6, exp);
			ps.setString(7,tier);
			ps.setString(8,skills);
		
			int row=ps.executeUpdate();
			
			
			
			
		}
		static void projects(String id,String[] projecttitle,String[] startdate,String[] enddate,String[]  desc) throws ClassNotFoundException, SQLException, ParseException {
			
			Connection con=ForConnection.con();
			Statement st=con.createStatement();
			
			for(int  i=0; i<projecttitle.length; i++) {
			String url="insert into projects values(?,?,?,?,?)";
			if(projecttitle[i].equals("") || projecttitle[i].isEmpty() || startdate[i].isEmpty() || enddate[i].isEmpty()){
			}
			else{
			PreparedStatement ps=con.prepareStatement(url);
			ps.setString(1, id);
			ps.setString(2,projecttitle[i]);
			Date d=getDate(startdate[i]);
			ps.setDate(3, new java.sql.Date(d.getTime()));
			Date e=getDate(enddate[i]);
			ps.setDate(4, new java.sql.Date(e.getTime()));
			ps.setString(5, desc[i]);
			ps.executeUpdate();	
			}
			}
		}
		
		
			
			static void education(String id,String stage,String name,String course,String percent,String pass) throws ClassNotFoundException, SQLException {
				
				Connection con=ForConnection.con();
				Statement st=con.createStatement();
				String url="insert into education values(?,?,?,?,?,?)";
				PreparedStatement ps=con.prepareStatement(url);
				ps.setString(1, id);
				ps.setString(2,stage);
				ps.setString(3,name);
				ps.setString(4,course);
				double d= Double.parseDouble(percent);
				Long l=Math.round(d);
				ps.setLong(5, l);
				Date d1=null;
				try {
					d1 = (Date) new SimpleDateFormat("yyyy").parse(pass);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
				ps.setDate(6,new java.sql.Date(d1.getTime()));
				ps.executeUpdate();
			}
		}










