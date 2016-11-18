<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
<%

	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	out.println("entering try block");
try {
	Class.forName("com.mysql.jdbc.Driver");
    String dbName = System.getProperty("RDS_DB_NAME");
    String userName = System.getProperty("RDS_USERNAME");
    String password = System.getProperty("RDS_PASSWORD");
    String hostname = System.getProperty("RDS_HOSTNAME");
    String port = System.getProperty("RDS_PORT");
  
    String jdbcUrl = "jdbc:mysql://" + hostname + ":" + port + "/" + dbName + "?user=" + userName + "&password=" + password;
//     logger.trace("Getting remote connection with connection string from environment variables.");
    Connection con = DriverManager.getConnection(jdbcUrl);
    out.println(jdbcUrl);
    
//     return con;
  }
  catch (ClassNotFoundException e) { out.println("Error" + e);}
  catch (SQLException e) { System.out.println("Error d "+ e);}
  
%>