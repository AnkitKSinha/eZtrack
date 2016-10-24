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

	String fName= request.getParameter("fname");
	String lName= request.getParameter("lname");
	String username= request.getParameter("username");
	String email= request.getParameter("email");
	String password= request.getParameter("password");
	System.out.println("fname"+fName+"lname"+lName+"username"+username+"email"+email+"password"+password);
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
		Query = "select max(u_id) from users";
		St = Db.prepareStatement(Query);
		Results= St.executeQuery();
		int maxId=0;
		if(Results.next())
		{
			maxId=Results.getInt(1);
		}
		maxId++;
		
		System.out.println("username:" + username+" fname:" + fName);
		Query="insert into users values(?,?,?,?,?,?,' ',1)";
		St=Db.prepareStatement(Query);
		St.setInt(1,maxId);
		St.setString(2,username);
		St.setString(3,fName);
		St.setString(4,lName);
		St.setString(5,password);
		St.setString(6,email);
		St.executeUpdate();
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