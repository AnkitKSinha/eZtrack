<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<%
	int userId = 0;
	String fname = new String(), lname = new String();
	String username = new String();
	try{
		userId = Integer.parseInt(request.getParameter("u_id"));
		fname = request.getParameter("fname");
		lname = request.getParameter("lname");
		username = request.getParameter("username");
	}
	catch(Exception e){
		System.out.println("Exception getting profile details in PostProfile :- "+e);
	}
	

	System.out.println("u_id: " + userId);

	PreparedStatement St=null;
	Connection Db=null;
	ResultSet Results=null;
	
	try
	{
		Class.forName("com.mysql.jdbc.Driver");
		Db=DriverManager.getConnection("jdbc:mysql://localhost/eztrack","root","p@t@n@hi");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception 101:\t"+error);
	}
	catch(ClassNotFoundException error)
	{
		System.out.println("Class Not Found Error 101:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("General Exception 101:\t"+error);
	}
	String query=new String();
	int count=0;
	try
	{
		query = "update users set username = ?, fname = ?, lname = ? where u_id =?";

		St = Db.prepareStatement(query);
		
		St.setInt(4,userId);
		St.setString(1,username);
		St.setString(2,fname);
		St.setString(3,lname);


		St.executeUpdate();

		out.println("success");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 104:\t"+error);
		out.println("error");
	}
	catch(Exception error)
	{
		System.out.println("Exception error 104:\t"+error);
		out.println("error");
	}
	try
	{
		Db.close();
	}
	catch(Exception error)
	{
		System.out.println("Error Closing :"+error);
	}
%>