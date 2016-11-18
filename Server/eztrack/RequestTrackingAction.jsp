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

	int toUser = Integer.parseInt(request.getParameter("u_id"));
	int fromUser = Integer.parseInt(request.getParameter("from"));
	String action = request.getParameter("action");
	
// 	System.out.println("u_id: " + touserId);
	System.out.println("toUser :"+toUser + "fromUser: "+fromUser+ "action:" + action);
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
		Query = "update tracking_requests set status = ? where u_id = ? and ud_id = ? ";
		St=Db.prepareStatement(Query);
		St.setString(1, action);
		St.setInt(2, fromUser);
		St.setInt(3,toUser);
		St.executeUpdate();
		
		if(action.matches("accept"))
		{
			Query2 ="select max(ut_id) from user_tracking_list";
			St= Db.prepareStatement(Query2);
			Results = St.executeQuery();
			if(Results.next())
			{
				maxId = Results.getInt(1);	
			}
			maxId++;
			Query2 = "insert into user_tracking_list values(?,?,?,1)";
			St = Db.prepareStatement(Query2);
			St.setInt(1,maxId);
			St.setInt(2,fromUser);
			St.setInt(3,toUser);
			St.executeUpdate();
			
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
