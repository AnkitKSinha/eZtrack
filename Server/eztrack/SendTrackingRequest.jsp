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
	String imei = request.getParameter("imei");
	
	System.out.println("u_id: " + userId + "imei: "+imei);
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
	int maxId=0;
	try
	{
		Query = "insert into tracking_requests values(?,?,?,'pending')";
		Query2="select max(tr_id) from tracking_requests";
		//St=Db.prepareStatement(Query2);
		St = Db.prepareStatement(Query2);
		Results= St.executeQuery();
// 		Results=St.executeQuery();
		if(Results.next())
		{
			maxId = Results.getInt(1);
		}
		maxId++;
		Query2= "select ud_id from user_devices where d_id = (select d_id from devices where imei = ?)";
		St= Db.prepareStatement(Query2);
		St.setString(1,imei);
		Results =St.executeQuery();
		
		if(Results.next())
		{
			St=Db.prepareStatement(Query);
			St.setInt(1,maxId);
			St.setInt(2,userId);
			St.setInt(3,Results.getInt(1));
			St.executeUpdate();
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