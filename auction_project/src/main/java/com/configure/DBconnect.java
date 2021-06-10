package com.configure;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnect {
	public static Connection takeConnection()
	{
	Connection con= null;
	try
	{
	Class.forName("com.mysql.jdbc.Driver");

	String path="jdbc:mysql://localhost:3306/auction";
	String user="root";
	String pass="";

	con = DriverManager.getConnection(path,user,pass);
	}
	catch(Exception e)
	{
      e.printStackTrace();
	}
	return con;
	}
}
