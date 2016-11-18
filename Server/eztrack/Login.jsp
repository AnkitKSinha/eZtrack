<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ page import="java.sql.*"%>
	<%@ page import="java.util.*"%>
	<%
// 	int SubjectId=Integer.parseInt(request.getParameter("Subject"));
// 	int QuestionId=Integer.parseInt(request.getParameter("QID"));
// 	String Question=request.getParameter("Question");
// // 	String Options=request.getParameter("OptionValues");
// 	int CorrectOption=Integer.parseInt(request.getParameter("Correct"));
// 	int IsActive=Integer.parseInt(request.getParameter("IsActive"));
	
// String[] Options = request.getParameterValues("Options[]");
// for (int i=0; i < Options.length; ++i) {
//    System.out.println(Options[i]+((i==CorrectOption)?" Correct":"")); 
   
// }

	String username= request.getParameter("username");
	String password= request.getParameter("password");
	
	System.out.println("username "+username+" password"+password);
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
	String Query=new String();
	try
	{
		Query = "select u_id, password from users where username = ?";
		St = Db.prepareStatement(Query);
		St.setString(1, username);
		Results= St.executeQuery();
		if(Results.next())
		{
			if(password.matches(Results.getString(2)))
			{
				out.println(Results.getInt(1));
			}
			else
			{
				out.println("fail");
			}
		}
		else
		{
			out.println("fail");
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