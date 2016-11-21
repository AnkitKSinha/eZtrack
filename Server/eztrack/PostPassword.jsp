<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<%
	int userId = 0;
	String curPassword = new String(), newPassword = new String();

	try{
		userId = Integer.parseInt(request.getParameter("u_id"));
		curPassword = request.getParameter("curPassword");
		newPassword = request.getParameter("newPassword");
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
		query = "select password from users where u_id =?";

		St = Db.prepareStatement(query);
		St.setInt(1,userId);
		Results = St.executeQuery();
		out.println("{");
		if(Results.next()){
			System.out.println("Current:" + curPassword + "Db: "+Results.getString(1));
			if(Results.getString(1).equals(curPassword)){
				query = "update users set password  = ? where u_id = ?";
				St = Db.prepareStatement(query);
				St.setInt(2,userId);
				St.setString(1,newPassword);
				St.executeUpdate();
				out.println("\"code\":\"1\",");
				out.println("\"msg\":\"Password Updated Successfully.\"");
			}
			else{
				out.println("\"code\":\"0\",");
				out.println("\"msg\":\"Current Password Mismatch.\"");
			}
		}
		else{
			out.println("\"code\":\"-1\",");
			out.println("\"msg\":\"User doesn't exist.\"");
		}
		out.println("}");
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