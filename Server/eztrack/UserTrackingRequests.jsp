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
		Query = "select u.username, u.u_id from users u, tracking_requests t where u.u_id = t.u_id and t.ud_id = ? and status = 'pending'";
		Query2="select count(*) from tracking_requests where ud_id = ? and status = 'pending'";
		//St=Db.prepareStatement(Query2);
		St = Db.prepareStatement(Query2);
		St.setInt(1,userId);
		Results= St.executeQuery();
		Results=St.executeQuery();
		if(Results.next())
		{
			count = Results.getInt(1);
		}
		System.out.println(count);
		St=Db.prepareStatement(Query);
		St.setInt(1, userId);
		Results=St.executeQuery();
		if(Results.next())
		{
			out.println("{\"users\":[");	
			do
			{
				out.println("{\"username\":\""+Results.getString(1)+"\",\"u_id\":\""+Results.getInt(2)+"\"}" +
								((--count!=0)?",":""));
				System.out.println("here!");
				
			}while(Results.next());
			out.println("]}");
		}
		else
		{
			//out.println("No Data");
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
