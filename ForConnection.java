package com.pro;

import java.sql.*;

public class ForConnection {
	
	
	


public static Connection con() throws ClassNotFoundException,SQLException {
	Class.forName("oracle.jdbc.driver.OracleDriver");
	Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","user_id","hello");
	return con;
}

}
