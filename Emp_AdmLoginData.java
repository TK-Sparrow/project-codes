package com.pro;
import java.io.*;
import java.lang.*;
import java.util.*;
import java.security.MessageDigest;
import java.sql.*;

public class Emp_AdmLoginData {

	public static void main(String[] args) throws ClassNotFoundException, SQLException {
		// TODO Auto-generated method stub
		
		System.out.println("Press 1 for employee and rest for admin");
		Scanner sc = new Scanner(System.in);
		
		int n=sc.nextInt();
		sc.nextLine();
		if(n==1) {
			System.out.println("No of employees");
			int a=sc.nextInt();
			sc.nextLine();
			while(a-->0) {
		System.out.println("      Userid");
		String empid=sc.nextLine();
		//sc.hasNextLine();
		System.out.println("      Password");
		String password=sc.nextLine();
		String enc_password=hash(password);
		int status=0;
		empInsert(empid,enc_password,status);
		
			}
			System.out.println("Employee data inserted");
		}
		
		else {
			System.out.println("No of Staff");
			int b=sc.nextInt();
			sc.nextLine();
			while(b-->0) {
				System.out.println("      userid");
				String empid=sc.nextLine();
				System.out.println("      Password");
				String password=sc.nextLine();
				System.out.println("      Designation AD or TR or HR");
				String desig=sc.nextLine();
				String enc_password=hash(password);
				admInsert(empid,enc_password,desig);
						
			}
			System.out.println("Admin data inserted");
			
		}
		
		

	}
	
	static Connection con() throws ClassNotFoundException,SQLException {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","user_id","hello");
		return con;
	}
	
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
	
	
	static void empInsert(String empid,String password,int status) throws SQLException,ClassNotFoundException {
		Connection con=con();
		Statement st=con.createStatement();
		st.executeUpdate("insert into emp_login values('"+empid+"','"+password+"','"+status+"')");

}
	static void admInsert(String id,String password,String desig) throws ClassNotFoundException, SQLException {
		Connection con=con();
		Statement st=con.createStatement();
		st.executeUpdate("insert into adm_login values('"+id+"','"+password+"','"+desig+"')");
		
		
	}
}
