<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	
	<%

	int userId = Integer.parseInt(request.getParameter("u_id"));
	
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
		System.out.println("Exception 101:\t"+error);
	}
	String Query=new String(), Query2= new String();
	int count=0;
	try
	{
		Query = "select u.username,ud.ud_id, (select count(*) from user_notifications un where un.from_u_id=ud.u_id)count from users u, user_tracking_list ut, user_devices ud where ut.ud_id = ud.ud_id and ut.u_id = ? and ut.ud_id = u.u_id;";
		Query2="select count(*) from user_tracking_list where u_id = ?";
		//St=Db.prepareStatement(Query2);
		St = Db.prepareStatement(Query2);
		St.setInt(1,userId);
		Results= St.executeQuery();
		//Results=St.executeQuery();
		if(Results.next())
		{
			count = Results.getInt(1);
		}
		System.out.println("Count:\t" + count);
		St=Db.prepareStatement(Query);
		St.setInt(1, userId);
		Results=St.executeQuery();
		if(Results.next())
		{
			out.println("{\"users\":[");
			do
			{
				out.println("{\"username\":\""+Results.getString(1)+"\",\"ud_id\":\""+Results.getInt(2)+"\",\"count\":\""+Results.getInt(3)+"\"}" +
							((--count!=0)?",":""));
			}while(Results.next());
			out.println("]}");
		}

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