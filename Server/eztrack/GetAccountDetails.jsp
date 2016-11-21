<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<%
	int userId;
	try{
		userId = Integer.parseInt(request.getParameter("u_id"));
	}
	catch(Exception e){
		System.out.println("Exception parsing userid in GetAcountDetails :- "+e);
		userId = 0;
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
		query = "select fname, lname, username from users where u_id = ?";

		St = Db.prepareStatement(query);
		
		St.setInt(1,userId);

		Results= St.executeQuery();

		out.println("{");
		if(Results.next()){
			out.println("\"name\":\""+Results.getString(1)+" "+Results.getString(2)+"\",");
			out.println("\"username\":\""+Results.getString(3)+"\"");
		}
		else{
			out.println("\"name\":\"null\",");
			out.println("\"username\":\"null\"");
		}
		out.println("}");
	}
	catch(SQLException error)
	{
		System.out.println("SQL Exception error 104:\t"+error);
	}
	catch(Exception error)
	{
		System.out.println("Exception error 104:\t"+error);
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